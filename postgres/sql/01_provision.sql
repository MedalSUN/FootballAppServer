-- Local Sale database


begin;


-- DROP DATABASE IF EXISTS postgres;
DROP ROLE IF EXISTS ca_anonymous;
DROP ROLE IF EXISTS ca_person;
DROP ROLE IF EXISTS ca_postgraphql;

SET TIME ZONE 'UTC';

--- 

-- CREATE DATABASE postgres;
-- \c postgres
CREATE EXTENSION IF NOT EXISTS "pgcrypto"; -- Postgres pgcrypto扩展 用于加密
CREATE EXTENSION IF NOT EXISTS "citext"; 

CREATE SCHEMA ca;
CREATE SCHEMA ca_private;

CREATE ROLE ca_postgraphile LOGIN PASSWORD 'password'; 
CREATE ROLE ca_anonymous;
GRANT ca_anonymous TO ca_postgraphile; 
CREATE ROLE ca_person; 
GRANT ca_person TO ca_postgraphile;
GRANT ca_anonymous TO ca_person;





-- 图片表，所有的图片都存放在这一张表里，其他地方进行引用即可
create table ca.image (
  id               uuid DEFAULT gen_random_uuid () primary key,
  url              text,
  img_user             text not null check (char_length(img_user) < 80),-- 目前此表只存储头像和logo。使用这个字段进行引用
  updated_at       timestamp default now(),
  created_at       timestamp default now()  
);
grant select on table ca.image to ca_anonymous, ca_person;
grant update, insert on table ca.image to ca_person;
comment on table ca.image is '有球app所有的图片，暂定只存头像，和球衣号码相关联';





-- 注意： 球员基本信息表的权限还没有进行设置！！！！
-- 球员基本信息表  （需要：1:更改名称；2:增加成员的球衣号码；3:球衣号码和头像进行关联）
create table ca.person (
  id               uuid DEFAULT gen_random_uuid () primary key,
  player_name      text not null check (char_length(player_name) < 80),
  --last_name        text check (char_length(last_name) < 80),
  team             text not null, -- person表中的team不能是引用football_team表的，注册时需要
  shirt_num        integer not null, -- 球衣号码
  -- avatar           text, -- 未知意义
  -- birth_day        date,
  -- about            text,
  -- header_img       uuid not null  references ca.image(id), -- 在这张表之前需要创建一个image表，用于存放图片头像
  -- chat_state       chat_state_type default 'ACTIVE', 聊天状态，在线还是隐身，这里不需要
  -- hide_speaker     boolean default false,
  -- gift_barrier     integer default 0, 礼物信息，不需要
  -- chat_id          text not null unique,  -- 这一部分是为了能够和leancloud进行连接的聊天id  在jwt中有需要 -- 2019-05-04删除chat_id字段
  updated_at       timestamp default now(),
  created_at       timestamp default now()
);


-- 球队基本信息表
-- 里面的数据不是任何人可以更改的，是由管理员增加的，每个赛季进行更改
create table ca.football_team (
   id               uuid DEFAULT gen_random_uuid () primary key,
   team_name        text not null check (char_length(team_name) < 80),
   member_number    integer not null default 25
);
grant select on table ca.football_team to ca_anonymous, ca_person;
comment on table ca.football_team is '球队基本信息表';


-- 球队与球员的关联信息表
create table ca.person_team (
    person_id       uuid not null references ca.person(id),
    team_id         uuid not null references ca.football_team(id)
);
grant select on table ca.person_team to ca_anonymous, ca_person;
-- grant update, insert on table ca.person_team to ca_person; 关联表的插入更新应该由注册函数操作完成，不能直接授权于登录用户
comment on table ca.person_team is '球队与球员的关联信息表';



-- 场地基本信息表
create table ca.football_court (
     id              uuid DEFAULT gen_random_uuid () primary key,
     court_name      text not null check (char_length(court_name) < 80),
     court_location      text not null check (char_length(court_location) < 80)
);
-- 只是将场地的查询权限更新，原始数据是由管理员完成
grant select on table ca.football_court to ca_anonymous, ca_person;
comment on table ca.football_court is '球场基本信息表';

-- 赛程表
-- 赛程表也是由管理员在赛季初插入数据
create table ca.match_schedule (
      id              uuid DEFAULT gen_random_uuid () primary key,
      order_number    integer, -- 场序
      wheel_number    integer, -- 比赛轮数
      match_date      text not null check (char_length(match_date) < 80), -- 比赛日期（为了方便，直接设置为text格式）
      team_a          uuid not null references ca.football_team(id), -- 主队
      team_b          uuid not null references ca.football_team(id),   -- 客队
      match_location  uuid not null references ca.football_court(id)  -- 场地
);
grant select on table ca.match_schedule to ca_anonymous, ca_person;
comment on table ca.match_schedule is '赛程信息表';


-- 每场比赛的进球数表
-- 描述各个场序的比赛的进球数据
create table ca.match_goal (
      id                uuid DEFAULT gen_random_uuid () primary key,
      oreder_id         uuid not null references ca.match_schedule(id),
      goal_a            integer,-- 主队进球数
      goal_b            integer--客队进球数
);
grant select on table ca.match_goal to ca_anonymous, ca_person;
comment on table ca.match_goal is '每场比赛的进球数';

-- 积分表
-- 描述每个队的积分情况
create table ca.score (
      id                uuid DEFAULT gen_random_uuid () primary key,
      team_id           uuid not null references ca.football_team(id),
      team_score        integer not null default 0
);
grant select on table ca.score to ca_anonymous, ca_person;
comment on table ca.score is '每个球队的积分';


