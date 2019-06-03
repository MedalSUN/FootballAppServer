begin;



-- simulate data for ca.image
insert into ca.image (url, img_user) values
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/1_zpslmxoqllr.png', '1'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/2_zpszg2edl6o.png', '2'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/3_zpst5q7ef1e.png', '3'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/4_zpst4vb6hrv.png', '4'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/5_zpsodahwvvm.png', '5'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/6_zpswqaajhti.png', '6'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/7_zps3msn4o65.png', '7'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/8_zps2fugnbri.png', '8'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/9_zpspjmoq323.png', '9'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/10_zpsyvd5p8vj.png', '10'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/11_zpsfzwbgcdg.png', '11'),
  ('https://oi36.photobucket.com/albums/e47/MedalSUN/12_zpsm0wd0cul.png', '12'),
  ('https://i36.photobucket.com/albums/e47/MedalSUN/other_zpss0whariq.jpeg', '其他'),
  
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
  ('潘辞', 10, (select id from ca.image where img_user = '10')),
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

-- 管理员模拟数据
insert into ca.admin_person (admin_name, school_name) values
  ('AdminPerson', '山东工商学院');
insert into ca_private.admin_person_account (admin_person_id, account_number, password_hash) values
  ((select id from ca.admin_person where admin_name = 'AdminPerson'), '17616023616', crypt('123', gen_salt('bf')));
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


insert into ca.person (player_name, shirt_num, player_img) values
-- 工程足球队
  ('卡卡西', 12, (select id from ca.image where img_user = '12'));
-- 添加没有加入任何球队的账户模拟数据
insert into ca_private.person_account (person_id, email, password_hash) values
    ((select id from ca.person where player_name = '卡卡西'), 'test16@test.test', crypt('123', gen_salt('bf')));
   
  
-- 球队基本信息的初始模拟数据
insert into ca.football_team (team_name, team_logo, team_about, member_number) values
  ('工程足球队',(select id from ca.image where img_user = '工程logo'), '工程工程，众志成城', 2),
  ('工商足球队',(select id from ca.image where img_user = '工商logo'), '工商工商，工商银行', 2),
  ('会计足球队',(select id from ca.image where img_user = '会计logo'), '会计会计，快快计算', 2),
  ('信电足球队',(select id from ca.image where img_user = '信电logo'), '信电信电，活力无限', 2),
  ('外院足球队',(select id from ca.image where img_user = '外院logo'), '外院外院，海纳百川', 2),
  ('计科足球队',(select id from ca.image where img_user = '计科logo'), '计科计科，码农天下', 2),
  ('国商足球队',(select id from ca.image where img_user = '国商logo'), '国商国商，全家从商', 2),
  ('教工足球队',(select id from ca.image where img_user = '教工logo'), '教工教工，教定乾坤', 2);


-- 球队和球员的关联表
insert into ca.person_team (person_id, team_id, checked) values
  ((select id from ca.person where player_name = '胡存浩'), (select id from ca.football_team where team_name = '工程足球队'), true),
  ((select id from ca.person where player_name = '潘辞'), (select id from ca.football_team where team_name = '工程足球队'), true),
  ((select id from ca.person where player_name = '李浩'), (select id from ca.football_team where team_name = '工商足球队'), true),
  ((select id from ca.person where player_name = '陈煜'), (select id from ca.football_team where team_name = '工商足球队'), true),
  ((select id from ca.person where player_name = '李进'), (select id from ca.football_team where team_name = '会计足球队'), true),
  ((select id from ca.person where player_name = '张泽林'), (select id from ca.football_team where team_name = '会计足球队'), true),
  ((select id from ca.person where player_name = '肖向东'), (select id from ca.football_team where team_name = '外院足球队'), true),
  ((select id from ca.person where player_name = '肖朝义'), (select id from ca.football_team where team_name = '外院足球队'), true),
  ((select id from ca.person where player_name = '李晓峰'), (select id from ca.football_team where team_name = '国商足球队'), true),
  ((select id from ca.person where player_name = '李翔'), (select id from ca.football_team where team_name = '国商足球队'), true),
  ((select id from ca.person where player_name = '吕长海'), (select id from ca.football_team where team_name = '教工足球队'), true),
  ((select id from ca.person where player_name = '牛勇平'), (select id from ca.football_team where team_name = '教工足球队'), true),
  ((select id from ca.person where player_name = '郝嘉琪'), (select id from ca.football_team where team_name = '计科足球队'), true),
  ((select id from ca.person where player_name = '邢开程'), (select id from ca.football_team where team_name = '计科足球队'), true),
  ((select id from ca.person where player_name = '郭林亿'), (select id from ca.football_team where team_name = '信电足球队'), true),
  ((select id from ca.person where player_name = '刘一材'), (select id from ca.football_team where team_name = '信电足球队'), true);

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
insert into ca.match_goal (id, goal_a, goal_b, finished) values
  ((select id from ca.match_schedule where order_number = 1), 0, 2, true),
  ((select id from ca.match_schedule where order_number = 2), 1, 0, true),
  ((select id from ca.match_schedule where order_number = 3), 1, 1, true),
  ((select id from ca.match_schedule where order_number = 4), 0, 1, true);


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
  ((select id from ca.person where player_name = '郭林亿'), 2),
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
  ((select id from ca.person where player_name = '刘一材'), 2),
-- 教工
  ((select id from ca.person where player_name = '牛勇平'), 1),
-- 国商
  ((select id from ca.person where player_name = '李翔'), 1),
-- 工商
  ((select id from ca.person where player_name = '陈煜'), 1),
-- 工程
  ((select id from ca.person where player_name = '潘辞'), 1);


-- 对每场比赛的每一个进球的详情进行描述
insert into ca.match_every_goal (match_id, shooter_id, goal_time, assist_id) values
  ((select id from ca.match_schedule where order_number = 1), (select id from ca.person where player_name = '郭林亿'), '35', (select id from ca.person where player_name = '刘一材')),
  ((select id from ca.match_schedule where order_number = 1), (select id from ca.person where player_name = '郭林亿'), '60', (select id from ca.person where player_name = '刘一材')),
  ((select id from ca.match_schedule where order_number = 2), (select id from ca.person where player_name = '吕长海'), '60', (select id from ca.person where player_name = '牛勇平')),
  ((select id from ca.match_schedule where order_number = 3), (select id from ca.person where player_name = '李晓峰'), '22', (select id from ca.person where player_name = '李翔')),
  ((select id from ca.match_schedule where order_number = 3), (select id from ca.person where player_name = '李浩'), '12', (select id from ca.person where player_name = '陈煜')),
  ((select id from ca.match_schedule where order_number = 4), (select id from ca.person where player_name = '胡存浩'), '30', (select id from ca.person where player_name = '潘辞'));



commit;