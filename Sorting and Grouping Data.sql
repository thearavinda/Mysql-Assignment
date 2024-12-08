create database sortingandgroupig;
use sortingandgroupig;

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

select Country_name, left(Country_name,3) from Country;
select concat(Fname,' ',Lname) as Fullname from Persons;
select count(distinct(Country_name)) as numberofuniquecountry from Persons;
select max(Population) as Max_Population from Country;
select min(Population) as Min_Population from Persons;

Insert into  Country (Id, Country_name, Population, Area) values
(11,'Chile',65890000,336589),
(12,'Norway',66698800,888652);

Insert into Persons(Id, Fname, Population, Rating, Country_Id, Country_name) values
(111,'Harry',125000,4.2,11,'Chile'),
(112,'Erling',250000,3.9,12,'Norway');

select count(Lname) as numberofLname from Persons;
select count(*) as numberofrows from Persons;
select Country_name, Population from Country order by Id limit  3;
select * from Country order by rand() limit 3;
select * from Persons order by Rating desc ;
select Country_name as Country, sum(Population) as TotalPopulation 
from Persons group by Country;
select Country_name as Country, sum(Population) as TotalPopulation
from Persons group by Country having TotalPopulation > 50000;
select count(Id) as TotalnumberofPerson, avg(Rating) as avgcountryrating, Country_name from Persons group by Country_name
having TotalnumberofPerson >2 order by  avgcountryrating asc;