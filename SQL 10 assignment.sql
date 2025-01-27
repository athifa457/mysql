-- CREATING DATABASE
CREATE DATABASE SCHOOLDD;
USE schooldd;

-- creating tables
create table Teachers(
 teacher_id INT PRIMARY KEY,
name VARCHAR(100) not null,
subject VARCHAR(50)not null,
experience INT,
salary DECIMAL(10, 2)not null
);

 INSERT INTO Teachers (teacher_id, name, subject, experience, salary) VALUES
(1, 'John Smith', 'Mathematics', 10, 60000.00),
(2, 'Alice Johnson', 'English', 8, 55000.00),
(3, 'Robert Brown', 'History', 12, 65000.00),
(4, 'Emily Davis', 'Physics', 5, 48000.00),
(5, 'James Wilson', 'Biology', 15, 70000.00),
(6, 'Mary Taylor', 'Chemistry', 7, 53000.00),
(7, 'David Anderson', 'Geography', 9, 58000.00),
(8, 'Sophia Martinez', 'Computer Science', 4, 45000.00);

select * from Teachers;

-- CREATE THE  BEFORE INSERT TRIGGER

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON Teachers
FOR EACH ROW
BEGIN
     IF NEW.salary < 0 THEN 
     SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'SALARY CANNOT BE NEGATIVE';
     END IF;
END$$

DELIMITER ;

CREATE TABLE Teacher_log(
Log_id INT PRIMARY KEY AUTO_INCREMENT,
Teacher_id INT NOT NULL,
Action VARCHAR(50) NOT NULL,
Timestamp DATETIME NOT NULL
);

insert into Teacher_log (Log_id,teacher_id, Action, Timestamp)
VALUES
(001,1, 'insert', '2025-01-27 10:00:00'),
(002, 2,'insert', '2025-01-27 20:05:00'),
(003, 3, 'insert', '2025-01-27 10:10:00'),
(004, 4, 'insert', '2025-01-27 10:15:00'),
(005, 5, 'insert', '2025-01-27 10:20:00');

select * from Teacher_log;

-- CREATE AFTER INSERT TRIGGER

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON Teachers
FOR EACH ROW
BEGIN
   INSERT INTO Teacher_log(teacher_id, Action, Timestamp)
   VALUES  (NEW.teacher_id, 'insert', NOW());
END$$

DELIMITER ;

-- before delete trigger

DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON Teachers
FOR EACH ROW
BEGIN
     IF OLD.experience >10 THEN
     SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'cannot delete a teacher with more than 10 years of experiance';
     END IF;
END$$

DELIMITER ;

-- after delete trigger

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON Teachers
FOR EACH ROW
BEGIN
     INSERT INTO Teacher_log(teacher_id, Action, Timestamp)
     VALUES (OLD.teacher_id, 'delete', NOW()); 
END$$

DELIMITER ;

