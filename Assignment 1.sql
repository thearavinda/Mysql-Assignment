create database School;
use School;

create table STUDENT(
Roll_No int auto_increment primary key,
Name varchar(20) not null,
Marks int not null,
Grade char(1) check (Grade in ("A","B","C"))
);
desc STUDENT;

insert into STUDENT(Name,Marks,Grade) values(
"Abishek",45,"A"),
("Arun", 34,"B"),
("Chandu",36,"B"),
("Balu",24,"C")
;
select * from STUDENT;

alter table STUDENT add column Contact varchar(15) not null;

alter table STUDENT drop column Grade;

rename table STUDENT to CLASSTEN;

truncate CLASSTEN;
select * from CLASSTEN;

drop table CLASSTEN;
