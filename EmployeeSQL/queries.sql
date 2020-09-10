--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM employees emp
INNER JOIN salaries sal on emp.emp_no = sal.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	last_name,
	first_name,
	hire_date
FROM employees
--WHERE DATE_PART('year', hire_date) = 1986 

WHERE hire_date >= '1986-01-1' and hire_date <='1986-12-31' 

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name
-- need dept_mngr table, department table, employee
CREATE VIEW mng_departments as
SELECT 
	emp.last_name,
	emp.first_name,
	emp.emp_no,
	dm.dept_no,
	dept.dept_name
FROM employees emp
JOIN dept_mngr dm on emp.emp_no = dm.emp_no
JOIN department dept on dm.dept_no = dept.dept_no

-- List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT 
	emp.last_name,
	emp.first_name,
	emp.emp_no,
	dept.dept_name
FROM employees emp
JOIN dept_emp de on emp.emp_no = de.emp_no
JOIN department dept on de.dept_no = dept.dept_no
WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT 
	emp.last_name,
	emp.first_name,
	emp.emp_no,
	dept.dept_name
FROM employees emp
JOIN dept_emp de on emp.emp_no = de.emp_no
JOIN department dept on de.dept_no = dept.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development'

-- In descending order, 
-- list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT
	last_name,
	count(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name desc

-- I wanted to see the "Epilogue"
SELECT *
FROM employees
WHERE emp_no = 499942
