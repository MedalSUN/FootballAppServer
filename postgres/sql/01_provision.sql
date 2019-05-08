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
  img_user         text not null check (char_length(img_user) < 80) -- 目前此表只存储头像和logo。使用这个字段进行引用
  -- updated_at       timestamp default now(),
  -- created_at       timestamp default now()  
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
  -- team             text not null, -- person表中的team不能是引用football_team表的，注册时需要 ====2019-05-08 初始注册时不需要选择球队
  shirt_num        integer not null, -- 球衣号码
  player_img       uuid not null references ca.image(id), -- 球员的头像
  about            text   -- 个性签名
);


-- 球队基本信息表
-- 里面的数据不是任何人可以更改的，是由管理员增加的，每个赛季进行更改
create table ca.football_team (
   id               uuid DEFAULT gen_random_uuid () primary key,
   team_name        text not null check (char_length(team_name) < 80),
   team_logo        uuid not null references ca.image(id),
   member_number    integer not null default 0
);
grant select on table ca.football_team to ca_anonymous, ca_person;
comment on table ca.football_team is '球队基本信息表';


-- 球队和球员的关联表（因为下载注册的并不都是球队球员，因此需要在注册完之后才自由选择球队）
create table ca.person_team (
    person_id     uuid not null references ca.person(id), -- 注册的人
    team_id       uuid not null references ca.football_team(id) -- 球队
);
grant select on table ca.person_team to ca_anonymous, ca_person;
comment on table ca.person_team is '球队，球员的关联表';






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
      id                uuid not null references ca.match_schedule(id) primary key,
      -- oreder_id         uuid not null references ca.match_schedule(id), id外键接于赛程表的id （后期增加杯赛，那么使用order_number就不准了。）
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


-- =======注释：  助攻榜和射手榜的排名可以通过函数获取。，但是所有人的排名如何获取？？？？
-- ==== 因此 多出来两个表。

-- 射手榜
-- 描述球员的进球数 （倒序排行）
create table ca.shooter_list (
      -- id                uuid DEFAULT gen_random_uuid () primary key, 不需要再另添加主键，直接使用用户id即可
      shooter_id        uuid not null references ca.person(id) primary key,
      goal_num          integer not null default 0
);
grant select on table ca.shooter_list to ca_anonymous, ca_person;
comment on table ca.shooter_list is '射手榜';


-- 助攻榜
-- 描述球员的助攻数据
create table ca.assist_list (
      assist_id           uuid not null references ca.person(id) primary key,
      assist_num          integer not null default 0
);
grant select on table ca.assist_list to ca_anonymous, ca_person;
comment on table ca.assist_list is '助攻榜';

-- 每场比赛，所有的进球数据，（哪场比赛，谁进的，第几分钟进的， 谁助攻的）
create table ca.match_every_goal (
      id            uuid DEFAULT gen_random_uuid () primary key,
      match_id      uuid not null references ca.match_schedule(id),
      shooter_id    uuid not null references ca.person(id),
      goal_time     text not null,
      assist_id     uuid not null references ca.person(id) --描述助攻人的id   
);
grant select on table ca.match_every_goal to ca_anonymous, ca_person;
comment on table ca.match_every_goal is '每场比赛，每个进球的数据：射手，助攻人，时间';









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
  email_verified   boolean -- 不需要判断邮箱是否相同，在注册时需要查询一遍
  -- person_user_type user_type, 人员的类型
  -- updated_at       timestamp default now(),
  -- created_at       timestamp default now()
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
  shirt_num integer, -- 由于数据库中图片表存的是text格式，所以必须转成text格式进行查询
  -- team  text, ====2019-05-08注册时不需要添加球队信息，进入app后使用参加球队和球队关联
  email text,
  password text
) returns ca.person as $$
declare
  person ca.person;
  shirt_num_text text;
  shirt_id uuid;
begin

  shirt_num_text = shirt_num::text;
  select id into shirt_id from ca.image where img_user = shirt_num_text;

  insert into ca.person (player_name, shirt_num, player_img) values
    (player_name, shirt_num, shirt_id)
    returning * into person;

  insert into ca_private.person_account (person_id, email, password_hash) values
    (person.id, email, crypt(password, gen_salt('bf')));

  return person;
end;
$$ language plpgsql strict security definer;

comment on function ca.register_person(text, integer, text, text) is '注册一个用户';

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
grant execute on function ca.register_person(text,integer, text, text) to ca_anonymous;


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