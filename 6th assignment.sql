-- creating database
create database countries;
use countries;

-- creating tables
create table country(
countryID int auto_increment primary key,
country_name varchar(60),
populationArea varchar(60)not null
);

create table persons(
ID int auto_increment primary key,
First_name varchar(60) not null,
Last_name varchar(60) not null,
populationRating varchar(50) not null,
countryID int,
country_name varchar(60) 
);

desc persons;
desc country;

INSERT INTO country values
(01,'USA','91,000 Sqkm'),
(02,'canada','90,000 sqkm'),
(03,' india','29,000 sqkm'),
(04,'UK','22,000 sqkm'),
(05,'germany','32,000 sqkm'),
(06,'korea','2 ,000 sqkm'),
(07,'australia','83,OOO sqkm'),
(08,'japan','3,000 sqkm'),
(09,'iran','56000 sqkm'),
(10,'iraq','10600 sqkm');

insert into persons values
(11,'asha','sharath',2.1,01,'USA'),
(12,'Roshan','mathew',3.4,02,'canada'),
(13,'adil','zaeem',2.6,05,'germany'),
(14,'imran','mehk',1.4,04,'UK'),
(15,'Ayesha','melin',4.1,03,'india'),
(16,'rehma','kareem',3.1,08,'null'),
(17,'rasiya','salam',2.7,07,'australia'),
(18,'nahwa','amal',1.3,09,'null'),
(19,'henna','fayes',2.3,06,'korea'),
(20,'adil','zaeem',2.1,01,'USA');

select * from country;
select * from persons;

-- INNER JOIN
select p.ID,p.First_name,c.country_name from persons p
INNER JOIN
country c on p.countryID = c.countryID;

-- LEFT JOIN
select p.ID,p.First_name,c.country_name from persons p
LEFT JOIN
country c on p.countryID = c.countryID;

-- RIGHT JOIN
select p.ID,p.First_name,c.country_name from persons p
RIGHT JOIN
country c on p.countryID = c.countryID;

-- UNION
select country_name from country
union
select country_name from persons;

-- union all
select country_name from country
union all 
select country_name from persons;

-- ROUND
SELECT populationrating, round(populationrating,0) as rounded_populationrating from persons;

