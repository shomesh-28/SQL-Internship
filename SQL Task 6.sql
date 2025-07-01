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

