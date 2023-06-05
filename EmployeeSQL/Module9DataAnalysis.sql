--1.) List the employee number, last name, first name, sex, and salary of each employee
--columns ordered by employee number ascending
select ei.employee_number, ei.last_name, ei.first_name, ei.sex, es.salary
from employee_information ei
inner join employee_salaries es on ei.employee_number = es.employ_number
order by employee_number asc;

--2.) List the first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date
from employee_information
where hire_date like ('%1986');

-- 3.) List the manager of each department along with their department number, department name,
--employee number, last name, and first name
--columns ordered by department number ascending
select dm.department_num, d.department_name, ei.employee_number, ei.last_name, ei.first_name
from department_managers dm
inner join departments d on dm.department_num = d.depart_number
inner join department_employees de on d.depart_number = de.department_number
inner join employee_information ei on de.emp_number = ei.employee_number
where ei.employee_number in ('110022',
'110039',
'110085',
'110114',
'110183',
'110228',
'110303',
'110344',
'110386',
'110420',
'110511',
'110567',
'110725',
'110765',
'110800',
'110854',
'111035',
'111133',
'111400',
'111534',
'111692',
'111784',
'111877',
'111939')
group by dm.department_num, d.department_name, ei.employee_number, ei.last_name, ei.first_name
order by dm.department_num asc;

--4.) List the department number for each employee along with that employee's employee number, last name,
--first name, and department name.
--columns ordered by department number ascending
select de.department_number, ei.employee_number,ei.last_name, ei.first_name, d.department_name
from employee_information ei
inner join department_employees de on de.emp_number = ei.employee_number
inner join departments d on d.depart_number = de.department_number
order by de.department_number ASC

--5.) List the first name, last name, and sex of each employee whose first name is Hercules and whose last
--name begins with the letter B
--columns ordered by employee last name ascending
select first_name, last_name, sex
from employee_information
where first_name = 'Hercules'
and last_name like 'B%'
order by last_name ASC; 

--6.) List each employee in the Sales department, including their employee number, last name, and first name
--columns ordered by employee number ascending
select d.department_name, ei.employee_number, ei.last_name, ei.first_name
from employee_information ei
inner join department_employees de on de.emp_number = ei.employee_number
inner join departments d on d.depart_number = de.department_number
where d.department_name = 'Sales'
order by employee_number ASC 

--7.) List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name
--columns ordered by employee number ascending
select d.department_name, ei.employee_number, ei.last_name, ei.first_name
from employee_information ei
inner join department_employees de on de.emp_number = ei.employee_number
inner join departments d on d.depart_number = de.department_number
where d.department_name = 'Sales'
or d.department_name = 'Development'
order by employee_number ASC

--8.) List the frequency counts, in descending order, of all the employee last names (that is, how many employees
--share each lat name).
--columns ordered by employee last name descending
select last_name, count(last_name) as frequency_count
from employee_information
group by last_name
order by count(last_name) DESC