create table emp(id int primary key,name varchar(20),sal int,department varchar(10));

insert into emp values(1,'Jack',40000,'IT'),(2,'James',45000,'IT'),
(3,'Daniel',65000,'HR'),(4,'Yukta',70000,'HR'),
(5,'Sheldon',35000,'IT'),(6	,'Patsy',55000,'Finance'),(7,'Nathan',50000,'Finance'),(8,'Andy',60000,'Finance')

-- scalar subquery return single row and single column
select avg(sal) as average_salary from emp;
select * from emp
-- this is an example of scalar subquery. This query returns the details of the employees whose salary is more than the average salary
select * from emp where sal > (select avg(sal) from emp);

-- this is an example of a corelated subquery. 

-- this query return the details of the employees who earn more than the average salary in their department
select * from emp as e1 where sal > (select avg(sal) from emp as e2 where e1.department = e2.department)

-- using subquery inside in clause. This query returns the details of the employee who do not belong to HR department.

select * from emp where department not in (select department from emp where department = 'HR')

-- We could have directly found the details of the employee who do not belong to HR department using this query
-- select * from emp where department <> 'HR'
-- But instead of hardcoding the values i wrote a subquery just to show an example of how we can write a subquery inside the in clause.

