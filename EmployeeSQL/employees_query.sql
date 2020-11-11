--SECOND STEP: FIND SUBSEQUENT DATA-----------------------------


-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
RIGHT JOIN salaries s
ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM dept_manager m
RIGHT JOIN departments d
ON m.dept_no = d.dept_no
RIGHT JOIN employees e
ON m.emp_no = e.emp_no
WHERE m.dept_no IS NOT NULL;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
RIGHT JOIN employees e
ON de.emp_no = e.emp_no
RIGHT JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.emp_no IS NOT NULL
ORDER BY de.emp_no ASC;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hurcules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their:
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
RIGHT JOIN employees e
ON de.emp_no = e.emp_no
RIGHT JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no;

-- List all employees in the Sales and Development departments, including their:
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
RIGHT JOIN employees e
ON de.emp_no = e.emp_no
RIGHT JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
ORDER BY de.emp_no;


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;