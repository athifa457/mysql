-- CREATING DATABASE
CREATE DATABASE company;
USE company;

-- CREATING TABLES
CREATE TABLE Managers(
managerID int auto_increment primary key,
First_name varchar (60) not null,
Last_name varchar(60) not null,
DOB varchar(60) not null,
Age int check(Age>27)not null,
gender varchar(60) not null,
department varchar(60) not null,
salary varchar(50) not null
);

desc Managers;

INSERT INTO Managers VALUES
(201,'sandra','Ram',02-03-1994,30,'female','IT',50000),
(202,'menon','krishna',02-05-1991,33,'male','HR',58000.67),
(203,'aliya','mohan',31-06-1990,34,'male','marketing',45000),
(204,'keerti','suresh',23-02-1998,36,'female','IT',40000),
(205,'kylie','jenner',30-08-1982,42,'female','IT',10000),
(206,'Athifa','salam',23-02-1996,28,'female','IT',23000),
(207,'zayed','zaem',28-10-1985,39,'male','marketing',15000.55),
(208,'rahul','krishna',18-11-1980,44,'male','marketing',33000),
(209,'joseph','kurian',28-13-1983,41,'male','marketing',40000),
(210,'thejas','joseph',29-03-1993,31,'male','HR',50000);

select * from Managers;

select managerID,First_name,Last_name,DOB from managers;
SELECT First_name,Last_name,salary*12 as "annual salary" from Managers;

select * from Managers WHERE managerID <>203;

SELECT * FROM Managers where department='IT';
select * from Managers WHERE salary >25000;

select * from Managers  where salary between 10000 and 35000;














