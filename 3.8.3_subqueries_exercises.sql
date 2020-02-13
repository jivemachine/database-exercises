USE employees;

SELECT * FROM employees LIMIT 50;

# 1 Find all the employees with the same hire date as employee 101010 using a sub-query.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date IN (
SELECT hire_date
FROM employees
WHERE emp_no LIKE "101010");

# 2 Find all the titles held by all employees with the first name Aamod.
SELECT title, last_name
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = "Aamod"
	) AS;
	
# 3 How many people in the employees table are no longer working for the company?
SELECT count(*)
FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM salaries
	WHERE to_date > now()
	);
	
	
# 4 Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date LIKE "9999%")
AND gender = "F";

# 5 Find all the employees that currently have a higher than average salary.

SELECT a.first_name, a.last_name, 
	(SELECT e.emp_no, e.first_name, e.last_name
	FROM employees AS e
	WHERE emp_no IN (
		SELECT emp_no 
		FROM salaries
		WHERE to_date LIKE "9999%"
		) AS 
GROUP BY AVG(s.salary);
		
		
		
		
SELECT first_name, last_name, salary
FROM employees
JOIN salaries USING(emp_no)
WHERE to_date > now()
AND salary > (
    SELECT AVG(salary)
FROM salaries
    );		
		

SELECT  first_name, last_name,
    (SELECT max(salary)
     FROM salaries
     WHERE salaries.emp_no = employees.emp_no) employee_salary
FROM employees
WHERE emp_no IN
    (SELECT emp_no FROM salaries
    WHERE salary >
        (SELECT  AVG(salary)
        FROM salaries)
    AND now() BETWEEN from_date AND to_date);







(SELECT AVG(salary) 
FROM salaries)


SELECT first_name, last_name, (SELECT AVG(salary) FROM salaries)
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary > 
	(SELECT AVG(salary) 
	FROM salaries))
AND salaries to_date > now()
ORDER BY (SELECT AVG(salary) 
FROM salaries ASC;




SELECT first_name, last_name,
	(SELECT salary
	FROM salaries
	WHERE salary IN
		(SELECT AVG(salary)
		FROM salaries)
	AND salaries.to_date > now()
	AND salary > (SELECT AVG(salary)
		FROM salaries)
	) 
FROM employees;	




SELECT (SELECT count(*)
        FROM employees) 
        -
        (SELECT count(*)
        FROM salaries
        WHERE to_date > now()
);		
		
		


	# 6


	
	 
	










