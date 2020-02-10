USE employees;


SELECT * FROM employees WHERE
gender = 'M' AND 
(first_name LIKE 'Irena' OR
first_name LIKE 'Vidya' OR
first_name LIKE 'Maya')
ORDER BY last_name DESC, first_name;


SELECT * FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;



SELECT * FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1999-12-31"
AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC, birth_date DESC;





