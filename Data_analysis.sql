/*Listing employee number, last name, first name, sex, and salary.*/
SELECT e.emp_no,
last_name,
first_name,
sex,
s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no=s.emp_no

/*Listing first name, last name, and hire date for employees who were hired in 1986.-*/
SELECT first_name,
last_name,
sex,
hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date 

/*Listing the manager of each department with the information of department number, 
department name, the manager's employee number, last name, first name.-*/

SELECT dm.dept_no,
dep.dept_name,
dm.emp_no,
e.last_name,
e.first_name
FROM dept_manager AS dm INNER JOIN departments AS dep ON dm.dept_no=dep.dept_no
INNER JOIN employees AS e ON dm.emp_no=e.emp_no

/*Listing the department of each employee with the following information:
employee number, last name, first name, and department name.-*/
SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees AS e
LEFT JOIN (dept_emp AS dm 
		   INNER JOIN departments AS d ON dm.dept_no=d.dept_no)
		   ON e.emp_no=dm.emp_no



/*List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."-*/

SELECT first_name,
last_name,
sex
FROM employees 
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'


/*List all employees in the Sales department, including their employee number, last name, first name, and department name.-*/

SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees AS e
LEFT JOIN (dept_emp AS dm 
		   INNER JOIN departments AS d ON dm.dept_no=d.dept_no)
		   ON e.emp_no=dm.emp_no
WHERE d.dept_name='Sales'


/*List all employees in the Sales and Development departments, including their 
employee number, last name, first name, and department name.-*/
SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees AS e
LEFT JOIN (dept_emp AS dm 
		   INNER JOIN departments AS d ON dm.dept_no=d.dept_no)
		   ON e.emp_no=dm.emp_no
WHERE d.dept_name IN ('Sales', 'Development')


/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.-*/
SELECT last_name,
COUNT(last_name) AS count_last_name
FROM employees 
GROUP BY last_name
ORDER BY count_last_name DESC