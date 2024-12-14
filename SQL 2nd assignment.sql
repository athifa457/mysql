-- CREATING DATABAASE
CREATE DATABASE SALES;
USE SALES;

-- CREATING TABLES
CREATE TABLE Orders(
orderid int auto_increment primary key unique,
customer_name varchar(50) not null,
product_category varchar(50) not null,
order_item varchar(50) not null,
contact_no varchar(70));

desc orders;

ALTER TABLE Orders add column order_quantity int;

RENAME TABLE Orders to sales_orders;

desc sales_orders;

INSERT INTO sales_orders VALUES 
(101,'john','electronics','airpod',3434545465,1),
(102,'mathew','electronics','laptop',3262627262,2),
(103,'kylie','accessories','books',8989787878,30),
(104,'stephen','home furnishing','sofa',2323434354,2),
(105,'catherin','home decor','lights',5363738353,7),
(106,'kendel','kitchen appliances','oven',0998989890,1),
(107,'mehak','electronics','speaker',9878789878,3),
(108,'nila','footwear','heels',3453637353,5),
(109,'amal','electronics','smart watch',3252525263,2),
(110,'nitara','home decor','photo frames',7876787678,6);

desc sales_orders;

select * from sales_orders;

SELECT customer_name,order_item from sales_orders;

UPDATE sales_orders set product_category = 'electronics' WHERE orderid =106;

DROP TABLE sales_orders;

