create database SQL_Joins;

use SQL_Joins;

create table Customers 
(
CustomerID int primary key,
CustomerName varchar (50),
City varchar(15)
);

Alter table Customers
modify CustomerName varchar (50) not null;

select * from Customers;

insert into Customers values
(
1,"John Smith","New York"
);
truncate Customers;
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount float
);

select * from Orders;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);

CREATE TABLE Payments (
    PaymentID VARCHAR(10),
    CustomerID INT,
    PaymentDate DATE,
    Amount INT
);

select * from Payments;

INSERT INTO Payments (PaymentID, CustomerID, PaymentDate, Amount) VALUES
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    ManagerID INT
);

select * from Employees;

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID)
VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'David Kim', 2),
(5, 'Eva Smith', 2);

select CustomerName
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID;

select CustomerName,OrderID
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID;

select OrderID,CustomerName
from Orders as o
left join Customers c
on o.CustomerID = c.CustomerID;

select CustomerName,OrderID
from Customers c 
left join Orders as o
on  c.CustomerID = o.CustomerID 
union
select CustomerName,OrderID
from Customers c 
right join Orders as o
on  c.CustomerID = o.CustomerID;

select CustomerName,OrderID
from Customers c 
left join Orders  o
on  c.CustomerID = o.CustomerID
where OrderID is Null;

select CustomerName,PaymentID
from Customers c
left join Payments p
on c.CustomerID=p.CustomerID
;

select c.CustomerName,o.OrderID,p.PaymentID
from Customers c
inner join payments p
on c.CustomerID=p.CustomerID
left join orders o
on c.CustomerID=o.CustomerID
where o.OrderID is null;

select *
from customers 
cross join orders 
;

select c.CustomerID,o.Amount as order_amount,p.Amount as paid_amount
from customers c
left join orders o
on c.CustomerID=o.CustomerID

left join
 payments p
on c.CustomerID = p.CustomerID;


select o.OrderID,p.Amount as payment_amt
from orders o
left join payments p
on o.CustomerID=p.CustomerID;

#Retrieve all customers who have both placed orders and made payments

select distinct c.CustomerName ,o.OrderID,p.Amount,c.CustomerID
from customers c
join orders o
on c.CustomerID=o.CustomerID
join payments p
on p.CustomerID=o.CustomerID;

