create database trigger_s;
use trigger_s;

create table teachers (
id int auto_increment primary key,
Name varchar(30),
Subject varchar(30),
Experience int ,
Salary decimal(10,2));

INSERT INTO teachers (Name, Subject, Experience, Salary) VALUES 
('Alice Johnson', 'Mathematics', 5, 55000.00),
('Bob Smith', 'Physics', 3, 48000.00),
('Catherine Lee', 'Chemistry', 8, 60000.00),
('David Brown', 'English', 4, 50000.00),
('Evelyn Garcia', 'Biology', 6, 57000.00),
('Frank Wilson', 'History', 10, 62000.00),
('Grace Martinez', 'Art', 2, 42000.00),
('Henry Davis', 'Physical Education', 7, 53000.00);

select * from teachers ;

create table teacher_log(
log_id int auto_increment primary key,
teacher_id int,
Action varchar(30),
timestamp datetime);

Delimiter //
create trigger before_insert_teacher
before insert on teachers
for each row
begin
if new.salary < 0 then
   signal sqlstate '45000'
   set message_text ='Salary cannot be negative' ;
end if;
end //
delimiter ;

Delimiter //
create trigger after_insert_trigger
after insert on teachers
for each row
begin

insert into teacher_log(teacher_id, action, timestamp)
values(new.id,'insert attempted', now());
end //
delimiter ;

INSERT INTO teachers (Name, Subject, Experience, Salary) VALUES 
('Jack Daniel', 'Biology', 4, 45000.00);

select * from teacher_log;

delimiter //
create trigger before_delete_trigger
before delete on teachers
for each row
begin

if old.experience > 10 then
signal sqlstate '45000'
set message_text ='cannot delete experience > 10';
end if;
end //
delimiter ;

DELIMITER //
create trigger after_delete_teacher
after delete on teachers
for each row
begin
    insert into teacher_log (teacher_id, action, timestamp)
   values (old.id, 'delete', NOW());
end//
DELIMITER ;

delete from teachers 
where ID =5;

select * from teacher_log ;