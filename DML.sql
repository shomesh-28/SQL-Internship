create table student(studentId int, firstname varchar(25) not null,lastname varchar(25) null,gender char(1) not null check (gender in ('M','F')),
board varchar(5) default 'SSC' check (board in ('SSC','ICSE','CBSE')),constraint pkey primary key(studentId));

-- we can insert values in a table in two ways

insert into student values(1,'John','Doe','M','ICSE');

insert into student(studentId,firstname,lastname,gender) values(2,'John','Wick','M');

select * from student;

update student set lastname = 'Wick' where studentId = 1;

update student set lastname = 'Doe' where studentId = 2;

select * from student;

delete from student where studentid = 2;

select * from student;