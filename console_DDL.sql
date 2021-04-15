create table if not exists movie(
mov_id		        char(5)		not null,
mov_title 	    	char(50)	not null,
mov_time	    	integer		not null,
mov_lang	    	char(50)	not null,
mov_rls_date    	date		not null,
constraint movie_pk primary key(mov_id)
);

create table if not exists country(
country_code     char(5)    not null ,
country_name     char(50)   not null ,
constraint country_pk primary key (country_code)
);

create table if not exists actor(
act_id		    integer		    not null,
act_fname		char(20)		not null,
act_lname		char(20)		not null,
act_gender		char(1)		    not null,
constraint actor_pk primary key(act_id)
);

create table if not exists director(
dir_id		    char(5)		    not null,
dir_fname		char(20)		not null,
dir_lname		char(20)		not null,
dir_country_code     char(5) not null,
constraint director_country foreign key (dir_country_code) references country(country_code),
constraint director_pk primary key(dir_id)
);

create table if not exists genres(
gen_id		    char(5)		    not null,
gen_nm  		char(20)		not null,
constraint genres_pk primary key(gen_id)
);

create table if not exists studio(
studio_id		    char(5)		    not null,
studio_nm     		char(50)		not null,
studio_country_code      char(5)    not null,
constraint country_code foreign key (studio_country_code) references country(country_code),
constraint studio_pk primary key(studio_id)
);

create table if not exists rating(
mov_id		            char(5)	    not null,
rating_kinopoisk  		numeric		not null,
rating_imdb             numeric     not null,
constraint rating_fk foreign key(mov_id)references movie(mov_id)
);

create table if not exists movie_genres(
mov_id		char(5)		not null,
gen_id		char(5)		not null,
constraint movie_genres_fk foreign key(mov_id) references movie(mov_id),
constraint movie_genres_f foreign key(gen_id) references genres(gen_id)
);

create table if not exists movie_cast(
act_id		integer		not null,
mov_id		char(5)		not null,
role		char(30)	not null,
constraint movie_cast_fk foreign key(act_id) references actor(act_id),
constraint movie_cast_f foreign key(mov_id) references movie(mov_id)
);

create table if not exists movie_direction(
dir_id		char(5)		not null,
mov_id		char(5)		not null,
constraint movie_direction_fk foreign key(dir_id) references director(dir_id),
constraint movie_direction_f foreign key(mov_id) references movie(mov_id)
);

create table if not exists movie_studio(
studio_id		char(5)		not null,
mov_id  		char(5)		not null,
constraint movie_studio_fk foreign key(studio_id) references studio(studio_id),
constraint movie_studio_f foreign key(mov_id) references movie(mov_id)
);

-- indexes
create index actor__index
	on actor (act_id);

create index director__index
	on director (dir_id);

create index genres__index
	on genres (gen_id);

create index movie__index
	on movie (mov_id);

create index movie_cast__index
	on movie_cast (act_id, mov_id) ;

create index movie_direction__index
	on movie_direction (dir_id, mov_id) ;

create index movie_genres__index
	on movie_genres (mov_id, gen_id) ;

create index movie_studio__index
	on movie_studio (studio_id);

create index rating__index
	on rating (mov_id);

create index studio__index
	on studio (studio_id);
--
