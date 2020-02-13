CREATE TEMPORARY TABLE animals (
	NAME VARCHAR(256) NOT NULL
	);
	
	SELECT * FROM animals;
	
INSERT INTO animals (NAME) VALUES ("Bat");


INSERT INTO animals (NAME) VALUES
("Blue Butterfly"),
("Monkey Giraffe"),
("Underground Shark"),
("Yeti"),
("Pancake Earter");

SELECT * FROM animals;

CREATE TEMPORARY TABLE Cake (
	NAME VARCHAR(256),
	quantity INT UNSIGNED);
	
INSERT INTO Cake (NAME, quantity)
VALUES
("Chocolate", 35),
("Vanilla", 2),
("Bacon", 400000);

SELECT * FROM Cake;
	


# 1 Using the example from the lesson, re-create the employees_with_departments table.

CREATE TABLE employees_with_departments AS 
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);  

## 1a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
DESCRIBE employees.employees;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

## 1b.	Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = concat(first_name, " ", last_name);

SELECT *
FROM employees_with_departments
LIMIT 100;

## 1c. Remove the first_name and last_name columns from the table.

ALTER TABLE
employees_with_departments
DROP COLUMN last_name;

SELECT * FROM employees_with_departments
LIMIT 100;

## 1d. What is another way you could have ended up with this same table?


CREATE TABLE employees_with_departments2 AS
SELECT emp_no, concat(employees.first_name, " ", employees.last_name), dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

SELECT * FROM employees_with_departments2 LIMIT 50;

# 2 Create a temporary table based on the payment table from the sakila database.

CREATE TEMPORARY TABLE payments AS 
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM sakila.payment;

SELECT * FROM payments LIMIT 50;


#Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

DESCRIBE payments;

UPDATE payments SET amount = (amount * 100) -1;

ALTER TABLE payments MODIFY amount FLOAT;

UPDATE 
payments 
SET amount = amount * 100;

ALTER TABLE payments MODIFY amount INTEGER;

SELECT * FROM payments LIMIT 50;

# 3 Find out how the average pay in each department compares to the overall average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department to work for? The worst?

CREATE TEMPORARY TABLE employees2 AS
SELECT emp_no, salary, dept_name, to_date
FROM employees.dept_emp
JOIN employees.salaries USING(emp_no)
JOIN employees.departments USING(dept_no);

CREATE TEMPORARY TABLE employees3 AS
SELECT emp_no, salary, dept_name, to_date
FROM employees.dept_emp
JOIN employees.salaries USING(emp_no)
JOIN employees.departments USING(dept_no);

CREATE TEMPORARY TABLE employees4 AS
SELECT emp_no, salary, dept_name, to_date
FROM employees.dept_emp
JOIN employees.salaries USING(emp_no)
JOIN employees.departments USING(dept_no);

## AVG per department
SELECT dept_name, AVG(salary) 
FROM employees2
WHERE to_date LIKE "9999%"
GROUP BY dept_name;

# avg for entire company
SELECT AVG(salary)
FROM employees2;  

# standard deviation
SELECT stddev(salary)
FROM employees2;

## equation

#### this works, but missing to_dates from orioginal temporary tables
SELECT dept_name, (AVG(salary) - (SELECT AVG(salary) FROM employees3))
/ (SELECT stddev(salary) FROM employees4)
FROM employees2  
GROUP BY dept_name;



DESCRIBE employees2;

SELECT dept_name, AVG(salary) 
FROM employees2
GROUP BY dept_name;




AS salary_z_score
WHERE salary_z_score - salary_z_score;




AND salary_z_score /  stddev(salary);



SELECT dept_name, 
	(SELECT AVG(salary) 
	FROM employees2 
	GROUP BY dept_name) AS salary_z_score
WHERE salary_z_score - (SELECT AVG(salary FROM employees2))
AND salary_z_score / (SELECT stddev(salary) FROM employees2)

