--Create database
create database CoffeeShopDB

--Create Tables
create table ManagerTable
(
  Id_Man int not null,
  Username varchar(225),
  Passwords varchar(225)
  Primary key (Id_Man)
);

create table SalesTable
(
  Id_Sale int not null,
  Quantity int,
  Descriptions varchar(225),
  Price decimal (4,2),
  Total decimal (6,2),
  Dates varchar(225)
  Primary key (Id_Sale)
);

create table CoffeePriceTable
(
  Id_Coffee int not null,
  Coffee_Type varchar(225),
  Small_Price decimal (4,2),
  Medium_Price decimal (4,2),
  Large_Price decimal (4,2),
  Id_Sale int not null
  Primary key (Id_Coffee)
  Foreign key (ID_Sale) references SalesTable
);

--Insert Data
insert into ManagerTable(Id_Man,Username,Passwords)
values(1,'Isaacl@CTU','Ctu@2022'),
(2,'LeratoP@CTU', 'Ctu#'),
(3,'AlfredM@CTU', 'Ctu%2022')

insert into SalesTable(Id_Sale, Quantity,Descriptions, Price, Total, Dates)
values(1, 2, 'Late', 18.00,36.00, '13/05/2022'),
(2,4,'Espresso', 27.00, 108.00, '14/05/2022'),
(3,2,'Americano', 19.00, 38.00, '15/05/2022'),
(4,3,'Cappuccino', 22.00, 66.00, '16/05/2022'),
(5,4,'Macchiato', 23.00, 92, '17/05/2022')

insert into CoffeePriceTable(Id_Coffee, Coffee_Type, Small_Price, Medium_Price, Large_Price, Id_Sale)
values(1,'Americano', 19.00, 20.00, 25.00,3),
(2,'Cappuccino',22.00,27.00, 31.00, 4),
(3,'Espresso',25.00, 27.00,30.00, 2),
(4,'Late', 18.00,20.00,22.00,1),
(5,'Macchiato',23.00, 26.00,35.00,5)

--Stored procedure Sum all
create procedure SumOfAllTotal
as
select Sum(Total)
from SalesTable

exec SumOfAllTotal

--Stored procedure Select and Join
create procedure SelectAllfromT2andT3
as
select*
from CoffeePriceTable join SalesTable on CoffeePriceTable.Id_Sale = SalesTable.Id_Sale

exec SelectAllfromT2andT3

--Stored procedure update
create procedure UpdatePrice
as
update CoffeePriceTable
set Small_price = 25.00, Medium_Price = 30.00, Large_Price = 35.00
where Coffee_Type = 'Cappuccino'

exec UpdatePrice

select* from CoffeePriceTable join SalesTable on CoffeePriceTable.Id_Sale = SalesTable.Id_Sale
