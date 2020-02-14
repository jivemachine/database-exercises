
USE employees;

/*### 1 Write a query that returns all employees (emp_no), 
their department number, their start date, their end date, 
and a new column 'is_current_employee' that is a 1 if the employee 
is still with the company and 0 if not.*/


SELECT emp_no, dept_no, from_date, to_date, 
	 CASE
		WHEN to_date > NOW() THEN 1
		ELSE 0
	END AS "is_current_employee"
FROM dept_emp;




SELECT CASE
		WHEN to_date > NOW() THEN "is_current_employee" 
		WHEN to_date > now() THEN 1
		ELSE 0
	END AS a
FROM dept_emp;

SELECT CASE
        WHEN birth_date < '1983' THEN "old"
        WHEN gender = "f" THEN 1
        ELSE 0
    END AS gen_x_females
FROM employees;



/*### 2 Write a query that returns all employee names, and a new column 'alpha_group' 
that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.*/

SELECT first_name, last_name, 
	CASE	
		WHEN last_name < 'I%' THEN "A-H"
		WHEN last_name < 'R%' THEN "I-Q"
		ELSE "R-Z"
	END AS "Alpha_Group"
FROM employees
ORDER BY last_name;

# 3 

SELECT first_name,
	( SELECT birth_date,
	CASE
		WHEN birth_date LIKE ("195%") THEN 1
		WHEN birth_date LIKE ("196%") THEN 0
		 END AS decades
FROM employees
ORDER BY birth_date)
FROM employees;

SELECT count(*)
	
	CASE
	WHEN birth_date LIKE ("195%") THEN "50's"
	WHEN birth_date LIKE ("196%") THEN "60's"
	END AS decades
FROM employees;
	
	
	IF (birth_date LIKE "195%", TRUE, FALSE) AS decades
FROM employees
JOIN salaries USING(emp_no);


# What is the average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT d.dept_name, AVG(s.salary) AS money, AVG(salary) AS money2, 
	
	(CASE 
	WHEN dept_name IN ("Research", "Development") THEN "R&D"
	WHEN dept_name IN ("sales", "marketing") THEN "Sales & Marketing"
	WHEN dept_name IN ("production", "Quality Management") THEN "QM"
	WHEN dept_name IN ("finance", "Human Resources") THEN "Finanace & HR"
	WHEN dept_name IN ("Customer Service") THEN "Customer Service"
	END) AS "Dept_Group"
	
	
FROM salaries AS s
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
GROUP BY d.dept_name;

SELECT d.dept_name, AVG(s.salary)
FROM salaries AS s
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
GROUP BY d.dept_name;

SELECT 
	CASE
	WHEN de



SELECT d.dept_name, de.dept_no, AVG(salary)
FROM salaries AS s
JOIN dept_emp de USING(emp_no)
JOIN departments AS d USING(dept_no)
GROUP BY de.dept_no












