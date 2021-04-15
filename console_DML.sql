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
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('GDF', 'The Godfather', '121', 'English', '1972-03-14', 'PRM');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('DFB', 'Da 5 Blood', '100', 'English', '2020-06-12', 'FOA');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('SRH', 'Sherlock Holmes', '120', 'English', '2009-12-25', 'VRP');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('MTR', 'The Matrix', '114', 'English', '1999-03-31', 'WNB');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('LTR', 'Lord of The Rings', '178', 'English', '2001-12-21', 'NWC');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('CLO', 'A Clockwork Orange', '113', 'English', '1971-12-19', 'WNB');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('SHN', 'The Shining', '144', 'English', '1980-05-23', 'TPC');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('INO', 'Inside Out', '95', 'English', '2015-05-18', 'PXR');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('JWS', 'Jaws', '124', 'English', '1975-06-20', 'UNP');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('PUF', 'Pulp Fiction', '154', 'English', '1994-05-21', 'ABA');
INSERT INTO movie (mov_id, mov_title, mov_time, mov_lang, mov_rls_date, mov_studio)
  VALUES ('KIB', 'Kill Bill', '111', 'English', '2003-10-10', 'ABA');

--




