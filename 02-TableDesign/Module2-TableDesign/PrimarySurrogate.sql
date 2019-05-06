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
Insert Into PrimarySurrogateKey(EmployeeNo, SSN, LastName, FirstName)
	Values (100, '123456789', 'Bourne', 'Jason')

Select Top(1) * From PrimarySurrogateKey;

Drop Table PrimarySurrogateKey;