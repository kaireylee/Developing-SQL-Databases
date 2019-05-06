Use LabData;
Go

--Change Server Level FillFactor
sp_configure 'show advanced options', 1;
Go
Reconfigure;
Go
sp_configure 'fill factor', 100;
Go 
Reconfigure;
Go 

Create Table CustomerFillFactor
(
	CustomerID int identity(1,1) primary key,
	CompanyName varchar(25),
	ContactName VarChar(25)
);

Create Nonclustered Index CompanyName_Index
	On CustomerFillFactor(CompanyName)
	With FillFactor=80;
Go
Alter Index CompanyName_Index On CustomerFillFactor
	Rebuild With (FillFactor=80);
Go

