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
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '17'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '18'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '19'),
  ('https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', '20'),
  
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpstfup2ohq.jpeg', '信电logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpszho5efb5.jpeg', '外院logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsltnosqk2.jpeg', '教工logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zps8fb2up4y.jpeg', '计科logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsfncjof6u.jpeg', '会计logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpssowuyvjp.jpeg', '国商logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zps5b4ky2aw.jpeg', '工商logo'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/logo_zpsuvfvse4h.jpeg', '工程logo');


-- simulate data for ca.person
insert into ca.person (player_name, shirt_num, player_img) values
-- 工程足球队
  ('胡存浩', 9, (select id from ca.image where img_user = '9')),
  ('潘辞', 17, (select id from ca.image where img_user = '17')),
-- 信电足球队
  ('郭林亿', 11, (select id from ca.image where img_user = '11')),
  ('刘一材', 7, (select id from ca.image where img_user = '7')),
-- 工商足球队
  ('李浩', 10, (select id from ca.image where img_user = '10')),
  ('陈煜', 11, (select id from ca.image where img_user = '11')),
-- 会计足球队
  ('李进', 8, (select id from ca.image where img_user = '8')),
  ('张泽林', 10, (select id from ca.image where img_user = '10')),
-- 外院足球队
  ('肖朝义', 12, (select id from ca.image where img_user = '12')),
  ('肖向东', 11, (select id from ca.image where img_user = '11')),
-- 计科足球队
  ('郝嘉琪', 9, (select id from ca.image where img_user = '9')),
  ('邢开程', 8, (select id from ca.image where img_user = '8')),
-- 国商足球队
  ('李晓峰', 6, (select id from ca.image where img_user = '6')),
  ('李翔', 7, (select id from ca.image where img_user = '7')),
-- 教工足球队
  ('吕长海', 7, (select id from ca.image where img_user = '7')),
  ('牛勇平', 12, (select id from ca.image where img_user = '12'));

