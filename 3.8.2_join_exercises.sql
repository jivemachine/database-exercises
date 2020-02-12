
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no;
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

SELECT concat()




# 1

SELECT * FROM users;

SELECT * FROM roles;

#inner join
SELECT users.name AS username, roles.name AS role_name,
FROM users
JOIN roles
ON users.role_id = roles.id;

#left join
SELECT users.name AS username,
roles.name AS role_name
FROM users
LEFT JOIN roles 
ON users.role_id = roles.id;

#right join
SELECT users.name AS username,
count(roles.name) AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY username; 

# 4

USE employees;

# 2
SELECT * FROM departments; 
SELECT * FROM dept_manager;
SELECT* FROM employees_with_departments LIMIT 50;
SELECT* FROM employees LIMIT 50;
SELECT * FROM salaries LIMIT 50;
SELECT * FROM titles LIMIT 50;

SELECT departments.dept_name AS "Department Name",
concat(employees_with_departments.first_name, " ", employees_with_departments.last_name) AS "Department Managers"
FROM ;

# 2 department managers one lol
SELECT d.dept_name AS "Department Name",
concat(ewd.first_name, " ", ewd.last_name) AS "Department Managers"
FROM departments AS d
JOIN dept_manager AS dm
ON dm.dept_no = d.dept_no
JOIN employees_with_departments AS ewd
ON ewd.emp_no = dm.emp_no
WHERE dm.to_date = "9999-01-01"
LIMIT 10000;

# 3 managed by women
SELECT d.dept_name AS "Department Name",
concat(ewd.first_name, " ", ewd.last_name) AS "Department Managers"
FROM departments AS d
JOIN dept_manager AS dm
ON dm.dept_no = d.dept_no
JOIN employees_with_departments AS ewd
ON ewd.emp_no = dm.emp_no
JOIN employees AS e
ON e.emp_no = ewd.emp_no
WHERE e.gender = "F" AND dm.to_date = "9999-01-01"
LIMIT 10000;

#4 Find the current titles of employees currently working in the Customer Service department.
SELECT * FROM titles LIMIT 50;
SELECT * FROM departments;
SELECT * FROM employees_with_departments LIMIT 50;

SELECT t.title AS "Title", count(t.title) AS "Count"
FROM titles AS t
JOIN employees_with_departments AS ewd
ON t.emp_no = ewd.emp_no
JOIN departments AS d
ON d.dept_name = ewd.dept_name
WHERE d.dept_name = "Customer Service" AND t.to_date = "9999-01-01"
GROUP BY t.title
LIMIT 10000;

# 5 Find the current salary of all current managers.
SELECT * FROM salaries LIMIT 50;
SELECT * FROM departments;
SELECT * FROM employees_with_departments LIMIT 50;
SELECT * FROM dept_manager;

SELECT d.dept_name AS "Department Name", concat(ewd.first_name, " ", ewd.last_name) AS "Name", s.salary AS "Salary"
FROM departments AS d
JOIN employees_with_departments AS ewd
ON ewd.dept_no = d.dept_no
JOIN dept_manager AS dm
ON dm.emp = ewd.emp_no
JOIN salaries AS s
ON s.emp_no = ewd.emp_no
WHERE dm.to_date = "9999-01-01" AND s.to_date = "9999-01-01";

# 6 Find the number of employees in each department.
SELECT * FROM departments LIMIT 50;
SELECT * FROM employees_with_departments LIMIT 50;
SELECT * FROM employees LIMIT 50;
SELECT * FROM dept_emp LIMIT 50;



SELECT d.dept_no, d.dept_name, count(de.emp_no) AS "num_employees"
FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
WHERE de.to_date LIKE "9999%"
GROUP BY d.dept_no;


# 7 Which department has the highest average salary?
#not done

SELECT d.dept_name, AVG(s.salary) AS "average salary"
FROM departments AS d
LEFT JOIN dept_emp de USING(dept_no)
LEFT JOIN salaries AS s USING(emp_no)
WHERE s.to_date LIKE "9999%"
AND de.to_date LIKE "9999%"
GROUP BY d.dept_name
ORDER BY max(s.salary) DESC
LIMIT 1;


# 8 Who is the highest paid employee in the Marketing department?

SELECT e.first_name, e.last_name
FROM dept_emp AS de
LEFT JOIN salaries AS s USING(emp_no)
LEFT JOIN departments d USING(dept_no)
LEFT JOIN employees AS e USING(emp_no)
WHERE s.to_date LIKE "9999%"
AND d.dept_name LIKE "Marketing"
ORDER BY s.salary DESC
LIMIT 1;

# 9 Which current department manager has the highest salary?

SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM dept_manager AS dm
LEFT JOIN employees AS e USING(emp_no)
JOIN departments AS d USING(dept_no)
LEFT JOIN salaries AS s USING(emp_no)
WHERE dm.to_date LIKE "9999%"
ORDER BY s.salary DESC
LIMIT 1;



# 10 Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT 
concat(e.first_name, " ", e.last_name) AS "Employee Name",
d.dept_name,
concat(e.first_name, " ", e.last_name) AS "Manager Name"
FROM employees AS e
LEFT JOIN department_manager AS dm USING (emp.no)
LEFT JOIN departments AS d USING (dept_no)



















