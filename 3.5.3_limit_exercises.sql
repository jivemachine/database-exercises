USE employees;

SELECT DISTINCT last_name 
FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT * FROM employees
WHERE hire_date LIKE "199%"
AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC, birth_date ASC;

SELECT * 
FROM employees
WHERE birth_date LIKE "%12-25"
AND hire_date LIKE "199%"
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5;


SELECT * 
FROM employees
WHERE birth_date LIKE "%12-25"
AND hire_date LIKE "199%"
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5
OFFSET 45;

# finding your OFFSET

(page - 1) * limit = OFFSET





