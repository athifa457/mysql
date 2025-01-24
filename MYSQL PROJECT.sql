-- CREATING DATABASE
CREATE DATABASE LIBRARY;
USE library;

-- creating tables
create table Branch(
Branch_no INT PRIMARY KEY,
Manager_id INT,
Branch_address VARCHAR(255),
Contact_no VARCHAR(15)
);

CREATE TABLE Employee(
Emp_id INT PRIMARY KEY,
Emp_name VARCHAR(100),
Position VARCHAR(50),
Salary DECIMAL(10, 2),
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));

CREATE TABLE Books(
ISBN  INT PRIMARY KEY,
Book_title VARCHAR(225),
Category VARCHAR(100),
Rental_price DECIMAL(10, 2),
Status ENUM('Yes','No') DEFAULT 'Yes',
Author VARCHAR(100),
Publisher VARCHAR(100)
);

CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(100) NOT NULL,
Customer_address VARCHAR(255),
Reg_date DATE
);

CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(255),
Issue_date DATE,
Isbn_book INT,
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(255),
Return_date DATE,
Isbn_book2 INT,
FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES 
(1, 101, 'Main Street, NY', '1234567890'),
(2, 102, 'Second Avenue, CA', '0987654321'),
(3, 103, 'Third Road, TX', '1122334455'),
(4, 104, 'Fourth Lane, FL', '6677889900'),
(5, 105, 'Fifth Avenue, IL', '2233445566'),
(6, 106, 'Sixth Boulevard, OH', '7788990011'),
(7, 107, 'Seventh Street, NV', '3344556677'),
(8, 108, 'Eighth Drive, WA', '9988776655'),
(9, 109, 'Ninth Road, MI', '4455667788'),
(10, 110, 'Tenth Court, OR', '5566778899');

select* from Branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES 
(201, 'Alice Johnson', 'Librarian', 3000.00, 1),
(202, 'Bob Smith', 'Assistant Librarian', 2500.00, 2),
(203, 'Clara Brown', 'Clerk', 2000.00, 3),
(204, 'David Wilson', 'Assistant Librarian', 2600.00, 4),
(205, 'Evelyn Davis', 'Librarian', 3200.00, 5),
(206, 'Frank Miller', 'Clerk', 1900.00, 6),
(207, 'Grace Lee', 'Assistant Librarian', 2800.00, 7),
(208, 'Henry Walker', 'Librarian', 3500.00, 8),
(209, 'Isabella Hall', 'Clerk', 2100.00, 9),
(210, 'Jack Allen', 'Assistant Librarian', 2700.00, 10);

