USE LabData;  
GO  

IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'FullName_Index')   
    DROP INDEX FullName_Index ON EmployeeNonClustered;   
GO  

IF EXISTS (SELECT name FROM sys.tables  
            WHERE name = N'EmployeeNonClustered')   
    DROP TABLE EmployeeNonClustered;   
GO  

-- Create a new table with three columns.  
CREATE TABLE dbo.EmployeeNonClustered  
    (EmployeeID UniqueIdentifier Default NewID(),  
     FirstName nvarchar(25) NULL,  
     LastName nvarchar(25) NULL,
	 HireDate datetime); 
GO  
-- Create a non-clustered index 
-- The default Fill Factor (100 or 0) will allow the SQL Server to 
--  fill the leaf-level pages of an index with the maximum numbers of the rows it can fit. 
--  There will be no or very little empty space left in the page, when the fill factor is 100.
CREATE NONCLUSTERED INDEX FullName_Index   
    ON dbo.EmployeeNonClustered 
	(
		LastName ASC,
		FirstName ASC
	) With (Pad_Index=OFF, FillFactor=70);  -- Good for high CRUD Data Solutions
GO                                          --	Page 4-18 


