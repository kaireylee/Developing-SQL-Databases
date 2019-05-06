USE LabData;  
GO  

-- Create a new table with three columns.  
CREATE TABLE dbo.EmployeeClustered  
    (EmployeeID UniqueIdentifier Default NewID(),  
     FirstName nvarchar(25) NULL,  
     LastName nvarchar(25) NULL,
	 HireDate datetime); 
GO  

-- Create a clustered index NO PRIMARY KEY
CREATE CLUSTERED INDEX EmployeeID_Index   
    ON dbo.EmployeeClustered (EmployeeID)
	WITH (FILLFACTOR = 70)
	--WITH (DROP_EXISTING = ON, FILLFACTOR = 70);  --DROP_EXISTING Used After Created    
GO

--Drop Table EmployeeClustered;