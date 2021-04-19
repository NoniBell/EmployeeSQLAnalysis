-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
FULL OUTER JOIN "Salaries"
ON "Employees".emp_no="Salaries".emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT "Employees".first_name, "Employees".last_name, "Employees".hire_date
FROM "Employees"
WHERE "Employees".hire_date LIKE '%1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Departments".dept_no, "Departments".dept_name, "Dept_Manager".emp_no, "Employees".last_name, "Employees".first_name
FROM "Dept_Manager"
INNER JOIN "Departments" ON "Dept_Manager".dept_no="Departments".dept_no
INNER JOIN "Employees" ON "Dept_Manager".emp_no="Employees".emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Dept_Emp"
INNER JOIN "Departments" ON "Dept_Emp".dept_no="Departments".dept_no
INNER JOIN "Employees" ON "Dept_Emp".emp_no="Employees".emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT "Employees".first_name, "Employees".last_name, "Employees".sex
FROM "Employees"
WHERE "Employees".first_name = 'Hercules' AND 
"Employees".last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Dept_Emp"
INNER JOIN "Employees" ON "Dept_Emp".emp_no="Employees".emp_no
INNER JOIN "Departments" ON "Dept_Emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Dept_Emp"
INNER JOIN "Employees" ON "Dept_Emp".emp_no="Employees".emp_no
INNER JOIN "Departments" ON "Dept_Emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales'
OR "Departments".dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT "Employees".last_name, COUNT("Employees".last_name)
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY COUNT("Employees".last_name) DESC;
