Use LabData; 
Go 

Create Table PrimarySurrogateKey
(
	EmployeeID int Identity(1,1) Primary Key, 
	EmployeeNo int,
	SSN varchar(11),
	FirstName varchar(25),	
	LastName varchar(25)
);

Insert Into PrimarySurrogateKey(EmployeeNo, SSN, LastName, FirstName)
	Values (100, '123456789', 'Bourne', 'Jason')
Select SCOPE_IDENTITY() As CurrentId; 

Insert Into PrimarySurrogateKey(EmployeeNo, SSN, LastName, FirstName)
	Values (100, '123456789', 'Statham', 'Jason')

Select Top(2) * From PrimarySurrogateKey;

Drop Table PrimarySurrogateKey;