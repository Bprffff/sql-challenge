--Create table that houses all company departments
CREATE TABLE Departments (
depart_number varchar(255) PRIMARY KEY,
department_name varchar(255))
;

--Insert departments.csv data into departments table
COPY departments(depart_number, department_name)
FROM 'C:/Users/bosto/Desktop/ClassHomework/Module 9/Starter_Code/data/departments.csv'
DELIMITER ','
CSV HEADER;

--Query to view newly inserted data
select * from departments 

--Create table that houses all employee information
create table employee_information (
employee_number integer primary key,
empl_title_id varchar(255),
dob varchar(15),
first_name text,
last_name text,
sex text,
hire_date varchar(15)); 

--Insert employees.csv data into employee information table
copy employee_information(employee_number, empl_title_id, dob, first_name, last_name, sex, hire_date)
from 'C:/Users/bosto/Desktop/ClassHomework/Module 9/Starter_Code/data/employees.csv'
delimiter ','
csv header;

--Query to view newly inserted data
select * from employee_information 

--Create table that houses all employee titles
create table employee_titles (
title_id varchar(255) not null primary key,
title text not null);

--Insert titles.csv data into employee titles table
copy employee_titles(title_id, title)
from 'C:/Users/bosto/Desktop/ClassHomework/Module 9/Starter_Code/data/titles.csv'
delimiter ','
csv header;

--Query to view newly inserted data
select * from employee_titles 

--Alter table employee information to create a foreign key, connecting employee information to employee titles table
alter table employee_information
add constraint create_employinfo_employtitles_connection
foreign key (empl_title_id) references employee_titles(title_id); 

--Create table that houses all employee salary info
create table employee_salaries (
employ_number integer not null,
salary money not null,
foreign key (employ_number) references employee_information(employee_number));

--Insert salaries.csv data into employee salaries table
copy employee_salaries(employ_number, salary)
from 'C:/Users/bosto/Desktop/ClassHomework/Module 9/Starter_Code/data/salaries.csv'
delimiter ','
csv header; 

--Query to view newly inserted and joined data
select * from employee_salaries es
inner join employee_information ei on es.employ_number = ei.employee_number 

--Create table that houses all department employees info
CREATE TABLE Department_Employees (
emp_number integer not null,
department_number varchar(255) not null,
foreign key (emp_number) references employee_information(employee_number),
foreign key (department_number) references departments(depart_number));

--Insert dept_emp.csv data into department employees table
COPY department_employees(emp_number, department_number)
FROM 'C:/Users/bosto/Desktop/ClassHomework/Module 9/Starter_Code/data/dept_emp.csv'
DELIMITER ','
CSV HEADER; 

--Create table that houses all department managers info
create table department_managers (
department_num varchar(255),
manager_employ_number integer,
foreign key (department_num) references departments(depart_number));

--Insert dept_manager.csv data into department managers table
COPY department_managers(department_num, manager_employ_number)
FROM 'C:/Users/bosto/Desktop/ClassHomework/Module 9/Starter_Code/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;