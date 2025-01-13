-- creating database
create database countriesob;
use countriesob;

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




ALTER TABLE persons ADD COLUMN DOB Date;
select * from persons
where DOB <=curdate() -interval 24 year
and DOB <= curdate() - interval 50 year;

desc persons;


INSERT INTO country  VALUES 
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


insert into persons(ID,First_name,Last_name,populationRating,countryID,country_name,DOB) values
(11,'asha','sharath',2.1,01,'USA','1999-05-24'),
(12,'Roshan','mathew',3.4,02,'canada','1995-03-28'),
(13,'adil','zaeem',2.6,05,'germany','1981-02-23'),
(14,'imran','mehk',1.4,04,'UK','1994-12-03'),
(15,'ayesha','melin',4.1,03,'india','1990-01-31'),
(16,'rehma','kareem',3.1,08,'null','1989-07-23'),
(17,'rasiya','salam',2.7,07,'australia','1999-09-28'),
(18,'nahwa','amal',1.3,09,'null','1994-06-14'),
(19,'henna','fayes',2.3,06,'korea','1983-04-30'),
(20,'adil','zaeem',2.1,01,'USA','1982-05-31');
 

select * from country;
select * from persons;


delimiter //
create function calculateAge(DOB Date)
returns Date
not deterministic
no sql
begin
return Age(DOB);
end //
delimiter ;    

SELECT timestampdiff(YEAR,DOB,CURDATE()) AS Age
from persons;


select LENGTH(country_name) AS
 lengthofname 
 from country;
 
 select substring(country_name, 1,3)
 from country;

SELECT UPPER (country_name) 
FROM country;


SELECT LOWER (country_name) 
from country;