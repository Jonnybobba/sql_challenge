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
	emp_no float PRIMARY KEY,
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
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);
-- Once created import data from dept_manager.csv
SELECT * FROM dept_manager;


-- Create table for department employees
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
	emp_no float,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
-- Once created import data from dept_emp.csv
SELECT * FROM dept_emp;