-- 射手榜
-- 描述球员的进球数 （倒序排行）
create table ca.shooter_list (
      id                uuid DEFAULT gen_random_uuid () primary key,
      shooter_id        uuid not null references ca.person(id),
      goal_num          integer not null default 0
);
grant select on table ca.shooter_list to ca_anonymous, ca_person;
comment on table ca.shooter_list is '射手榜';















-- 修改默认权限： 删除授予函数的公共权限（对于接下来的函数）
-- 默认情况下，函数可以由public执行。由于我们在此处对函数权限应用了细粒度控制，因此我们删除了默认授权。请注意，此行需要放在任何函数定义之前。
alter default privileges revoke execute on functions from public;


-- 创建数据类型，定义人员的角色（普通，企业，管理）  ===目前这里并不需要
-- CREATE TYPE user_type AS ENUM ('normal', 'business', 'admin');


-- 创建 保密级别的账户表（外界无法访问到）
create table ca_private.person_account (
  person_id        uuid primary key references ca.person(id) on delete cascade,
  email            text not null unique check (email ~* '^.+@.+\..+$'),
  password_hash    text not null,
  phone_number     text, -- 不需要电话号码
  email_verified   boolean, -- 不需要判断邮箱是否相同，在注册时需要查询一遍
  -- person_user_type user_type, 人员的类型
  updated_at       timestamp default now(),
  created_at       timestamp default now()
);

-- 这里对private级别的账户信息授予权限，需要做进一步考虑========
-- grant select on table ca_private.person_account to ca_anonymous, ca_person;
-- grant update on table ca_private.person_account to ca_person;
-- comment on table ca_private.person_account is 'Private information about a person’s account.';
-- comment on column ca_private.person_account.password_hash is 'An opaque hash of the person’s password.';



-- 创建函数： 用于注册用户 【修改名称和球衣号码等注册信息】
-- 分别往两张表中插入信息：将名字插入ca.person将密码等插入ca_private.person_account
-- 2019-05-04 更改注册时字段name
create function ca.register_person(
  player_name text,
  -- last_name text,
  email text,
  password text
) returns ca.person as $$
declare
  person ca.person;
begin
  insert into ca.person (player_name) values
    (player_name)
    returning * into person;

  insert into ca_private.person_account (person_id, email, password_hash) values
    (person.id, email, crypt(password, gen_salt('bf')));

  return person;
end;
$$ language plpgsql strict security definer;

comment on function ca.register_person(text, text, text) is '注册一个用户';

-- 创建一个数据类型： jwt
create type ca.jwt as (
  -- role text, 数据库中只有一个角色
  person_id uuid,
  exp integer
);

-- 创建一个数据类型：用于设定返回值authReturnType
-- chat_id是用于leancloud 即时通讯的 （chat_id text 已删除）
CREATE TYPE auth_return_type AS (jwt ca.jwt, id uuid);


-- 创建一个函数登录时使用，用于返回 authReturnType（GraphQL转换成驼峰法则）
-- 使用postgres的复合值输入法生成jwt
-- 可以在返回值中获取到 jwt，用户id，chat_id
CREATE FUNCTION ca.authenticate ( 
  email text, 
  password text 
) returns auth_return_type as $$ 
DECLARE 
  account ca_private.person_account; 
BEGIN 
  SELECT a.* INTO account 
  FROM ca_private.person_account as a 
  WHERE a.email = $1; 

  if account.password_hash = crypt(password, account.password_hash) then 
    return ((account.person_id, extract(epoch from (now() + interval '1 week')))::ca.jwt, account.person_id)::auth_return_type; 
  else 
    return null; 
  end if; 
END; 
$$ language plpgsql strict security definer;

comment on function ca.authenticate(text, text) is '登录用户验证成功后创建token并返回';




-- 创建函数用于获取当前登陆的用户id 
create or replace function ca.current_person_id() returns uuid as $$
  select current_setting('jwt.claims.person_id', true)::uuid;
$$ language sql stable;
comment on function ca.current_person_id() is '数据库中进行操作，获取jwt中的person_id';

-- 创建函数用于获取当前登陆的用户,返回登录用户对象
create function ca.current_person() returns  ca.person as $$
  select *
  from ca.person
  where id = current_setting('jwt.claims.person_id')::uuid
$$ language sql stable;

comment on function ca.current_person() is '数据库中进行操作，获取jwt中的person_id所指定的对象';


grant usage on schema  ca to ca_anonymous, ca_person;

grant select on table ca.person to ca_anonymous, ca_person;
grant update, delete on table  ca.person to ca_person;


--grant execute on function ca.person_full_name(ca.person) to ca_anonymous, ca_person;
grant execute on function ca.authenticate(text, text) to ca_anonymous, ca_person;
grant execute on function ca.current_person() to ca_anonymous, ca_person;
grant execute on function ca.current_person_id() to ca_anonymous, ca_person;

-- 给非登录用户授予注册权限
grant execute on function ca.register_person(text, text, text) to ca_anonymous;


-- 在表上启用行级安全性
alter table ca.person enable row level security;


-- 重新启用对所有行的访问
create policy select_person on ca.person for select
  using (true);

create policy update_person on ca.person for update to ca_person
  using (id = current_setting('jwt.claims.person_id')::uuid);

create policy delete_person on ca.person for delete to ca_person
  using (id = current_setting('jwt.claims.person_id')::uuid);









commit;