select * from Employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES 
(1001, 'The Great Gatsby', 'Fiction', 10.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(1002, '1984', 'Dystopian', 12.00, 'yes', 'George Orwell', 'Secker & Warburg'),
(1003, 'To Kill a Mockingbird', 'Classic', 8.50, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
(1004, 'The Catcher in the Rye', 'Classic', 9.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
(1005, 'Pride and Prejudice', 'Romance', 7.50, 'yes', 'Jane Austen', 'T. Egerton'),
(1006, 'The Hobbit', 'Fantasy', 11.00, 'no', 'J.R.R. Tolkien', 'George Allen & Unwin'),
(1007, 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 15.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
(1008, 'The Alchemist', 'Philosophical', 10.50, 'yes', 'Paulo Coelho', 'HarperTorch'),
(1009, 'Moby Dick', 'Adventure', 9.75, 'no', 'Herman Melville', 'Harper & Brothers'),
(1010, 'War and Peace', 'Historical', 13.00, 'yes', 'Leo Tolstoy', 'The Russian Messenger');

select * from Books;


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES 
(301, 'John Doe', '123 Elm Street, NY', '2025-01-01'),
(302, 'Jane Smith', '456 Oak Avenue, CA', '2025-01-02'),
(303, 'Michael Brown', '789 Pine Lane, TX', '2025-01-03'),
(304, 'Emily Davis', '101 Maple Road, FL', '2025-01-04'),
(305, 'Chris Wilson', '202 Cedar Blvd, IL', '2025-01-05'),
(306, 'Sophia Johnson', '303 Birch Street, OH', '2025-01-06'),
(307, 'Daniel Martinez', '404 Walnut Ave, WA', '2025-01-07'),
(308, 'Olivia Lee', '505 Chestnut Court, MI', '2025-01-08'),
(309, 'James Anderson', '606 Willow Lane, NV', '2025-01-09'),
(310, 'Emma Garcia', '707 Poplar Drive, OR', '2025-01-10');

select *from Customer;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES 
(401, 301, 'The Great Gatsby', '2025-01-10', 1001),
(402, 302, '1984', '2025-01-11', 1002),
(403, 303, 'To Kill a Mockingbird', '2025-01-12', 1003),
(404, 304, 'The Catcher in the Rye', '2025-01-13', 1004),
(405, 305, 'Pride and Prejudice', '2025-01-14', 1005),
(406, 306, 'The Hobbit', '2025-01-15', 1006),
(407, 307, 'Harry Potter and the Sorcerer\'s Stone', '2025-01-16', 1007),
(408, 308, 'The Alchemist', '2025-01-17', 1008),
(409, 309, 'Moby Dick', '2025-01-18', 1009),
(410, 310, 'War and Peace', '2025-01-19', 1010);

select * from Issuestatus;


INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES 
(501, 301, 'The Great Gatsby', '2025-01-20', 1001),
(502, 302, '1984', '2025-01-21', 1002),
(503, 303, 'To Kill a Mockingbird', '2025-01-22', 1003),
(504, 304, 'The Catcher in the Rye', '2025-01-23', 1004),
(505, 305, 'Pride and Prejudice', '2025-01-24', 1005),
(506, 306, 'The Hobbit', '2025-01-25', 1006),
(507, 307, 'Harry Potter and the Sorcerer\'s Stone', '2025-01-26', 1007),
(508, 308, 'The Alchemist', '2025-01-27', 1008),
(509, 309, 'Moby Dick', '2025-01-28', 1009),
(510, 310, 'War and Peace', '2025-01-29', 1010);

SELECT * FROM Returnstatus;

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name,salary
FROM employee
ORDER BY salary DESC;


SELECT 
    b.Book_title AS Book_Title, 
    c.Customer_name AS Customer_Name
FROM 
    IssueStatus i
JOIN 
    Books b ON i.Isbn_book = b.ISBN
JOIN 
    Customer c ON i.Issued_cust = c.Customer_Id;
    
    
SELECT 
    Category, 
    COUNT(*) AS Total_Books
FROM 
    Books
GROUP BY 
    Category;
    
    
SELECT 
    Emp_name, 
    Position 
FROM 
    Employee 
WHERE 
    Salary > 50000;
    
    
    
SELECT 
    c.Customer_name 
FROM 
    Customer c
LEFT JOIN 
    IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE 
    c.Reg_date < '2022-01-01'
    AND i.Issue_Id IS NULL;
    
    
SELECT 
    Branch_no, 
    COUNT(Emp_Id) AS Total_Employees
FROM 
    Employee
GROUP BY 
    Branch_no;
    
    
    
SELECT 
    c.Customer_name 
FROM 
    Customer c
JOIN 
    IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE 
    i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
    
    
    
SELECT 
    Book_title 
FROM 
    Books
WHERE 
    LOWER(Category) LIKE '%history%'
    OR LOWER(Book_title) LIKE '%history%';
    
    
    
SELECT 
    Branch_no, 
    COUNT(Emp_Id) AS Total_Employees
FROM 
    Employee
GROUP BY 
    Branch_no
HAVING 
    COUNT(Emp_Id) > 5;
    

    
SELECT 
    e.Emp_name AS Manager_Name, 
    b.Branch_address AS Branch_Address
FROM 
    Employee e
JOIN 
    Branch b ON e.Emp_Id = b.Manager_Id;
    
    
SELECT 
    c.Customer_name 
FROM 
    Customer c
JOIN 
    IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN 
    Books b ON i.Isbn_book = b.ISBN
WHERE 
    b.Rental_Price > 25;