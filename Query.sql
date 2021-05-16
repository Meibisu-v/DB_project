-- самый рейтинговый фильм kinopoisk
select distinct mov_title from movie, rating
where (rating.mov_id = movie.mov_id) and (rating_kinopoisk =
    (select max(rating_kinopoisk) from rating));
-- самый рейтинговый фильм imdb
select distinct mov_title from movie, rating
where (rating.mov_id = movie.mov_id) and (rating_imdb =
    (select max(rating_imdb) from rating));
-- актеры самого рейтинговово фильма
select distinct act_fname, act_lname from actor, movie_cast, rating
where (actor.act_id = movie_cast.act_id) and (movie_cast.mov_id = (
    select movie.mov_id from movie, rating
    where (rating.mov_id = movie.mov_id) and (rating_imdb =
    (select max(rating_imdb) from rating))
    ));
-- роли, исполняемые актерами из запроса выше
select distinct act_fname, act_lname, movie_cast.role from actor, movie_cast, rating
where (actor.act_id = movie_cast.act_id) and (movie_cast.mov_id = (
    select movie.mov_id from movie, rating
    where (rating.mov_id = movie.mov_id) and (rating_imdb =
    (select max(rating_imdb) from rating))
    ));
-- самый популярный жанр фильма
select gen_nm, count(mov_id) from movie_genres, genres
where (genres.gen_id = movie_genres.gen_id)
group by genres.gen_id
order by count(mov_id) desc;
-- актеры, которые играли в фильмах жанра: фантастика
select act_lname, act_fname from actor, movie_cast, movie_genres, genres
where (actor.act_id = movie_cast.act_id) and (movie_cast.mov_id = movie_genres.mov_id)
  and (genres.gen_nm = 'Fantasy') and (genres.gen_id = movie_genres.gen_id);
-- список фильмов и оценки
select distinct mc.mov_title, rating.rating_kinopoisk from rating
inner join movie mc on rating.mov_id = mc.mov_id
order by rating.rating_kinopoisk desc;
-- список фильмов и актеров
select distinct actor.act_lname, actor.act_fname, mv.mov_title from actor
join movie_cast mc on (mc.act_id = actor.act_id )
join movie mv on (mc.mov_id = mv.mov_id)
order by mov_title;
-- фильмы кинстудии Warner Brothers
select distinct mov_title from movie
join movie_studio ms on movie.mov_id = ms.mov_id
join studio st on (st.studio_id = ms.studio_id)
where studio_nm = 'Warner Bros';
-- режисеры из США и Италии
select distinct dir_fname, dir_lname from director, country
where (dir_country_code = country_code) and (country_name in ('The United States', 'Italy'));
--group by + having
--количество фильмов жанра: Триллер
select gen_nm, count(mov_id) from movie_genres, genres
where (genres.gen_id = movie_genres.gen_id) and (genres.gen_nm = 'Thriller')
group by genres.gen_nm;

-- фильм - студия - продолжительность
select distinct mov_title, mv.studio_nm, mov_time from movie
join movie_studio mc on (mc.mov_id = movie.mov_id)
join studio mv on (mc.studio_id = mv.studio_id)
order by mv.studio_nm;


--средняя продолжительность фильма (по студиям)
select distinct  studio_nm, avg(movie.mov_time) over (partition by movie_studio.studio_id) as avg_time
from movie, movie_studio, studio
where (movie_studio.mov_id = movie.mov_id) and (movie_studio.studio_id = studio.studio_id);

--средний рейтинг каждой киностудии
select distinct studio_nm,
       avg(rating_imdb) over (partition by studio_nm) as av_rating
from  studio, movie, rating, movie_studio
where (rating.mov_id = movie.mov_id) and (movie.mov_id = movie_studio.mov_id)
  and (movie_studio.studio_id = studio.studio_id)
order by av_rating;
--изменение среднего рейтинга с выходом нового фильма
select distinct studio_nm, mov_rls_date, mov_title,
       avg(rating_imdb) over (partition by studio_nm order by mov_rls_date) as av_rating
from  studio, movie, rating, movie_studio
where (rating.mov_id = movie.mov_id) and (movie.mov_id = movie_studio.mov_id)
  and (movie_studio.studio_id = studio.studio_id)
order by mov_rls_date;
--средний рейтинг фильмов для каждого жанра
select distinct gen_nm,
       avg(rating_imdb) over (partition by gen_nm) as av_rating
from  genres, movie, rating, movie_genres
where (rating.mov_id = movie.mov_id) and (movie.mov_id = movie_genres.mov_id)
  and (movie_genres.gen_id = genres.gen_id)
order by av_rating desc;
--тоже самое по актерам
select distinct act_lname, act_fname,
       avg(rating_imdb) over (partition by movie.mov_id) as av_rating
