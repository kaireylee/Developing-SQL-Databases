Use LabData; /*semicolon reccomdended for the end of system statements*/
Go 
/*not an acctual statement so no semicolon necessary*/

Create Table PrimaryCandidateKey
(
	EmployeeID int Primary Key, /*primary keys unique and doesn't waste space automatically creates cluster index*/
	SSN varchar(11),
	FirstName varchar(25),	
	LastName varchar(25)
);

Insert Into PrimaryCandidateKey(EmployeeID, SSN, LastName, FirstName)
	Values (100, '123456789', 'Bourne', 'Jason')

Select Top 100 * From PrimaryCandidateKey 

Drop Table PrimaryCandidateKey; 