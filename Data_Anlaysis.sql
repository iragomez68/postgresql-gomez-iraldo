-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no As "employee number",
	   emp.last_name AS "last name", 
	   emp.first_name AS "first name", 
	   emp.gender, 
	   sal.salary
FROM employees emp
JOIN salaries sal ON emp.emp_no = sal.emp_no;


-- 2. List employees who were hired in 1986.
SELECT emp.emp_no As "employee number",
	   emp.last_name AS "last name", 
	   emp.first_name AS "first name", 
	   emp.gender, 
	   emp.hire_date
FROM employees emp
WHERE date_part('year', emp.hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dep.dept_no AS "department number",
	   dep.dept_name AS "department name",
	   emp.emp_no AS "employee number",
	   emp.last_name AS "last name", 
	   emp.first_name AS "first name",
	   dm.from_date AS "start date",
	   dm.to_date AS "end date"
FROM departments dep
JOIN dept_manager dm on dep.dept_no = dm.dept_no
JOIN employees emp ON emp.emp_no = dm.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no As "employee number",
	   emp.last_name AS "last name", 
	   emp.first_name AS "first name", 
	   dep.dept_name AS "department name"
FROM employees emp
JOIN dept_emp de ON de.emp_no = emp.emp_no
JOIN departments dep ON dep.dept_no = de.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp.emp_no As "employee number",
	   emp.last_name AS "last name", 
	   emp.first_name AS "first name", 
	   emp.gender, 
	   emp.hire_date
FROM employees emp
WHERE emp.first_name = 'Hercules' AND
	  emp.last_name LIKE 'B%';
	  
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no As "employee number",
	   emp.last_name AS "last name", 
	   emp.first_name AS "first name", 
	   dep.dept_name AS "department name"
FROM employees emp
JOIN dept_emp de ON de.emp_no = emp.emp_no
JOIN departments dep ON dep.dept_no = de.dept_no
WHERE dep.dept_name = 'Sales';
	  
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no As "employee number",
	   emp.last_name AS "last name", 
	   emp.first_name AS "first name", 
	   dep.dept_name AS "department name"
FROM employees emp
JOIN dept_emp de ON de.emp_no = emp.emp_no
JOIN departments dep ON dep.dept_no = de.dept_no
WHERE dep.dept_name = 'Sales' OR
	  dep.dept_name = 'Development';
	  
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT emp.last_name AS "last name", 
	   COUNT(*) AS "employee count"
FROM employees emp
GROUP BY emp.last_name
ORDER BY COUNT(*) DESC;

-- Bonus: Calculate average salary by employee title
SELECT ttl.title, round(avg(sal.salary),2) AS "average salary"
FROM salaries sal 
JOIN titles	ttl on sal.emp_no = ttl.emp_no
GROUP BY ttl.title;