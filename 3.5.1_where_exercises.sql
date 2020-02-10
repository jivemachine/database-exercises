USE employees;

# 2
SELECT * FROM employees WHERE
gender = 'M' AND 
(first_name LIKE 'Irena' OR
first_name LIKE 'Vidya' OR
first_name LIKE 'Maya');

# 3
SELECT last_name FROM employees
WHERE last_name LIKE 'e%';

# 4
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

# 5
SELECT * FROM employees
WHERE birth_date LIKE "%-12-25";

#6 
SELECT * FROM employees
WHERE last_name LIKE "%q%";

SELECT * FROM employees
WHERE last_name LIKE 'e%' 
OR last_name LIKE '%e';

SELECT * FROM employees
WHERE last_name LIKE 'e%e';

SELECT * FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1999-12-31"
AND birth_date LIKE '%-12-25';

SELECT * FROM employees
WHERE last_name NOT LIKE "%qu%"
AND last_name LIKE "%q%";




