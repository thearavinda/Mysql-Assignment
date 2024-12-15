create database SubqueriesandViews;
use SubqueriesandViews;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population int,
    Area decimal(11,2)
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating Decimal(5,2),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

desc Country;
desc Persons;

INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833520),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515767),
(5, 'Australia', 25600000, 7692024),
(6, 'Canada', 38000000, 9984670),
(7, 'Russia', 146000000, 17098242),
(8, 'Japan', 125800000, 377975),
(9, 'Germany', 83000000, 357386),
(10, 'France', 67000000, 551695);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(101, 'John', 'Doe', 330000, 4.5, 1, 'India'),
(102, 'Jane', 'Smith', 450000, 4.2, 2, 'USA'),
(103, 'Ali', 'Khan', 500000, 3.8, 3, 'China'),
(104, 'Maria', 'Gomez', 600000, 4.0, 4, 'Brazil'),
(105, 'Chris', 'Evans', 550000, 4.6, 5, 'Australia'),
(106, 'Amara', 'Lee', 400000, 3.9, 6, 'Canada'),
(107, 'Igor', 'Petrov', 500000, 4.3, 7, 'Russia'),
(108, 'Yuki', 'Tanaka', 420000, 4.1, 8, 'Japan'),
(109, 'Hans', 'Schmidt', 450000, 4.4, 9, 'Germany'),
(110, 'Marie', 'Dupont', 390000, 4.0, 10, 'France');

select * from Country;
select * from Persons;

select Country_name, count(*) as number_of_Persons 
from Country
group by Country_name ;

select Country_name, count(*) as number_of_Persons 
from Country
group by Country_name  
order by number_of_Persons desc ;

select Id,Fname, Lname, Country_name, avg(Rating) as avgrating
from Persons group by Id having avgrating > 3;

select Country_name, (select Rating from Persons where
Country.Id = Persons.Country_Id) as rating from
Country where Id =( select Country_Id from
Persons where Rating = 4.2) ;


select * from Country where
Population > (select avg(population) from Country) ;

create database Product ;
use Product ;

create table Customer(
Customer_ID int primary key,
Fname varchar(30),
Lname varchar(30),
Email varchar(50),
Phone_no varchar(50),
Address varchar(60),
City varchar(50),
State varchar(30),
Zip_code varchar(30),
Country varchar(30)
);

desc Customer ;

INSERT INTO Customer (Customer_ID, Fname, Lname, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak Avenue', 'New York', 'New York', '10001', 'USA'),
(3, 'Michael', 'Johnson', 'michael.j@example.com', '5678901234', '789 Pine Road', 'Chicago', 'Illinois', '60601', 'USA'),
(4, 'Emily', 'Davis', 'emily.d@example.com', '3456789012', '321 Maple Lane', 'Houston', 'Texas', '77001', 'USA'),
(5, 'Daniel', 'Williams', 'daniel.w@example.com', '4567890123', '654 Birch Blvd', 'Phoenix', 'Arizona', '85001', 'USA'),
(6, 'Sophia', 'Brown', 'sophia.b@example.com', '2345678901', '987 Cedar Street', 'Philadelphia', 'Pennsylvania', '19101', 'USA'),
(7, 'David', 'Jones', 'david.j@example.com', '7890123456', '111 Walnut Way', 'San Diego', 'California', '92101', 'USA'),
(8, 'Olivia', 'Garcia', 'olivia.g@example.com', '8901234567', '222 Ash Avenue', 'Dallas', 'Texas', '75201', 'USA'),
(9, 'Ethan', 'Martinez', 'ethan.m@example.com', '9012345678', '333 Cherry Lane', 'San Jose', 'California', '95101', 'USA'),
(10, 'Isabella', 'Lopez', 'isabella.l@example.com', '1238904567', '444 Spruce Circle', 'Austin', 'Texas', '73301', 'USA');

select * from Customer;

create view Customer_info as
select concat(Fname,' ', Lname) as Full_name, Email from Customer ;

select * from Customer_info ;

create view US_customers as
select Fname, Lname, Country  from Customer 
where Country = 'USA' ;

select * from US_Customers ;

create view Customer_details as
select concat(Fname,' ', Lname) as Fullname, Email, Phone_no, State
from Customer ;

select * from Customer_details ;

update  Customer_details
set phone_no = '9658745962'
where State = 'California' 
and Fullname = 'John Doe' ;

update  Customer_details
set phone_no = '9658745963'
where State = 'California' 
and Fullname = 'David Jones' ;

update  Customer_details
set phone_no = '987654321'
where State = 'California' 
and Fullname = 'Ethan Matinez' ;


select  State , count(Customer_ID) as numberofcustomers
from customer
group by State
having numberofcustomers > 5 ;

select State, count(*) as numberofcustomers
from Customer_details
group by State ;

select * from Customer_details
order by State asc ;





