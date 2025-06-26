create table emp(emp_id int,name varchar(20),salary int,department varchar(2));

insert into emp values(1,'John',45000,'IT'),(2,'Kylie',35000,'IT'),(3,'Jenny',40000,'IT'),(4,'Jack',55000,'HR'),(5,'Emily',60000,'HR');

-- fetching all the columns and rows from the table

select * from emp;

-- fetching only particular columns from the table

select name,department from emp;

-- fetching the employees who belongs to IT department

select * from emp where department = 'IT';

-- fetching the employee details whose name ends with 'y'

select * from emp where name like '%y';

-- fetching the employee details whose name starts with 'J'

select * from emp where name like 'J%';

-- fetching the employee whose salary lies between 40000 and 50000. Also important thing to note over here is these values are inclusive.
--Meaning salaries with 40k and 55k will also be included in the table

select name,salary from emp where salary between 40000 and 55000;

-- sorting the table in ascending order of their salaries

select emp_id,name,salary from emp order by salary;