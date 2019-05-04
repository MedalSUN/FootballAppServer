begin;



-- simulate data for ca.image
insert into ca.image (url, img_user) values
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '1'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2265761240.jpg', '2'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2266110047.jpg', '3'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '4'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '5'),
  
  ('https://thumbnail0.baidupcs.com/thumbnail/711491bd276393a4b83c7a3704026b5f?fid=211418021-250528-68627519701744&time=1556949600&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-loO1FJ1NGJG5QhY0hBqXye9UwYY%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2866359492817440018&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '信电logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/67a1cb1800021d443d6d81d7e1cd4815?fid=211418021-250528-18115142341781&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-ZZVYsN3V43oupmFUs09adU4YSVo%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867779824426447168&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '外院logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/42679818779b0a8a85d323c2fc8e5e3a?fid=211418021-250528-840258939908874&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-w04HZS4AsL%2FSRdnXhE3usEqnX%2FM%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867796586987936643&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '统计logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/2c5da713245f05dd2393f54db738d88c?fid=211418021-250528-175770664835460&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-sNylbWgT57%2FlELENG%2Bd8Jbs7vrg%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867853367690013616&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '数学logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/423db2eb5eb2604f8de708fc1820c59f?fid=211418021-250528-1090673824518293&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-gNiqssJcvpv%2FYCkUnqg593uvqM4%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867868255187456377&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '经济logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/465ca5f262abd2caa580ab13112e0951?fid=211418021-250528-738265993775332&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-psGcGuEY9h1xzgTDD00pzBiO4t8%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867924055703217378&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '金融logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/70d1f1e8a6401d3bb89082c7951079b2?fid=211418021-250528-1058070576070843&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-08yMSRJUdWG6utdv2jV7aYqL9Do%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867901713495157401&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '教工logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/e6cc0ea1d981dc897771ce2a7f27f005?fid=211418021-250528-817647908071773&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-MYYpIdxjcIW%2F95OjREB6p3j5uJM%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867913036579603770&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '计科logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/6ffdba5024f5b505ae192267e9c4ab23?fid=211418021-250528-1039920569835393&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-fR2T0q09b%2FZxRSl7IlpacyDR61Q%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867937789108360891&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '会计logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/7c77f8870ab414f284849ebad3170a8a?fid=211418021-250528-586571305613374&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-iq3vSe%2FspTlc9sRtMRHJwtfEyYk%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867948426167662691&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '国商logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/d2777539dc24dd1d1d6cac527622f345?fid=211418021-250528-723974583356235&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-8%2FWAIPWRFU%2B7H6LkiUmeXyUs03c%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867957486622132194&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '公法logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/5cf000c5ce2d9fa6447c78477c5476ef?fid=211418021-250528-455897649120603&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-bJTfgGNA0EUhnELCPCI1uiKUgwk%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867967277298578216&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '工商logo'),
  ('https://thumbnail0.baidupcs.com/thumbnail/cccdac13760486fbc4281363a24ef50c?fid=211418021-250528-777869652266226&time=1556953200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-cj7JRdhlva9roYEh%2B55SvUsFigg%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=2867976870885512814&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '工程logo');


-- simulate data for ca.person
insert into ca.person (player_name, team, shirt_num) values
  ('胡存浩', '工程足球队', 9),
  ('郭林亿', '信电足球队', 11),
  ('李浩', '工商足球队', 10),
  ('徐强', '公法足球队', 6),
  ('李进', '会计足球队', 8),
  ('王锗凌', '数学足球队', 9),
  ('李向远', '经济足球队', 7),
  ('王东洋', '金融足球队', 7),
  ('肖朝义', '外院足球队', 12),
  ('郝嘉琪', '计科足球队', 9),
  ('李晓峰', '国商足球队', 6),
  ('吕长海', '教工足球队', 7),
  ('贾睿智', '统计足球队', 10);

--球员账户的模拟数据
insert into ca_private.person_account (person_id, email, password_hash) values
  ((select id from ca.person where player_name = '胡存浩'), 'test@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '郭林亿'), 'test1@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '李浩'), 'test2@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '徐强'), 'test3@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '李进'), 'test4@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '王锗凌'), 'test5@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '李向远'), 'test6@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '王东洋'), 'test7@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '肖朝义'), 'test8@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '郝嘉琪'), 'test9@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '李晓峰'), 'test10@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '吕长海'), 'test11@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '贾睿智'), 'test12@test.test', crypt('123', gen_salt('bf')));  
   
  
-- 球队基本信息的初始模拟数据
insert into ca.football_team (team_name, member_number) values
  ('工程足球队', 25),
  ('工商足球队', 25),
  ('公法足球队', 25),
  ('会计足球队', 25),
  ('数学足球队', 25),
  ('经济足球队', 25),
  ('金融足球队', 25),
  ('信电足球队', 25),
  ('外院足球队', 25),
  ('计科足球队', 25),
  ('国商足球队', 25),
  ('教工足球队', 25),
  ('统计足球队', 25);

