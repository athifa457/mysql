-- creating database
create database PRODUCT;
use product;

-- creating tables
create table customer(
customerID int auto_increment primary key,
First_name varchar(50) not null,
Last_name varchar(50) not null,
Email varchar(100) unique,
phonenumber varchar (15) ,
address varchar(225) not null,
city varchar(50) ,
state varchar(50) not null,
zip_code varchar(10) not null,
country varchar(50) not null
);

INSERT INTO customer values
(1,'john','doe','jone,doe@example.com','1234567891','12 elm street','new york','NY',10001,'USA'),
(2,'jane','smiith','jane.smith@example.com','0987654321','456 oak avenue','los angeles','California','90001','USA'),
(3,'alice','brown','alice.brown@example.com','9087654321','789 pine road','NY','IL','60601','USA'),
(4,'michael','jakson','michael.jakson@example.com','7869043211','565 vally villa','New york','NY','39090','USA'),
(5,'emily','davis','emily.davis@example.com','4356789021','242 rose garden','curie','tasmania','46474','austalia'),
(6,'adam','lane','adam.lane@example.com',6543216789,'212 road','anna nagar','chennai',728219,'india'),
(7,'mary','george','mary.george@example.com',1243564532,'16 street','new york','NY',10001,'USA'),
(8,'brent','rivera','brent.rivera@example.com',8120987937,'567 rose vally','new york','NY','20001','USA'),
(9,'andew','jane','andew.jane@example.com','2132321232','elm street','new york','NY','10001','USA'),
(10,'ben','akash','ben.akash@example.com',9128787870,'03 street road','kochin','kerala',28989,'india') ;

select *from customer;

CREATE VIEW customer_info AS 
SELECT CONCAT (First_name,' ',Last_name) AS fullname,
Email,address
from customer;

select * from customer_info;

create view USA_customers AS 
select
    customerID, 
    First_name ,
    Last_name ,
    Email ,
    phoneNumber ,
    address ,
    city ,
    state ,
    zip_code ,
    country
    from 
         customer
  where 
  country = 'USA';
  
  select * from USA_customers;
  
  create view customer_details AS
  select 
customerID, 
    First_name ,
    Last_name ,
    Email ,
    phoneNumber ,
    address ,
    city ,
    state ,
    zip_code ,
    country
    from
       customer;
       
       select * from customer_details;
       
    update customer
    set phoneNumber = '2345671891'
    where state = 'California'
    limit 1;
      
    select * from customer_details
    where state = 'California';
    

   select state,count(*) AS customercount
   from customer
   group by state
   having count(*) >5;
   
select state, count(*) AS customercount
from customer_details
group by state;   

select * from customer_details
order by state asc; 
    