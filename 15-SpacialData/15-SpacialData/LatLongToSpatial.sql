Use LabData;
Go

CREATE TABLE [dbo].[Landmark] (
    [ID]                INT IDENTITY(1, 1),
    [LandmarkName]      VARCHAR(100),
    [Location]          VARCHAR(50),
    [Latitude]          FLOAT,
    [Longitude]         FLOAT
)
GO

INSERT INTO [dbo].[Landmark] ( [LandmarkName], [Location], [Latitude], [Longitude] )
VALUES ( 'Statue of Liberty', 'New York, USA', 40.689168,-74.044563 ),
       ( 'Eiffel Tower', 'Paris, France', 48.858454, 2.294694),
       ( 'Leaning Tower of Pisa', 'Pisa, Italy', 43.72294, 10.396604 ),
       ( 'Great Pyramids of Giza', 'Cairo, Egypt', 29.978989, 31.134632 ),
       ( 'Sydney Opera House', 'Syndey, Australia', -33.856651, 151.214967 ),
       ( 'Taj Mahal', 'Agra, India', 27.175047, 78.042042 ),
       ( 'Colosseum', 'Rome, Italy', 41.890178, 12.492378 )
GO

Select * From Landmark;

Alter Table LandMark
	Add GeoLocation Geography

GO

Update LandMark SET Geolocation = Geography::Point(Latitude, Longitude, 4326); --number for conversion to lat long

Select * From Landmark;

DROP TABLE Landmark