from  genres, movie, actor, movie_cast, rating
where (movie.mov_id = rating.mov_id) and (movie.mov_id = movie_cast.mov_id)
  and (movie_cast.act_id = actor.act_id)
order by av_rating desc;

--view содержит информацию о фильме
create or replace view movie_list as
    (select distinct mc.mov_title, rating.rating_kinopoisk, rating_imdb, studio_nm, mov_time from rating
    inner join movie mc on rating.mov_id = mc.mov_id
    inner join movie_studio ms on mc.mov_id = ms.mov_id
    inner join studio s on ms.studio_id = s.studio_id
    order by rating.rating_kinopoisk desc);
--view фильмы кинстудии Warner Brothers
create or replace view Warner_bros as
select distinct mov_title from movie
join movie_studio ms on movie.mov_id = ms.mov_id
join studio st on (st.studio_id = ms.studio_id)
where studio_nm = 'Warner Bros';
--view средняя продолжительность фильма по студиям
create or replace view agv_dur_studio as
select distinct  studio_nm, avg(movie.mov_time) over (partition by movie_studio.studio_id) as avg_time
from movie, movie_studio, studio
where (movie_studio.mov_id = movie.mov_id) and (movie_studio.studio_id = studio.studio_id);
-- view фильм актер
create or replace view film_actors as
select distinct mov_title, act_fname, act_lname from movie
right join movie_cast mc on movie.mov_id = mc.mov_id
right join actor a on a.act_id = mc.act_id
order by mov_title;
--средний рейтинг фильмов для каждого жанра
create or replace view genre_rating as
select distinct gen.gen_nm,
       avg(rating_imdb) over (partition by gen.gen_id) as av_rating
from movie
inner join movie_genres mg on movie.mov_id = mg.mov_id
inner join rating rt on rt.mov_id = mg.mov_id
inner join genres gen on gen.gen_id = mg.gen_id
order by av_rating desc;
--средний рейтинг каждой киностудии
create or replace view avg_studios as
select distinct studio_nm,
       avg(r.rating_imdb) over (partition by studio_nm) as av_rating
from  studio
inner join movie_studio ms on studio.studio_id = ms.studio_id
inner join movie m on m.mov_id = ms.mov_id
inner join rating r on r.mov_id = m.mov_id
order by av_rating;


--functions
--информация о фильме по названию
create or replace procedure get_film_info(film_name text default '') language SQL as $$
    drop table if exists film_info_by_name;
    create table film_info_by_name as
    select m.mov_title as title, m.mov_id as id, rating_imdb as imdb, rating_kinopoisk as kinopoisk
    from rating
    join movie m on rating.mov_id = m.mov_id
        where m.mov_title = film_name;
$$;

call get_film_info('The Matrix');
--id фильма по названию
create or replace function get_film_id(film_name text) returns char(5) as $$
    declare
        film_id char(5) = '';
    begin
        select mov_id from movie
        where mov_title = film_name into film_id;
        return film_id;
    end;
    $$ language plpgsql;

select * from get_film_id('The Matrix');
--имя актера по id
create or replace function get_actor_name(actor_id integer) returns char(41) as $$
    declare
        actor_lname char(20) = '';
        actor_fname char(20) = '';
    begin
        select act_lname, act_fname from actor
        where actor_id = act_id into actor_lname, actor_fname;
        return actor_lname || ' ' || actor_fname;
    end;
    $$ language plpgsql;

select * from get_actor_name(20287);
-- добавить актера
create or replace procedure insert_actor(actor_id integer, actor_fname char(20), actor_lname char(20),
                                         actor_gender char) language SQL as $$
    INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender)
    VALUES (actor_id, actor_fname, actor_lname, actor_gender);
    $$;

call insert_actor(123, 'Tom', 'Hanks', 'M');
select * from get_actor_name(123);

--триггеры
create table audit(
    emp_id int not null,
    entry_date text not null
);
create or replace function audit_log_func() returns trigger as $$
    begin
        insert into audit(emp_id, entry_date)
        values (new.act_id, current_timestamp);
        return new;
    end;
$$ language plpgsql;

create trigger insert_actor
after insert on actor
for each row execute procedure audit_log_func();

drop trigger insert_actor on actor;

INSERT INTO actor (act_id, act_fname, act_lname, act_gender)
VALUES (1, 'test', 'test2', 't');

delete from actor
where act_id = 1;

call insert_actor(1, 'test', 'test2', 't');
--триггер
create table user_log(
    id_act integer not null,
    act_date text not null,
    operation text not null
);

create or replace function after_delete() returns trigger as $$
    begin
        insert into user_log(id_act, act_date, operation)
        values (old.act_id, current_timestamp, 'del');
        return old;
    end;
$$ language plpgsql;

create trigger after_delete after delete on actor
for each row execute procedure after_delete();

