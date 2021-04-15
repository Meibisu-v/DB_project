-- самый рейтинговый фильм kinopoisk
select distinct mov_title from movie, rating
where (rating.mov_id = movie.mov_id) and (rating_kinopoisk =
    (select max(rating_kinopoisk) from rating));
-- самый рейтинговый фильм imdb
select distinct mov_title from movie, rating
where (rating.mov_id = movie.mov_id) and (rating_imdb =
    (select max(rating_imdb) from rating));
-- актеры самого рейтингово фильма
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
-- режисеры из США
select distinct dir_fname, dir_lname from director, country
where (dir_country_code = country_code) and (country_name in ('The United States', 'Italy'));

--
DELETE
FROM public.country
WHERE country_code LIKE 'VIE  ' ESCAPE '#';

INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender)
VALUES (30875, 'Orlando ', 'Bloom', 'M');

INSERT INTO public.country (country_code, country_name)
VALUES ('VIE', 'Vietnam');

INSERT INTO public.director (dir_id, dir_fname, dir_lname, dir_country_code)
VALUES ('QUT', 'Quentin', 'Tarantino', 'USA');

INSERT INTO public.genres (gen_id, gen_nm)
VALUES ('DET', 'Detective');

INSERT INTO public.movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
VALUES ('KIB  ', 'Kill Bill', 111, 'English', '2003-10-10');

INSERT INTO public.movie_cast (act_id, mov_id, role)
VALUES (33037, 'GDF', 'Vito Corleone');

INSERT INTO public.movie_direction (dir_id, mov_id)
VALUES ('QUT', 'KIB');

INSERT INTO public.movie_genres (mov_id, gen_id)
VALUES ('KIB', 'DRM');

INSERT INTO public.movie_studio (studio_id, mov_id)
VALUES ('ABA', 'KIB');

INSERT INTO public.rating (mov_id, rating_kinopoisk, rating_imdb)
VALUES ('KIB  ', 7.6, 8.1);

INSERT INTO public.studio (studio_id, studio_nm, studio_country_code)
VALUES ('ABA', 'A Band Apart', 'USA');





--







