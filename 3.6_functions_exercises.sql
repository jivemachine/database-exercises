USE employees;


SELECT * FROM employees WHERE
gender = 'M' AND 
(first_name LIKE 'Irena' OR
first_name LIKE 'Vidya' OR
first_name LIKE 'Maya')
ORDER BY last_name DESC, first_name;

# 2
SELECT
	concat(first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;

#3
SELECT
	upper(concat(first_name, " ", last_name)) AS full_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;



# 4
SELECT 
datediff(now(), hire_date) / 365.25 AS years_employeed
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1999-12-31"
AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC, birth_date DESC;

USE salaries;

SELECT 
min(salary)
FROM salaries;

SELECT
	max(salary)
FROM salaries;

SELECT 
lower(
concat(
	LEFT(first_name, 1), 
	LEFT(last_name, 4),
	"_",
	substr(birth_date, 6, 2),
	substr(birth_date, 3,2)
	)) AS username,
first_name,
last_name,
birth_date
FROM employees;





