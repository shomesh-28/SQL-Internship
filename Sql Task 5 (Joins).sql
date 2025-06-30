create table customers(customer_id int,customer_name varchar(30),email varchar(40),address varchar(60),pincode int,
constraint pk primary key (customer_id));

create table order_details(order_id int,customer_id int,order_total float,order_date date,
constraint pk2 primary key (order_id),constraint fk foreign key (customer_id) references customer(customer_id));


insert into customers values(1,'Jack','jack@example.com','123 Maple Streets', 10001),
(2,'Alice Smith','alice@example.com','456 Sunset Blvd', 90001),
(3,'Carol Williams','carol@example.com','789 Lake Shore Drive', 60601),
(4,'David Brown','david@example.com','321 Bayou Lane', 77001)

insert into order_details values(101,1,250.00,'2025-06-30'),(102,1,175.50,'2025-06-25'),(103,2,99.99,'2025-06-10'),
(104,3,300.00,'2025-06-20'),(105,4,450.75,'2025-06-23'),(106,2,120.00,'2025-06-28');

select * from customers;

select * from order_details;

-- We can see that the order details are stored in a different table and the customer details are stored in the customer table
-- In order to find the details of the customer who has placed the order we need to perform join operation in order to join the two tables
select c.*,o.order_id,o.order_total,o.order_date from customers as c join order_details as o on c.customer_id = o.customer_id;

-- Theres no point in performing left join, right join or full join on both these table as the order table takes the reference of 
-- customer id from the customer table. So each order and every order will be associated to a customer or vice versa. No matter whichever
-- join operation we perform the output will be the same that we get from normal join

select c.*,o.order_id,o.order_total,o.order_date from customers as c left join order_details as o on c.customer_id = o.customer_id;
select c.*,o.order_id,o.order_total,o.order_date from customers as c right join order_details as o on c.customer_id = o.customer_id;
select c.*,o.order_id,o.order_total,o.order_date from customers as c full join order_details as o on c.customer_id = o.customer_id;
