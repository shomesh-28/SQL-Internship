create table department(dep_id int primary key, dep_name varchar(25));

create table employee(id int primary key,firstname varchar(25) not null,lastname varchar(25) not null,
contact_no varchar(12) not null check (contact_no similar to '[0-9]{3}-[0-9]{3}-[0-9]{4}'),
email_address varchar(50) not null,city varchar(30) not null,hire_date date not null,department_id int not null,manager_id int,
constraint depFK foreign key(department_id) references department(dep_id),constraint managerFK foreign key(manager_id) references employee(id));

create table attendance(attendance_id int,emp_id int,attendance_date date,check_in time,
constraint empIdFK foreign key(emp_id) references employee(id),constraint attPK primary key(emp_id,attendance_date));
drop table department,employee,attendance;
delete from department
insert into department values(1,'IT'),(2,'HR'),(3,'Manager');
insert into employee values(18,'John','Doe','000-000-0000','john@example.com','Mumbai','2021-12-8',1,1),
(19,'Novak','Djokovic','111-111-1111','novak@example.com','Delhi','2022-1-31',2,1),
(1,'Sundar','Pichai','222-222-2222','sundar@example.com','Pune','2020-12-1',3,null);

create or replace function attFun() returns Trigger as $$
begin 
update attendance set check_in = current_time where attendance_id = attendance_id;
return NEW;
end 
$$ language plpgsql;

create or replace trigger attendanceDate
after 
insert on attendance 
for each row
execute function attFun();

create sequence attId 
start with 1
increment by 1
minvalue 1
maxvalue 200 
cycle;


insert into attendance values(nextval('attId'),1,current_date,null);
select emp_id,count(*) as numberOfDaysWorked from attendance group by attendance_date,emp_id;