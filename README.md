# SQl_Project_Movies

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
#Write a query where it should contain all the data of the 
movies which were released after 1995 having their movie
duration greater than 120 and should be including A in their
movie title.

select mov_id, mov_title, mov_year, mov_time from movie
where mov_year>1995 and mov_time > 120 and mov_title like '%A%'; 

#Question-2
#Write an SQL query to find the actors who played a role in the 
movie 'Chinatown'. Fetch all the fields of actor table. (Hint: Use 
the IN operator)

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
#Write an SQL query for extracting the data from the ratings 
table for the movie who got the maximum number of ratings.


select r.mov_id, m.mov_title, max(r.num_o_ratings) as top_rating from ratings as r
inner join movie as m on(r.mov_id = m.mov_id);


#Questions-4
#Write an SQL query to determine the Top 7 movies which were 
released in United Kingdom. Sort the data in ascending order 
of the movie year

select mov_title, mov_year , mov_rel_country from movie
where mov_rel_country = 'UK'
order by mov_year limit 7;

#Questions-5
#Set the language of movie language as 'Chinese' for the movie 
which has its existing language as Japanese and their movie 
year was 2001

update movie 
set 
		mov_lang='chinese'
where 	mov_lang='japanese' and
		mov_year='1954';

select * from movie where mov_year='2001';

#Questions-6
#Print genre title, maximum movie duration and the count the 
number of movies in each genre.


select g.gen_title, max(mov_time) as Max_time, count(m.mov_id) from genres as g
Inner join movie_genres as mg on(g.gen_id=mg.gen_id)
inner join movie as m on (m.mov_id = mg.mov_id)
group by g.gen_id;


#Questions-7
#Create a view which should contain the first name, last name, 
title of the movie & role played by particular actor.


create view question_7  as select a.act_fname, a.act_lname, m.mov_title, c.role from actor as a 
inner join cast as c on(c.act_id=a.act_id)
inner join movie as m on(m.mov_id=c.mov_id);

#Questions-8
#Display the movies that were released before 31st March 1995.

select mov_title, mov_dt_rel from movie
where mov_dt_rel < 03/31/1995 ;

#Questions-9
#Write a query which fetch the first name, last name & role 
played by the actor where output should all exclude Male 
actors.

select a.act_fname, a.act_lname, a.act_gender, c.role from actor as a
inner join cast as c on (a.act_id=c.act_id)
where a.act_gender ='F';

#Questions-10
#Insert five rows into the cast table where the ids for movie 
should be 936,939,942,930,941 and their respective roles 
should be Darth Vader, Sarah Connor, Ethan Hunt, Travis 
Bickle, Antoine Doinel & their actor ids should be set up as 
126,140,135,131,144

select * from cast ;

insert into cast values 
(126,936, 'Darth Vader'),
(140,939,'Sarah Connor'),
(135,942,' Ethan Hunt'),
(131,930,'Travis Bickle'),
(144,941,'Antoine Doinel');




