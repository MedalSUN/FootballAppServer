-- 创建函数：用于用户注册后，进入app模块，参加球队
create function ca.join_team(
    _team_name text
) returns text as $$
declare
    team_current_num integer;
    team_id uuid;
    _person_id uuid;
begin
    _person_id := ca.current_person_id();
    if _person_id is null then
        return '未登录，请先登录';
    end if;
    select member_number into team_current_num from ca.football_team where team_name = _team_name;
    select id into team_id from ca.football_team where team_name = _team_name;

    if team_current_num < 7 then
        insert into ca.person_team (person_id, team_id) values
        (_person_id, team_id);
        return '参加球队成功';
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