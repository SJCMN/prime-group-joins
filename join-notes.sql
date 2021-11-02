create table "person" (
"id" serial primary key,
"name" varchar(32) not null
);

create table "social_security" (
"id" serial primary key,
"person_id" int references "person",
"number" int not null
);

drop table "social_security";

insert into "person" ("name") values ( 'Jimmy');
insert into "person" ("name") values ('Billy');

insert into "social_security" ("person_id", "number") values ('1', '123456');

select * from "person" join "social_security" on "person"."id" = "social_security"."person_id";

select "person"."id", "person"."name", "social_security"."number" from "person" 
join "social_security" on  "person"."id" = "social_security"."person_id";

create table "cohort" ( 
"id" serial primary key,
"name" varchar(60) not null,
"start_date" date
);

create table "student" (
"id" serial primary key,
"name" varchar(60) not null,
"cohort_id" int references "cohort"
);

insert into "cohort" ("name", "start_date")
values ('Solinas', '08-01-2021'),
('Zeta', '08-01-2015'),
('Xi' , '06-01-2016')
;

insert into "student" ("name", "cohort_id")
values ('Sam', 1), ('Dane', 2), ('Liz', 3), ('Jack', 1), ('Nick', 1);


select * from "cohort";

select * from "student";

select "cohort"."name", "cohort"."start_date", "student"."name" from "student" join "cohort" 
on "cohort"."id" = "student"."cohort_id";


select count (*) from "student";

select count (*) from "student" join
"cohort" on "cohort"."id" = "student"."cohort_id"
where "cohort"."name" = 'Xi';

select "cohort"."name", count (*) from "student"
join "cohort" on "cohort"."id" = "student"."cohort_id"
group by "cohort"."name";


-- ASC acending A-Z
-- DESC decending Z-A
-- ORDER BY 



select "student"."name" from "student" 
join "cohort" on "cohort"."id" = "student"."cohort_id" 
where "cohort"."name" = 'Solinas'
order by "student"."name" DESC;

insert into "cohort" ("name", "start_date") values ('Alpha', '1-1-1970');

select "cohort"."name", count (*) from "student"
join "cohort" on "cohort"."id" = "student"."cohort_id" 
group by "cohort"."name";

select "cohort"."name", count ("student") from "student"
right join "cohort" on "cohort"."id" = "student"."cohort_id" 
group by "cohort"."name";

select * from "person";

insert into "person" (name) values ('Chris'), ('Logan'), ('Bri'), ('Lisa'), ('Sara');

create table "hobby" (
"id" serial primary key,
"description" varchar(100)

);

insert into "hobby" (description) values ('Biking'), ('Painting'), ('Guitar'), ('Hockey'), ('Reading'), ('Traveling');

create table "person_hobby" (
"id" serial primary key,
"person_id" int references "person",
"hobby_id" int references "hobby",
"skill" int
);

select * from "hobby";

select * from "person";

insert into "person_hobby" ("person_id", "hobby_id", "skill")
values (5, 3, 2), (5, 5, 5),
(4, 4, 2), (4, 5, 2), (2, 3, 1), (2, 1, 3),
(3, 2, 2), (3, 1, 1), (3, 4, 3), (1, 1, 2);

select * from "person_hobby";

select "person"."name" as "friend", "hobby"."description" as "skillz" from "person"
join "person_hobby" as "ph" on "person"."id" = "ph"."person_id"
join "hobby" on "ph"."hobby_id" = "hobby"."id";

select "person"."name" as "friend", "hobby"."description" as "skillz" from "person"
join "person_hobby" as "ph" on "person"."id" = "ph"."person_id"
join "hobby" on "ph"."hobby_id" = "hobby"."id"
where "person"."name" = 'Bri';


delete from "person_hobby" where "person_id" = 3;
delete from "person" where "id" = 3;

select "person"."name", sum("person_hobby"."skill") from "person" 
join "person_hobby" on "person"."id" = "person_hobby"."person_id"
group by "person"."name"
order by "person"."name"
;

select "person_id" / "hobby_id" as "result" from "person_hobby";

select "id" from "hobby";




