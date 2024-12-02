create database QueryingData;
use QueryingData;

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

select distinct Country_name from Persons;
select Fname as Firsnames, Lname as Lastnames from Persons;
select * from Persons where Rating > 4.0;
select Country_name from Persons where Population > 1000000;
select * from Persons where Country_name = 'USA' or Rating > 4.5;
select * from Persons where Country_name is Null;
select * from Persons where Country_name in('USA','Canada','UK');
select * from Persons where Country_name  not in ('India','Australia');
select * from Persons where Population between 500000 and 2000000;
select * from Persons where Country_name not like 'C%';