-- 球队与球员的关联表模拟数据
insert into ca.person_team (person_id, team_id) values 
((select id from ca.person where player_name = '胡存浩'), (select id from ca.football_team where team_name = '工程足球队')),
((select id from ca.person where player_name = '郭林亿'), (select id from ca.football_team where team_name = '信电足球队')),
((select id from ca.person where player_name = '李浩'), (select id from ca.football_team where team_name = '工商足球队')),
((select id from ca.person where player_name = '郝嘉琪'), (select id from ca.football_team where team_name = '计科足球队')),
((select id from ca.person where player_name = '徐强'), (select id from ca.football_team where team_name = '公法足球队')),
((select id from ca.person where player_name = '李进'), (select id from ca.football_team where team_name = '计科足球队')),
((select id from ca.person where player_name = '王锗凌'), (select id from ca.football_team where team_name = '数学足球队')),
((select id from ca.person where player_name = '李向远'), (select id from ca.football_team where team_name = '经济足球队')),
((select id from ca.person where player_name = '王东洋'), (select id from ca.football_team where team_name = '金融足球队')),
((select id from ca.person where player_name = '肖朝义'), (select id from ca.football_team where team_name = '外院足球队')),
((select id from ca.person where player_name = '李晓峰'), (select id from ca.football_team where team_name = '国商足球队')),
((select id from ca.person where player_name = '吕长海'), (select id from ca.football_team where team_name = '教工足球队')),
((select id from ca.person where player_name = '贾睿智'), (select id from ca.football_team where team_name = '统计足球队'));


-- 球场的基本信息表的初始模拟数据
insert into ca.football_court (court_name, court_location) values 
('山商诺坎普', '山东工商学院东校东操场'),
('山商卡尔德隆', '山东工商学院东校小操场'),
('山商伯纳乌', '山东工商学院西校操场');

-- 赛程表的模拟数据
-- 1:场序 2:轮数 3: 比赛日期 4:主队  5:客队 6: 比赛地点
insert into ca.match_schedule (order_number, wheel_number, match_date, team_a, team_b, match_location) values 
(1, 1, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
(2, 1, '2018-10-10', (select id from ca.football_team where team_name = '教工足球队'), (select id from ca.football_team where team_name = '金融足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
(3, 1, '2018-10-10', (select id from ca.football_team where team_name = '国商足球队'), (select id from ca.football_team where team_name = '经济足球队'), (select id from ca.football_court where court_name = '山商伯纳乌')),
(4, 1, '2018-10-11', (select id from ca.football_team where team_name = '工商足球队'), (select id from ca.football_team where team_name = '公法足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
(5, 1, '2018-10-12', (select id from ca.football_team where team_name = '统计足球队'), (select id from ca.football_team where team_name = '数学足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
(6, 1, '2018-10-12', (select id from ca.football_team where team_name = '会计足球队'), (select id from ca.football_team where team_name = '工程足球队'), (select id from ca.football_court where court_name = '山商伯纳乌'));

-- (7, 2, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (8, 2, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (9, 2, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (10, 2, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (11, 2, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (12, 2, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (13, 3, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (14, 3, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (15, 3, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (16, 3, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (17, 3, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
-- (18, 3, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),




-- 进球表的模拟数据
insert into ca.match_goal (oreder_id, goal_a, goal_b) values
  ((select id from ca.match_schedule where order_number = 1), 1, 3),
  ((select id from ca.match_schedule where order_number = 2), 3, 0),
  ((select id from ca.match_schedule where order_number = 3), 5, 0),
  ((select id from ca.match_schedule where order_number = 4), 5, 1),
  ((select id from ca.match_schedule where order_number = 5), 1, 1),
  ((select id from ca.match_schedule where order_number = 6), 0, 1);


-- 积分表的模拟数据（查数据时，按照倒序进行排列）
insert into ca.score (team_id, team_score) values
  ((select id from ca.football_team where team_name = '计科足球队'), 0),
  ((select id from ca.football_team where team_name = '信电足球队'), 3),
  ((select id from ca.football_team where team_name = '教工足球队'), 3),
  ((select id from ca.football_team where team_name = '金融足球队'), 0),
  ((select id from ca.football_team where team_name = '国商足球队'), 3),
  ((select id from ca.football_team where team_name = '经济足球队'), 0),
  ((select id from ca.football_team where team_name = '工商足球队'), 3),
  ((select id from ca.football_team where team_name = '公法足球队'), 0),
  ((select id from ca.football_team where team_name = '统计足球队'), 1),
  ((select id from ca.football_team where team_name = '数学足球队'), 1),
  ((select id from ca.football_team where team_name = '会计足球队'), 0),
  ((select id from ca.football_team where team_name = '工程足球队'), 3),
  ((select id from ca.football_team where team_name = '外院足球队'), 0);


-- 射手榜的模拟数据（查数据时，按照倒序进行排列）
insert into ca.shooter_list (shooter_id, goal_num) values  
  ((select id from ca.person where player_name = '郭林亿'), 3),
  ((select id from ca.person where player_name = '吕长海'), 3),
  ((select id from ca.person where player_name = '李晓峰'), 5),
  ((select id from ca.person where player_name = '李浩'), 5),
  ((select id from ca.person where player_name = '徐强'), 1),
  ((select id from ca.person where player_name = '贾睿智'), 1),
  ((select id from ca.person where player_name = '王锗凌'), 1),
  ((select id from ca.person where player_name = '胡存浩'), 1),
  ((select id from ca.person where player_name = '郝嘉琪'), 1);


commit;