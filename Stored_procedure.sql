create database stored_procedure ;
use  stored_procedure ;

CREATE TABLE Workers (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

INSERT INTO Workers (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(3, 'Alice', 'Johnson', 70000, '2020-06-01', 'IT'),
(4, 'Bob', 'Brown', 45000, '2019-11-20', 'Marketing'),
(5, 'Charlie', 'Davis', 52000, '2023-02-15', 'Operations'),
(6, 'Diana', 'Evans', 65000, '2021-08-10', 'Finance'),
(7, 'Edward', 'Wilson', 48000, '2022-12-05', 'HR');

Delimiter //
create procedure Add_worker(
in inworkerid int,
in infirstname varchar(30),
in inlastname varchar(30),
in insalary decimal(10,2),
in inJoiningdate datetime,
in indepartment varchar(30))
begin
insert into Workers(Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
values( inworkerid, infirstname, inlastname, insalary, inJoiningdate, indepartment);
end //
delimiter ;

call Add_worker(8, 'ganga', 'Raj', 50000,'2020-05-12','Administration');
select * from workers;

delimiter $$
create procedure worker_salary(in ID  int, out p_salary decimal(10,2))
begin
select Salary into p_salary
from Workers
where worker_id = ID;
end $$
delimiter ;

set @p_salary = 0 ;
call worker_Salary(8, @p_salary);
select  @p_salary as salary ;

delimiter //
create procedure update_department(in ID int, in dept_name varchar(30))
begin
update Workers set department = dept_name
where worker_id = ID ;
end //
delimiter ;

call update_department ( 4,'sales');
select * from workers ;

delimiter $$
create procedure workers_number(in dept_name varchar(25), out p_workerCount int)
begin
select count(*) into p_workercount
from Workers 
where department = dept_name;
end $$
delimiter ;

set @p_workercount = 0;
call workers_number('HR',@p_workercount);
select @p_workercount as numberofworkers;

delimiter //
create procedure average_salary(in dept_name varchar(25), out p_avgsalary int)
begin
select avg(salary) into p_avgsalary
from workers
where department = dept_name;
end //
delimiter ;

set @p_avgsalary = 0 ;
call average_salary('IT',@p_avgsalary) ;
select @p_avgsalary as averagesalary ;



