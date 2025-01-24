-- creating database
create database factoryDb;
use factoryDb;

-- creating tables
create table Worker(
worker_id INT,
Firstname CHAR(25),
Lastname CHAR(25),
salary INT,
joiningDate DATETIME,
department CHAR (25));

INSERT INTO Worker (worker_id, Firstname, Lastname, salary, joiningDate, department)
VALUES
    (1, 'John', 'Doe', '50000', '2023-01-15 09:00:00', 'HR'),
    (2, 'Jane', 'Smith', '60000', '2023-02-01 10:30:00', 'Finance'),
    (3, 'Alice', 'Johnson', '55000', '2023-03-12 08:45:00', 'IT'),
    (4, 'Bob', 'Brown', '70000', '2023-04-20 11:00:00', 'Marketing'),
    (5, 'Emily', 'Davis', '45000', '2023-05-10 14:15:00', 'Operations'),
    (6, 'Michael', 'Wilson', '80000', '2023-06-25 16:30:00', 'HR'),
    (7, 'Sarah', 'Taylor', '65000', '2023-07-05 12:00:00', 'Finance'),
    (8, 'David', 'Anderson', '62000', '2023-08-18 09:15:00', 'IT'),
    (9, 'Linda', 'Thomas', '48000', '2023-09-30 13:45:00', 'Marketing'),
    (10, 'James', 'Moore', '55000', '2023-10-22 15:20:00', 'Operations');
    
    select * from Worker;
    
    DELIMITER $$
    
    CREATE PROCEDURE Workerdetails (
    IN P_worker_id INT,
    IN P_Firstname CHAR (25),
    IN P_Lastname CHAR(25),
    IN P_salary INT,
    IN P_joiningDate DATETIME,
    IN P_department CHAR(25)
    )
    BEGIN
        INSERT INTO Worker ( worker_id, Firstname, Lastname, salary, joiningDate, department)
		VALUES (P_worker_id, P_Firstname, P_Lastname, P_salary, P_joiningDate, P_department);
    END$$
    
    DELIMITER ;
    
    CALL Workerdetails (11, 'June', 'Daniel', '40000', '2024-02-25 09:00:00', 'HR');
    
    select * from Worker;
    
    
    
    DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_worker_id INT,
    OUT p_salary CHAR(25)
)
BEGIN
    -- Retrieve the salary of the worker with the given worker_id
    SELECT salary
    INTO p_salary
    FROM Worker
    WHERE worker_id = p_worker_id;
END$$

DELIMITER ;

call getworkersalary(1,@salary);
select @salary as workersalary;

DELIMITER $$

CREATE PROCEDURE updateWorkerDepartment(
     IN P_worker_id INT,
     IN P_Department CHAR(25)
)
BEGIN
update Worker
SET Department = P_Department
WHERE worker_id = P_worker_id;
END$$

DELIMITER ;    
   
CALL updateWorkerDepartment(6,'Finance');

select * from Worker WHERE worker_id = 6;

DELIMITER $$

CREATE PROCEDURE Getworkercountbydepartment(
IN P_Department CHAR(25),
OUT P_workercount INT
)
BEGIN
    SELECT COUNT(*)
    INTO P_workercount
    FROM Worker
    WHERE Department = P_Department;
END$$

DELIMITER ;

CALL Getworkercountbydepartment('Finance', @workercount);
SELECT @workercount AS workercount;

DELIMITER $$

CREATE PROCEDURE Getavgsalarybydepartment(
IN P_Departmnet CHAR(25),
OUT P_avgsalary  INT
)
BEGIN
    -- CALCULATE THE AVERAGE SALARY FOR THE GIVEN DEPARTMENT
     SELECT AVG(salary)
     INTO P_avgsalary
     from Worker;
END$$

DELIMITER ;

-- declare a  session variable to hold the output value
SET @avgsalary = 0;

-- call the procedure with  department 
CALL Getavgsalarybydepartment('HR',@avgsalary);

-- retrieve the result stored in avgsalary
SELECT @avgsalary AS Averagesalary;



    