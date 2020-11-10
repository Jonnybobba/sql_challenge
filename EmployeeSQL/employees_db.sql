-- Create table for departments
DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);
-- Once created import data from departments.csv
SELECT * FROM departments;


-- Create table for titles
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);
-- Once created import data from titles.csv
SELECT* FROM titles;


-- Create table for employees
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_no float PRIMARY KEY,
	emp_title_id VARCHAR,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR
);
-- Once created import data from employees.csv
SELECT* FROM employees;


-- Create table for salaries
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no float,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary float
);
-- Once created import data from salaries.csv
SELECT * FROM salaries;


-- Create table for department managers
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no float,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
-- Once created import data from dept_manager.csv
SELECT * FROM dept_manager;


-- Create table for department employees
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
	emp_no float,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- Once created import data from dept_emp.csv
SELECT * FROM dept_emp;



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
WHERE de.emp_no IS NOT NULL;

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
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their:
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
RIGHT JOIN employees e
ON de.emp_no = e.emp_no
RIGHT JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;