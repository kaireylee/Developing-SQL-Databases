Use LabData;
Go

Create Table Customer 
(
	CustomerID Int Identity(1,1) Primary Key,
	[Name] VarChar(50)
);

Create Table [Order]
(
	OrderID Int Identity(1,1) Primary Key,
	OrderDate DateTime,
	OrderNumber int,
	CustomerId int Foreign Key References Customer(CustomerID)
);
Go

Drop Table [Order];
Drop Table Customer;
Go
