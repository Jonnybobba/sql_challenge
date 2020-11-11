# sql_challenge

## Contense
In this repository you will find:

* A folder containing the initial csv files the data base is built upon
* employees_db contianing the sql code that builds the employees database
* employees_query containing the sql code that answers the following queries:

  1. List the following details of each employee: employee number, last name, first name, sex, and salary.

  2. List first name, last name, and hire date for employees who were hired in 1986.

  3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

  4. List the department of each employee with the following information: employee number, last name, first name, and department name.

  5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

  6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

  7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

  8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
 
* erd_code containing the code imputed into [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).
* employees_erd  the resulting erd from quickdatabasediagrams.com

## Clarifications
In the Database, dates are classified as the data type VARCHAR. Although there is a data type date I was still able to answer the queries presented...

* In order to find dates within a specific month(ex. December) we can use the clarification:
   WHERE hire_date LIKE '12/%'
* Meanwhile to find dates on within a specific year(ex. 1999) we use the clarification:
   WHERE hire_date LIKE '%/1999'
