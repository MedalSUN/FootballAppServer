-- 创建函数：用于用户注册后，进入app模块，参加球队
create function ca.join_team(
    _team_name text
) returns text as $$
declare
    team_current_num integer;
    team_id uuid;
    _person_id uuid;
    repeat_join boolean;
begin
    _person_id := ca.current_person_id();
    if _person_id is null then
        return '未登录，请先登录';
    end if;
    -- 注意管理员在审批通过申请之后，必须要在football_team表中的数量加一
    select member_number into team_current_num from ca.football_team where team_name = _team_name;
    select id into team_id from ca.football_team where team_name = _team_name;

    select 1 into repeat_join from ca.person_team where person_id = _person_id;
    if repeat_join is true then
        return '你已经申请过，或者加入过球队了！';
    end if;   
    if team_current_num < 7 then
        insert into ca.person_team (person_id, team_id) values
        (_person_id, team_id);
        return '已成功申请，请耐心等待';
    else
        return '名额已满，谢谢惠顾';
    end if;

    return null;
end;
$$ language plpgsql strict security definer;
comment on function ca.join_team(text) is '注册用户参加球队';
grant execute on function ca.join_team(text) to ca_anonymous, ca_person;

-- 创建函数，用于更改个性签名
create function ca.change_person_about(
    _about text
) returns text as $$
declare
    _person_id uuid;
begin
    _person_id := ca.current_person_id();
    if _person_id is null then
        return '未登录，请先登录';
    else
        update ca.person set about = _about where id = _person_id;
        return '修改签名成功';
    end if;
    return '修改失败';
end;
$$ language plpgsql strict security definer;
comment on function ca.change_person_about(text) is '用户修改个性签名';
grant execute on function ca.change_person_about(text) to ca_anonymous, ca_person;


-- 创建函数，用于增加赛程
-- 球队与球场需要在这个function中转换成各自的id再存储起来。
-- 虽然使用current_admin_person_id但是它并不能区分是管理员还是用户
create function ca.change_match_schedule(
    _order_number integer,
    _wheel_number integer,
    _match_date text,
    _team_a_id uuid,
    _team_b_id uuid,
    _match_location uuid
) returns text as $$
declare
    _admin_person_id uuid;
begin
    _admin_person_id := ca.current_admin_person_id();
    if _admin_person_id is null then
        return '未登录，请先登录';
    else 
        insert into ca.match_schedule(order_number, wheel_number, match_date, team_a, team_b, match_location) values
            (_order_number, _wheel_number, _match_date, _team_a_id, _team_b_id, _match_location);
            return '赛程增加成功';
    end if;
    return '增加赛程失败';
end;
$$ language plpgsql strict security definer;
comment on function ca.change_match_schedule(integer, integer, text, uuid, uuid, uuid) is '管理员增加赛程';
grant execute on function ca.change_match_schedule(integer, integer, text, uuid, uuid, uuid) to ca_anonymous, ca_person;

-- 创建函数：用于增加指定的比赛的比分情况
create function ca.change_match_goal(
    _match_id uuid,
    _goal_a integer,
    _goal_b integer
) returns text as $$
declare
    _admin_person_id uuid;
begin
    _admin_person_id := ca.current_admin_person_id();
    if _admin_person_id is null then
        return '未登录，请先登录';
    else
        insert into ca.match_goal(id, goal_a, goal_b) values
            (_match_id, _goal_a, _goal_b);
            return '比分增加成功';
    end if;
    return '增加比分失败';
end;
$$ language plpgsql strict security definer;
comment on function ca.change_match_goal(uuid, integer, integer) is '管理员增加比赛比分';
grant execute on function ca.change_match_goal(uuid, integer, integer) to ca_anonymous, ca_person;