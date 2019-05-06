Use LabData;
Go 

Create Schema Marketing;
Go

Create Schema Sales;
Go

Create Table General 
(
	GeneralId int
); 

Create Table Marketing.[Events] --Brackts around Reserved Words
(
	MarketingId int
); 

Create Table Sales.Customers
(
	SalesId int
);

--Transfer General Table to Sales Schema
exec sp_tables;
Alter Schema Sales Transfer dbo.General
exec sp_tables;

Begin Try 
	Drop Table Sales.Customers;
	Drop Table Sales.General;
	Drop Table Marketing.Events;

	Drop Schema Sales;
	Drop Schema Marketing;
	Print('Schemas Dropped')
End Try
Begin Catch
	Print(Error_Message());
End Catch

