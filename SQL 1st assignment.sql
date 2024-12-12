-- DDL Commands
#1. create database
create database school;

use school;

-- creating tables
 create table students (
 students_Roll_No int auto_increment primary key,
 student_Name varchar(50) not null,
 student_Marks varchar(50) not null,
 student_Grade varchar(100) default 'overall');
 
 desc students;
 
 Alter table students add column contact_No int;
 
 Alter table students drop column student_Grade;
 
 desc students;
 
 rename table students to ClassTen;
 
 desc ClassTen;
 
 truncate table ClassTen;
 
 desc ClassTen;
 
 drop table ClassTen;






