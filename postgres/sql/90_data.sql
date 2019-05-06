begin;



-- simulate data for ca.image
insert into ca.image (url, img_user) values
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '1'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2265761240.jpg', '2'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2266110047.jpg', '3'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '4'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '5'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '6'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '7'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '8'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '9'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '10'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '11'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '12'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '13'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '14'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '15'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '16'),
  
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpstfup2ohq.jpeg', '信电logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpszho5efb5.jpeg', '外院logo'),
  ('https://s36.photobucket.com/user/MedalSUN/media/logo_zpsbklxt6ri.jpeg', '统计logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zps28vupjhj.jpeg', '数学logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsvgemz4qa.jpeg', '经济logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsrjfg7ifc.jpeg', '金融logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsltnosqk2.jpeg', '教工logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zps8fb2up4y.jpeg', '计科logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsfncjof6u.jpeg', '会计logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpssowuyvjp.jpeg', '国商logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsmq9rbl04.jpeg', '公法logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zps5b4ky2aw.jpeg', '工商logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsuvfvse4h.jpeg', '工程logo');


-- simulate data for ca.person
insert into ca.person (player_name, team, shirt_num, player_img) values
  ('胡存浩', '工程足球队', 9, (select id from ca.image where img_user = '9')),
  ('郭林亿', '信电足球队', 11, (select id from ca.image where img_user = '11')),
  ('李浩', '工商足球队', 10, (select id from ca.image where img_user = '10')),
  ('徐强', '公法足球队', 6, (select id from ca.image where img_user = '6')),
  ('李进', '会计足球队', 8, (select id from ca.image where img_user = '8')),
  ('王锗凌', '数学足球队', 9, (select id from ca.image where img_user = '9')),
  ('李向远', '经济足球队', 7, (select id from ca.image where img_user = '7')),
  ('王东洋', '金融足球队', 7, (select id from ca.image where img_user = '7')),
  ('肖朝义', '外院足球队', 12, (select id from ca.image where img_user = '12')),
  ('郝嘉琪', '计科足球队', 9, (select id from ca.image where img_user = '9')),
  ('李晓峰', '国商足球队', 6, (select id from ca.image where img_user = '6')),
  ('吕长海', '教工足球队', 7, (select id from ca.image where img_user = '7')),
  ('贾睿智', '统计足球队', 10, (select id from ca.image where img_user = '10'));

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
insert into ca.football_team (team_name, team_logo, member_number) values
  ('工程足球队',(select id from ca.image where img_user = '工程logo'), 25),
  ('工商足球队',(select id from ca.image where img_user = '工商logo'), 25),
  ('公法足球队',(select id from ca.image where img_user = '公法logo'), 25),
  ('会计足球队',(select id from ca.image where img_user = '会计logo'), 25),
  ('数学足球队',(select id from ca.image where img_user = '数学logo'), 25),
  ('经济足球队',(select id from ca.image where img_user = '经济logo'), 25),
  ('金融足球队',(select id from ca.image where img_user = '金融logo'), 25),
  ('信电足球队',(select id from ca.image where img_user = '信电logo'), 25),
  ('外院足球队',(select id from ca.image where img_user = '外院logo'), 25),
  ('计科足球队',(select id from ca.image where img_user = '计科logo'), 25),
  ('国商足球队',(select id from ca.image where img_user = '国商logo'), 25),
  ('教工足球队',(select id from ca.image where img_user = '教工logo'), 25),
  ('统计足球队',(select id from ca.image where img_user = '统计logo'), 25);


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