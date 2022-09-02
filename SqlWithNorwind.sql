--SQL WITH NORTHWIND
--1.Select all the rows from the "Customers" table. 
select * from Customers	

--2.Get distinct countries from the Customers table.
select distinct Country
from Customers

--3.Get all the rows from the table Customers where the Customer’s ID starts with “BL”.
select * from Customers
where CustomerID like 'BL%'

--4.Get the first 100 records of the orders table.
SELECT TOP (100) [CustomerID],[CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[Fax]
FROM [NORTHWND].[dbo].[Customers]

--5.Get all customers that live in the postal codes 1010, 3012, 12209, and 05023
select * from Customers
where PostalCode in ('101', '3012', '12209', '05023')

--6.Get all orders where the ShipRegion is not equal to NULL.
select * from Orders
where ShipRegion is not null

--7.Get all customers ordered by the country, then by the city.
select * from Customers
order by Country, City

--8.Add a new customer to the customers table. You can use whatever values.
insert into Customers (CustomerID,CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
values('TREX','T-Rex Productions', 'Gus Rivers','CEO','123 Ocean Blvd','Athens','EU','1111','Greece','123-456-789','123-789-456')

--9.Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.  
update Orders
set ShipRegion = 'EuroZone'
where ShipCountry = 'France'

--10.Delete all orders from OrderDetails that have quantity of 1
delete from [Order Details]
where Quantity = 1

--11.Find the CustomerID that placed order 10290 (orders table)
select * from Orders
where OrderID = '10290'

--12.Join the orders table to the customers table
select * from Orders
join Customers on Orders.CustomerID = Customers.CustomerID

--13.Get employees’ firstname for all employees who report to no one.
select * from Employees
where ReportsTo is null

--14.Get employees’ firstname for all employees who report to Andrew.
select * from Employees
where ReportsTo = 2

--EXTRA CHALLENGES
--1.Calculate the average, max, and min of the quantity at the orderdetails table, grouped by the orderid. 
--Average 
select OrderID, AVG(Quantity) as Average
from [Order Details]
group by OrderID
--Max
select OrderID,  MAX(Quantity) as MaxQuantity
from [Order Details]
group by OrderID
--Min
select OrderID, MIN(Quantity) as MinQuantity
from [Order Details]
group by OrderID

--2.Calculate the average, max, and min of the quantity at the orderdetails table
select AVG(Quantity)
from [Order Details]
--Max
select MAX(Quantity)
from [Order Details]
--Min
select MIN(Quantity)
from [Order Details]

--3.Find all customers living in London or Paris
select * from Customers
where City in ('London', 'Paris')

--4.Do an inner join, left join, right join on orders and customers tables. 
--inner join
select * from Orders
inner join Customers on Orders.CustomerID = Customers.CustomerID
--left join
select * from Orders
left join Customers on Orders.CustomerID = Customers.CustomerID
--right join
select * from Orders
right join Customers on Orders.CustomerID = Customers.CustomerID

--5.Make a list of cities where customers are coming from. The list should not have any duplicates or nulls.
select distinct City
from Customers

--6.Show a sorted list of employees’ first names. 
select * from Employees
order by FirstName

--7.Find total for each order
select OrderID, SUM(UnitPrice) as [Order Total]
from [Order Details]
group by OrderID

--8.Get a list of all employees who got hired between 1/1/1994 and today
select * from Employees 
where HireDate between '1994-01-01 00:00:00.000' and GETDATE()

--9.Find how long employees have been working for Northwind (in years!)
select FirstName, LastName, FLOOR (CAST (GETDATE() as integer) - CAST(HireDate as integer)) / 365.25 as [Years Working for Northwind]
from Employees

--10.Get a list of all products sorted by quantity (ascending and descending order)
--ascending
select * from Products
order by QuantityPerUnit asc
--descending
select * from Products
order by QuantityPerUnit desc

--11.Find all products that are low on stock (quantity less than 6)
select * from Products
where UnitsInStock < 6

--12.Find a list of all discontinued products. 
select * from Products
where Discontinued = 1

--13.Find a list of all products that have Tofu in them.
select * from Products
where ProductName like '%tofu%'

--14.Find the product that has the highest unit price. 
SELECT TOP (1) [ProductID],[ProductName],[SupplierID],[CategoryID],[QuantityPerUnit],[UnitPrice],[UnitsInStock],[UnitsOnOrder],[ReorderLevel],[Discontinued]
FROM [NORTHWND].[dbo].[Products]
order by UnitPrice desc

--15.Get a list of all employees who got hired after 1/1/1993
select * from Employees
where HireDate > '1993-01-01 00:00:00.000'

--16.Get all employees who have title : “Ms.” And “Mrs.”
select * from Employees
where TitleOfCourtesy in ('Ms.','Mrs.')

--17.Get all employees who have a Home phone number that has area code 206
select * from Employees
where HomePhone like '(206%'
