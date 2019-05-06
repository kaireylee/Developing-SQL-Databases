Use Northwind;
Go

Select CompanyName, Country 
From Customers
Where Country = 'Usa';

--Force Case Sensativity
--Select CompanyName, Country 
--From Customers
--Where Country Collate Latin1_General_CS_AS = 'Usa';

Create Table Locations 
(
	Place varchar(15) Not null
);

Insert Into Locations(Place) Values ('Chiapas'),('Colima'),('Cinco Rios'),('California')

-- US-English
Select * From Locations Order By Place;

--Apply a Spanish Collation
Select * From Locations Order By Place 

Drop Table Locations
--Collate Latin1_General_CS_AS_KS_WS
--Collate Traditional_Spanish_ci_aiOrder By Place Collate Traditional_Spanish_ci_ai;