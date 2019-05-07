USE LabData;
GO

CREATE TABLE Customer
(
	CustomerID INT IDENTITY PRIMARY KEY,
	CustomerFirstName VARCHAR(25),
	CustomerLastName VARCHAR(25),
	CompanyName VARCHAR(25)
);

CREATE NONCLUSTERED INDEX NCIX_CompanyName
	ON Customer(CompanyName) --WITH (FILLFACTOR = 70, PAD_INDEX = ON); --Can view under index => options

--Sets the fill factor and pad index server wide 
--sp_configure 'show advanced options' 1; 
--GO
--RECONFIGURE;
--GO
--sp_configure 'fill factor' 75;
--GO 
--RECONFIGURE
--GO

DROP TABLE Customer; 