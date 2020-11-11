departments
-
dept_no VARCHAR PK
dept_name VARCHAR

titles
-
title_id VARCHAR PK
title VARCHAR

salaries
-
emp_no VARCHAR FK - employees.emp_no PK
salary FLOAT

employees
-
emp_no FLOAT PK
emp_title_id VARCHAR FK >- titles.title_id
birth_date VARCHAR
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date VARCHAR

dept_manager
-
dept_no VARCHAR FK >- departments.dept_no PK
emp_no FLOAT FK - employees.emp_no PK

dept_emp
-
emp_no FLOAT FK >- employees.emp_no PK
dept_no VARCHAR FK >- departments.dept_no PK

