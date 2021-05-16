create table if not exists actor
(
	act_id integer not null
		constraint actor_pk
			primary key,
	act_fname char(20) not null,
	act_lname char(20) not null,
	act_gender char not null
);

alter table actor owner to postgres;

