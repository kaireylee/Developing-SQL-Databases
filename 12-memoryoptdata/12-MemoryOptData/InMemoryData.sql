Use Master;
Go

Create DataBase MemoryOptDB;
--------------------
-- File Groups
--------------------
Alter Database MemoryOptDB
	Add FileGroup Memory_Data
	Contains Memory_Optimized_Data

Alter Database MemoryOptDB
	Add File (Name='MemData', FIlename='C:\Data\MemoryOptDB_MemData.ndf')
	To FileGroup Memory_Data;
Go

------------------------------
--InMemory Table
------------------------------
Use MemoryOptDB;
Go
Create Table InMemoryTable
(
	OrderID int identity(1,1),
	OrderDate DateTime Not null,
	Quantity int,
	Price smallmoney,
	Primary Key NonClustered (OrderId)
)
With (Memory_Optimized=On, Durability=Schema_And_Data);


Go

Insert Into InMemoryTable Values(GetDate(),10,100.00);
Select * From InMemoryTable;





