begin;



-- simulate data for ca.image
insert into ca.image (id, url, updated_at, created_at) values
  (gen_random_uuid (), 'https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', null, '2011-01-01T01:11:11Z'),
  (gen_random_uuid (), 'https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2265761240.jpg', null, '2012-02-02T02:22:22Z'),
  (gen_random_uuid (), 'https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2266110047.jpg', null, '2013-03-03T03:33:33Z'),
  (gen_random_uuid (), 'https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', null, '2014-04-04T04:44:44Z'),
  (gen_random_uuid (), 'https://img3.doubanio.com/view/movie_poster_cover/mpst/public/p2263582212.jpg', null, '2015-05-01T05:55:55Z');


-- simulate data for ca.person
insert into ca.person (first_name, last_name, chat_id, created_at) values
  ('Tester', 'Fox', 'ta_3','1999-04-04T21:21:42Z'),
  ('Tester1', 'Fox', 'ta_4','1999-04-04T21:21:42Z'),
  ('Tester2', 'Fox', 'ta_5','1999-04-04T21:21:42Z');



--insert into ca_private.person_account (person_id, email, password_hash) values
--  ((select id from ca.person where first_name = 'Sara'), 'spowell0@noaa.gov', '$2a$06$.Ryt.S6xCN./QmTx3r9Meu/nsk.4Ypfuj.o9qIqv4p3iipCWY45Bi'), -- Password: 'iFbWWlc'
-- ((select id from ca.person where first_name = 'Andrea'), 'afox1@npr.org', '$2a$06$FS4C7kwDs6tSrrjh0TITLuQ/pAjUHuCH0TBukHC.2m5n.Z1HxApRO'); -- Password: 'fjHtKk2FxCh0'  

--球员账户的模拟数据
insert into ca_private.person_account (person_id, email, password_hash) values
  ((select id from ca.person where first_name = 'Tester'), 'test@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where first_name = 'Tester1'), 'test1@test.test', crypt('123', gen_salt('bf'))),
  ((select id from ca.person where first_name = 'Tester2'), 'test2@test.test', crypt('123', gen_salt('bf')));  
   
  





commit;