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


-- 创建函数用于增加比赛的具体每一个进球
create function ca.change_match_goal_details(
    _team_id uuid,
    _match_id uuid,
    _shooter_id uuid,
    _goal_time text,
    _assist_id uuid
) returns text as $$
declare
    _admin_person_id uuid;
    _team_a_id uuid;
    _match_goal_flag boolean;
    _old_goal_num integer;
    _shooter_list_flag boolean;
    _assist_list_flag boolean;
begin
    _admin_person_id := ca.current_admin_person_id();
    if _admin_person_id is null then
        return '未登录，请先登录';  
    else 
        insert into ca.match_every_goal(match_id, shooter_id, goal_time, assist_id) values
            (_match_id, _shooter_id, _goal_time, _assist_id);
        select 1 into _shooter_list_flag from ca.shooter_list where shooter_id = _shooter_id; -- 判断射手榜中是否已经有这个射手的记录
        if _shooter_list_flag is true then
            update ca.shooter_list set goal_num = goal_num + 1 where shooter_id = _shooter_id;
        else
            insert into ca.shooter_list(shooter_id, goal_num) values
            (_shooter_id, 1);
        end if;
        select 1 into _assist_list_flag from ca.assist_list where assist_id = _assist_id; -- 判断助攻榜中是否已经有这个球员的记录
        if _assist_list_flag is true then
            update ca.assist_list set assist_num = assist_num + 1 where assist_id = _assist_id;
        else
            insert into ca.assist_list(assist_id, assist_num) values
            (_assist_id, 1);
        end if;
        -- 下面是判断比赛比分表中数据
        select 1 into _match_goal_flag from ca.match_goal where id = _match_id;
        if _match_goal_flag is true then -- 比分表中已经存在当前赛事，只能update不能insert
            select team_a into _team_a_id from ca.match_schedule where id = _match_id; -- 判断是主客队
            if _team_a_id = _team_id then
                update ca.match_goal set goal_a = goal_a + 1 where id = _match_id;
                return '主队进球增加成功';
            else
                update ca.match_goal set goal_b = goal_b + 1 where id = _match_id;
                return '客队进球增加成功';
            end if;
        else 
            select team_a into _team_a_id from ca.match_schedule where id = _match_id;
            if _team_a_id = _team_id then 
                insert into ca.match_goal(id, goal_a, goal_b) values
                    (_match_id, 1, 0);
                    return '主队首次进球增加成功';
            else 
                insert into ca.match_goal(id, goal_a, goal_b) values
                    (_match_id, 0, 1);
                    return '客队首次进球增加成功';
            end if;
        end if;
    end if;
    return  '进球增加失败';
end;
$$ language plpgsql strict security definer;
comment on function ca.change_match_goal_details(uuid, uuid, uuid, text, uuid) is '管理员增加比分';
grant execute on function ca.change_match_goal_details(uuid, uuid, uuid, text, uuid) to ca_anonymous, ca_person;


-- 创建函数，用于将ca.match_goal中的finished字段转变为true，完成整场比赛的比分统计
create function ca.finished_match_goal(
    _team_a_id uuid,
    _team_b_id uuid,
    _match_id uuid
) returns text as $$
declare
    _admin_person_id uuid;
    _team_a_num integer;
    _team_b_num integer;
begin
    _admin_person_id := ca.current_admin_person_id();
    if _admin_person_id is null then
        return '未登录，请先登录';  
    else
        update ca.match_goal set finished = true where id = _match_id;
        select goal_a into _team_a_num from ca.match_goal where id = _match_id;
        select goal_b into _team_b_num from ca.match_goal where id = _match_id;
        if _team_a_num > _team_b_num then
            update ca.score set team_score = team_score + 3 where team_id = _team_a_id;
            return '比分统计完毕,主队胜利';
        elsif _team_a_num = _team_b_num then
            update ca.score set team_score = team_score + 1 where team_id = _team_a_id;
            update ca.score set team_score = team_score + 1 where team_id = _team_b_id;
            return '比分统计完毕,两队平局';
        else
            update ca.score set team_score = team_score + 3 where team_id = _team_b_id;
            return '比分统计完毕,客队胜利';
        end if;
        return '比分统计关闭失败';
    end if;
    return '比分统计关闭失败';
end;
$$ language plpgsql strict security definer;
comment on function ca.finished_match_goal(uuid, uuid, uuid) is '管理员关闭比分统计';
grant execute on function ca.finished_match_goal(uuid, uuid, uuid) to ca_anonymous, ca_person;


-- 创建函数： 用于接受审批结果
create function ca.approval(
    _person_id uuid,
    _approval_result text
) returns text as $$
declare
    _admin_person_id uuid;
begin
    _admin_person_id := ca.current_admin_person_id();
    if _admin_person_id is null then
        return '未登录，请先登录';
    else
        if _approval_result = 'yes' then
            update ca.person_team set checked = true where person_id = _person_id;
                return '审批通过成功';
        else
            delete from ca.person_team where person_id = _person_id;
                return '审批驳回成功';
        end if;
    end if;
    return '审批失败';
end;
$$ language plpgsql strict security definer;
comment on function ca.approval(uuid, text) is '管理员审批用户参加球队';
grant execute on function ca.approval(uuid, text) to ca_anonymous, ca_person;