create table emp(id int,name varchar(20),sal int,department varchar(10));

insert into emp values(1,'Jack',40000,'IT'),(2,'James',45000,'IT'),(3,'Daniel',65000,'HR'),(4,'Yukta',70000,'HR'),(5,'Sheldon',35000,'IT'),
(6,'Patsy',55000,'Finance'),(7,'Nathan',50000,'Finance'),(8,'Andy',60000,'Finance');

select * from emp;
-- finding the maximum salary in the departments 

select department,max(sal) as maximumSal from emp group by department;

-- finding the total salary of all the employees working in a particular department

select department,sum(sal) as totalSal from emp group by department;

-- query to find the name of the departments where the starting is salary is atleast 50K

select department from emp group by department having min(sal) >=  50000

-- we can see that daniel's salary is the lowest in HR department and he earns more than 50K. And Nathan salary in Finance department is the 
-- lowest and he earns exactly 50K and in IT department the minimum salary is 35K which is the salary of sheldon.
