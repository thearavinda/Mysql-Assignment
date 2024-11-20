
create database Sales;
use Sales;

create table Orders(
Order_Id int auto_increment primary key,
Customer_name varchar(20) not null,
Product_Category varchar(25) not null,
Ordered_item varchar(30) not null,
Contact_No varchar(15) unique not null)
; 
desc Orders;

alter table Orders add column order_quantity int not null;
select * from Orders;

rename table Orders to sales_orders ;
desc sales_orders;
select * from sales_orders;

insert into sales_orders(Customer_name, Product_Category,Ordered_item, Contact_No, order_quantity) values(
"Akash","Electronics","Laptop","46575939",25),
("Alex","Electronics","Mobile","75684978",36),
("Ajith","Staionary","Book","16354538",40),
("johny","Clothing","T-shirt","76865478",5),
("Frank","Furniture","Table","83937365",10),
("Hank","Clothing","Jacket","65758394",24),
("Sandra","Electronics","Tablet","764859574",30),
("John","Furniture","Sofa","45368906",25),
("Grace","Groceries","Rice","79765430",45),
("Tom","Electronics","Smartphone","12345678",17)
;
select * from sales_orders;

select customer_name,Ordered_item from sales_orders;

update sales_orders
 set Ordered_item ="Gaming Laptop"
where Order_ID = 1;

drop table sales_orders;











