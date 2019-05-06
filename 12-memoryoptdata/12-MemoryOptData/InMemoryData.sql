Use Master;
Go

Create DataBase MemoryOptDB;

--------------------
-- File Groups
--------------------

------------------------------
--InMemory Table
------------------------------
Use MemoryOptDB;
Go
Create TAble InMemoryTable
(
	OrderID int identity(1,1),
	OrderDate DateTime Not null,
	Quantity int,
	Price smallmoney

);
Go

Insert Into InMemoryTable Values(GetDate(),10,100.00);
Select * From InMemoryTable;





