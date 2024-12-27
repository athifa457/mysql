-- creating database
create database countrydb;
use countrydb;

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

-- extracting the substring of the first three charactersfrom the country_name column
SELECT SUBSTRING(country_name,1,3) from country;

select concat('asha','sharath');
select concat('roshan','mathew');
select concat('adil','zaeem');
select concat('imran','mehk') ;
select concat('Ayesha','melin');
select concat('rehma','kareem');
select concat('rasiya','salam');
select concat('nahwa','amal');
select concat('henna','fayes');
select concat('adil','zaeem') ;

SELECT COUNT(DISTINCT country_name)from persons;

SELECT MAX(populationArea)from country;

SELECT MIN(populationRating) from persons;

 insert into persons values
 (21,'rahul','null',3.4,02,'canada'),
 (22,'ahmed','null',2.3,06,'korea');
 
 select * from persons;
 
 select count(distinct Last_name)from persons;
  
 select count(*) AS number_of_rows from persons;
 
SELECT * from persons where populationRating limit 3;

SELECT * FROM persons ORDER BY RAND()LIMIT 3;

SELECT populationRating FROM persons ORDER BY populationRating  DESC;

SELECT populationRating,country_name  from persons ;

SELECT * FROM persons WHERE populationRating > '50,000';

select count(distinct First_name,Last_name)from persons;
select AVG(populationRating) from persons;

select AVG(populationRating) from persons order by populationRating >2 desc;

