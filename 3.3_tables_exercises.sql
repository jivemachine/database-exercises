USE employees;

SHOW TABLES;

SELECT * FROM employees;

DESCRIBE employees;

### 5 int, date, varchar, enum

### 6 emp_no, gender

### 7 first_name, last_name, gender

### 8 birth_date, hire_date

SELECT * FROM departments;

DESCRIBE departments;

### 9 the relationship is the employees_with_departments table 

SELECT * FROM employees_with_departments;

SELECT * FROM dept_manager;

SHOW CREATE TABLE dept_manager;

SELECT * FROM salaries;

-/* - CREATE TABLE `dept_manager` (
  `emp_no` INT(11) NOT NULL,
  `dept_no` CHAR(4) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ) 
--   ENGINE=INNODB DEFAULT CHARSET=latin1  */




