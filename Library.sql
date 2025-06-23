create table Author(authorId int,authorName varchar(50),country varchar(50), constraint pk primary key(authorId));

create table Publisher(publisherId int,publisherName varchar(50),address varchar(200),
contactNumber char(20) check (contactNumber like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]'),
constraint publisherPK primary key(publisherId));

create table users(userId int,name varchar(50),email varchar(50),phone char(20) 
check (phone like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]'),constraint userPK primary key(userId));

create table books(bookId int,title varchar(150) not null,authorId int,publisherId int,year int,quantity int,
constraint booksPK primary key(bookId), constraint booksFK1 foreign key(authorId) references Author(authorId),
constraint booksFK2 foreign key(publisherId) references Publisher(publisherId));

create table BooksBorrowed(id int,userId int,bookId int,borrowDate date,dueDate date, returnDate date,
constraint booksBorrowedPK primary key(id), constraint booksBorrowedFK1 foreign key(userId) references users(userId),
constraint booksBorrowedFK2 foreign key(bookId) references books(bookId));
