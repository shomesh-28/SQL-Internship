create table purchase_details(product_type varchar(15),product_name varchar(25),price int,quantity_purchased int,customerId int);

insert into purchase_details values('Mobile Phone','Iphone 15',2500,2,1),('Mobile Phone','Samsung S24 Ultra',1500,1,2),
('Air Conditioner','Daikin',2000,3,2),('Air Conditioner','Haier',1200,5,3),('Air Conditioner','Hitachi',1600,4,7)

create or replace view sales_summary as 
select product_type,sum(quantity_purchased) as quantities_sold,sum(totalprice) as totalSales from 
(select *,quantity_purchased * price as totalPrice from purchase_details) x group by product_type;

create role manager
login
password 'vijaysales@123'

grant select on sales_summary to manager;