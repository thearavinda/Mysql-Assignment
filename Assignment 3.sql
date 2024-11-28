use Sales;

Create Table Managers(
Manager_Id int auto_increment primary key,
First_Name varchar(20) not null,
Last_Name varchar(20) not null,
DOB date ,
Age int check (Age>0),
Last_update date,
Gender varchar(10),
Department varchar(20) not null,
Salary decimal (7,2) not null
)
;

desc Managers;

Insert into Managers(First_Name,Last_Name,DOB,Age,Last_update, Gender,Department,Salary) Values
('John', 'Smith', '1980-05-10', 44, '2024-11-20', 'Male', 'HR', 30000),
( 'Aaliya', 'Khan', '1992-08-15', 32, '2024-11-21', 'Female', 'Finance', 28000),
( 'Raj', 'Sharma', '1985-02-20', 39, '2024-11-22', 'Male', 'IT', 27000),
( 'Sophia', 'Brown', '1990-07-25', 34, '2024-11-23', 'Female', 'Marketing', 32000),
( 'David', 'Wilson', '1975-03-18', 49, '2024-11-24', 'Male', 'IT', 36000),
( 'Emma', 'Taylor', '1988-11-30', 35, '2024-11-25', 'Female', 'IT', 25000),
( 'Liam', 'Jones', '1983-12-10', 40, '2024-11-20', 'Male', 'Operations', 29000),
( 'Olivia', 'Williams', '1995-06-05', 29, '2024-11-21', 'Female', 'Finance', 34000),
( 'Noah', 'Garcia', '1991-09-12', 33, '2024-11-22', 'Male', 'IT', 15000),
( 'Ava', 'Martinez', '1987-04-23', 37, '2024-11-23', 'Female', 'HR', 20000);

Select * from Managers;

Select Concat(First_Name,' ',Last_Name) as Name,DOB from Managers where Manager_Id =1;
Select Manager_Id, First_Name, Last_Name, Salary * 12 as Annual_income from Managers;
Select * from Managers where First_Name <> 'Aaliya';
Select * from Managers where Department= 'IT' and Salary> 25000;
Select * from Managers where Salary between 10000 and 35000;




