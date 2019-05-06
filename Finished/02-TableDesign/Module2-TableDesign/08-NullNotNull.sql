Use LabData;
Go

Create Table NullNotNull
(
	ID int, -- Not Null,
	Description VarChar(20)
);

Insert Into NullNotNull Default Values;
Select * From NullNotNull;

Drop Table NullNotNull;
