-- insert

-- country
INSERT INTO Country (Country_Code, Country_Name)
  VALUES ('TUR', 'Turkey');
INSERT INTO Country (Country_Code, Country_Name)
  VALUES ('VIE', 'Vietnam' );
INSERT INTO Country (Country_Code, Country_Name)
  VALUES ('USA', 'The United States' );
INSERT INTO Country (Country_Code, Country_Name)
  VALUES ('ITA', 'Italy');
INSERT INTO Country (Country_Code, Country_Name)
  VALUES ('UKI', 'The United Kingdom');
-- director
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('FFC', 'Francis Ford', 'Coppola', 'ITA');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('SPL', 'Spike', 'Lee', 'USA');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('GUR', 'Guy', 'Ritchie', 'UKI');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('WCB', 'Wachowski', 'Brothers', 'USA');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('PTJ', 'Peter', 'Jackson', 'USA');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('STK', 'Stanley', 'Kubrick', 'USA');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('PTD', 'Pete', 'Docter', 'USA');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('STS', 'Steven', 'Spielberg', 'USA');
INSERT INTO director (dir_ID, dir_fname, dir_lname, dir_country_code)
  VALUES ('QUT', 'Quentin', 'Tarantino', 'USA');
--studio
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('PRM', 'Paramount', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('FOA', '40 Acres and a Mule', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('VRP', 'Village Shadow Pictures', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('WNB', 'Warner Bros', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('NWC', 'Newline Cinema', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('TPC', 'The Producer Cirlce', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('PXR', 'Pixar', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('UNP', 'Universal Pictures', 'USA');
INSERT INTO studio (studio_id, studio_nm, studio_country_code)
  VALUES ('ABA', 'A Band Apart', 'USA');
-- movie
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('GDF', 'The Godfather', '121', 'English', '1972-03-14');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date )
  VALUES ('DFB', 'Da 5 Blood', '100', 'English', '2020-06-12');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('SRH', 'Sherlock Holmes', '120', 'English', '2009-12-25');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('MTR', 'The Matrix', '114', 'English', '1999-03-31');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('LTR', 'Lord of The Rings', '178', 'English', '2001-12-21');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('CLO', 'A Clockwork Orange', '113', 'English', '1971-12-19');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('SHN', 'The Shining', '144', 'English', '1980-05-23');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('INO', 'Inside Out', '95', 'English', '2015-05-18');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('JWS', 'Jaws', '124', 'English', '1975-06-20');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('PUF', 'Pulp Fiction', '154', 'English', '1994-05-21');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date)
  VALUES ('KIB', 'Kill Bill', '111', 'English', '2003-10-10');

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