--球员账户的模拟数据
insert into ca_private.person_account (person_id, email, password_hash) values
  -- 工程足球队
  ((select id from ca.person where player_name = '胡存浩'), 'test@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '潘辞'), 'test8@test.test', crypt('123', gen_salt('bf'))),
  -- 信电足球队
  ((select id from ca.person where player_name = '郭林亿'), 'test1@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '刘一材'), 'test9@test.test', crypt('123', gen_salt('bf'))),
  -- 工商足球队
  ((select id from ca.person where player_name = '李浩'), 'test2@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '陈煜'), 'test10@test.test', crypt('123', gen_salt('bf'))),
  -- 会计足球队
  ((select id from ca.person where player_name = '李进'), 'test3@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '张泽林'), 'test11@test.test', crypt('123', gen_salt('bf'))),
  -- 外院足球队
  ((select id from ca.person where player_name = '肖朝义'), 'test4@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '肖向东'), 'test12@test.test', crypt('123', gen_salt('bf'))),
  -- 计科足球队
  ((select id from ca.person where player_name = '郝嘉琪'), 'test5@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '邢开程'), 'test13@test.test', crypt('123', gen_salt('bf'))),
  -- 国商足球队
  ((select id from ca.person where player_name = '李晓峰'), 'test6@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '李翔'), 'test14@test.test', crypt('123', gen_salt('bf'))),
  -- 教工足球队
  ((select id from ca.person where player_name = '吕长海'), 'test7@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where player_name = '牛勇平'), 'test15@test.test', crypt('123', gen_salt('bf')));
   
  
-- 球队基本信息的初始模拟数据
insert into ca.football_team (team_name, team_logo, member_number) values
  ('工程足球队',(select id from ca.image where img_user = '工程logo'), 2),
  ('工商足球队',(select id from ca.image where img_user = '工商logo'), 2),
  ('会计足球队',(select id from ca.image where img_user = '会计logo'), 2),
  ('信电足球队',(select id from ca.image where img_user = '信电logo'), 2),
  ('外院足球队',(select id from ca.image where img_user = '外院logo'), 2),
  ('计科足球队',(select id from ca.image where img_user = '计科logo'), 2),
  ('国商足球队',(select id from ca.image where img_user = '国商logo'), 2),
  ('教工足球队',(select id from ca.image where img_user = '教工logo'), 2);


-- 球队和球员的关联表
insert into ca.person_team (person_id, team_id) values
  ((select id from ca.person where player_name = '胡存浩'), (select id from ca.football_team where team_name = '工程足球队')),
  ((select id from ca.person where player_name = '潘辞'), (select id from ca.football_team where team_name = '工程足球队'));
  -- ((select id from ca.person where player_name = ''), (select id from ca.football_team where team_name = '工商足球队')),
  -- ((select id from ca.person where player_name = ''), (select id from ca.football_team where team_name = '工商足球队')),
  -- ((select id from ca.person where player_name = ''), (select id from ca.football_team where team_name = '会计足球队')),
  -- ((select id from ca.person where player_name = ''), (select id from ca.football_team where team_name = '会计足球队')),
  -- ((select id from ca.person where player_name = ''), (select id from ca.football_team where team_name = '足球队')),
  -- ((select id from ca.person where player_name = ''), (select id from ca.football_team where team_name = '足球队')),
  -- ((select id from ca.person where player_name = ''), (select id from ca.football_team where team_name = '')),

-- 球场的基本信息表的初始模拟数据
insert into ca.football_court (court_name, court_location) values 
('山商诺坎普', '山东工商学院东校东操场'),
('山商卡尔德隆', '山东工商学院东校小操场'),
('山商伯纳乌', '山东工商学院西校操场');

-- 赛程表的模拟数据
-- 1:场序 2:轮数 3: 比赛日期 4:主队  5:客队 6: 比赛地点
insert into ca.match_schedule (order_number, wheel_number, match_date, team_a, team_b, match_location) values 
(1, 1, '2018-10-8', (select id from ca.football_team where team_name = '计科足球队'), (select id from ca.football_team where team_name = '信电足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
(2, 1, '2018-10-10', (select id from ca.football_team where team_name = '教工足球队'), (select id from ca.football_team where team_name = '外院足球队'), (select id from ca.football_court where court_name = '山商诺坎普')),
(3, 1, '2018-10-10', (select id from ca.football_team where team_name = '国商足球队'), (select id from ca.football_team where team_name = '工商足球队'), (select id from ca.football_court where court_name = '山商伯纳乌')),
(4, 1, '2018-10-12', (select id from ca.football_team where team_name = '会计足球队'), (select id from ca.football_team where team_name = '工程足球队'), (select id from ca.football_court where court_name = '山商伯纳乌'));



-- 进球表的模拟数据
insert into ca.match_goal (id, goal_a, goal_b) values
  ((select id from ca.match_schedule where order_number = 1), 0, 2),
  ((select id from ca.match_schedule where order_number = 2), 1, 0),
  ((select id from ca.match_schedule where order_number = 3), 1, 1),
  ((select id from ca.match_schedule where order_number = 4), 0, 1);


-- 积分表的模拟数据（查数据时，按照倒序进行排列）
insert into ca.score (team_id, team_score) values
  ((select id from ca.football_team where team_name = '计科足球队'), 0),
  ((select id from ca.football_team where team_name = '信电足球队'), 3),
  ((select id from ca.football_team where team_name = '教工足球队'), 3),
  ((select id from ca.football_team where team_name = '国商足球队'), 1),
  ((select id from ca.football_team where team_name = '工商足球队'), 1),
  ((select id from ca.football_team where team_name = '会计足球队'), 0),
  ((select id from ca.football_team where team_name = '工程足球队'), 3),
  ((select id from ca.football_team where team_name = '外院足球队'), 0);


-- 射手榜的模拟数据（查数据时，按照倒序进行排列）
insert into ca.shooter_list (shooter_id, goal_num) values
-- 信电  
  ((select id from ca.person where player_name = '郭林亿'), 1),
  ((select id from ca.person where player_name = '刘一材'), 1),
-- 教工
  ((select id from ca.person where player_name = '吕长海'), 1),
-- 国商
  ((select id from ca.person where player_name = '李晓峰'), 1),
-- 工商
  ((select id from ca.person where player_name = '李浩'), 1),
-- 工程
  ((select id from ca.person where player_name = '胡存浩'), 1);



-- 助攻榜 模拟数据
insert into ca.assist_list (assist_id, assist_num) values
-- 信电  
  ((select id from ca.person where player_name = '刘一材'), 1),
  ((select id from ca.person where player_name = '郭林亿'), 1),
-- 教工
  ((select id from ca.person where player_name = '牛勇平'), 2),
-- 国商
  ((select id from ca.person where player_name = '李翔'), 1),
-- 工商
  ((select id from ca.person where player_name = '陈煜'), 1),
-- 工程
  ((select id from ca.person where player_name = '潘辞'), 1);


-- 对每场比赛的每一个进球的详情进行描述
insert into ca.match_every_goal (match_id, shooter_id, goal_time, assist_id) values
  ((select id from ca.match_schedule where order_number = 1), (select id from ca.person where player_name = '郭林亿'), '35', (select id from ca.person where player_name = '刘一材')),
  ((select id from ca.match_schedule where order_number = 1), (select id from ca.person where player_name = '刘一材'), '60', (select id from ca.person where player_name = '郭林亿')),
  ((select id from ca.match_schedule where order_number = 2), (select id from ca.person where player_name = '吕长海'), '60', (select id from ca.person where player_name = '牛勇平')),
  ((select id from ca.match_schedule where order_number = 3), (select id from ca.person where player_name = '李晓峰'), '22', (select id from ca.person where player_name = '李翔')),
  ((select id from ca.match_schedule where order_number = 3), (select id from ca.person where player_name = '李浩'), '12', (select id from ca.person where player_name = '陈煜')),
  ((select id from ca.match_schedule where order_number = 4), (select id from ca.person where player_name = '胡存浩'), '30', (select id from ca.person where player_name = '潘辞'));



commit;