create database sql_exam;

use sql_exam;

select * from actor;
select * from cast;
select * from director;
select * from genres;
select * from movie;
select * from movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;

#Question-1

select mov_id, mov_title, mov_year, mov_time from movie
where mov_year>1995 and mov_time > 120 and mov_title like '%A%'; 

#Question-2

select a.* from actor as a
inner join cast as c on (a.act_id = c.act_id)
Inner join movie as m on (m.mov_id = c.mov_id)
where m.mov_title = 'Chinatown';


SELECT a.*
FROM actor as a
WHERE a.act_id IN (
  SELECT c.act_id
  FROM cast as c
  JOIN movie as m on( c.mov_id = m.mov_id)
  WHERE m.mov_title = 'Chinatown'
);




#Questions-3

select r.mov_id, m.mov_title, max(r.num_o_ratings) as top_rating from ratings as r
inner join movie as m on(r.mov_id = m.mov_id);


#Questions-4

select mov_title, mov_year , mov_rel_country from movie
where mov_rel_country = 'UK'
order by mov_year limit 7;

#Questions-5

update movie 
set 
		mov_lang='chinese'
where 	mov_lang='japanese' and
		mov_year='1954';

select * from movie where mov_year='2001';

#Questions-6

select g.gen_title, max(mov_time) as Max_time, count(m.mov_id) from genres as g
Inner join movie_genres as mg on(g.gen_id=mg.gen_id)
inner join movie as m on (m.mov_id = mg.mov_id)
group by g.gen_id;


#Questions-7

create view question_7  as select a.act_fname, a.act_lname, m.mov_title, c.role from actor as a 
inner join cast as c on(c.act_id=a.act_id)
inner join movie as m on(m.mov_id=c.mov_id);

#Questions-8

select mov_title, mov_dt_rel from movie
where mov_dt_rel < 03/31/1995 ;

#Questions-9

select a.act_fname, a.act_lname, a.act_gender, c.role from actor as a
inner join cast as c on (a.act_id=c.act_id)
where a.act_gender ='F';

#Questions-10

select * from cast ;

insert into cast values 
(126,936, 'Darth Vader'),
(140,939,'Sarah Connor'),
(135,942,' Ethan Hunt'),
(131,930,'Travis Bickle'),
(144,941,'Antoine Doinel');




