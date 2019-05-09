USE LabData;
GO

DECLARE @g1 Geometry; 
SET @g1 = Geometry::STPointFromText('Point(100.5 100.5)', 13);

SELECT @g1.ToString();
SELECT @g1; 

DECLARE @g2 Geometry = 'LineString(1 1, 5 5)';
SELECT @g2

DECLARE @g3 Geometry = 
	Geometry::STGeomFromText('LineString(10 10, 10 100, 100 100, 100 10, 10 10)', 0);
SELECT @g3

--Logarithmic graphing
DECLARE @i int = 0
DECLARE @linestring varchar(max) = 'LineString(';

WHILE (@i <= 30)
	BEGIN
		SET @i = @i + 1
		SET @linestring = @linestring + ' ' + CAST(@i AS varchar) + ' ' + CAST(LOG(@i, 2.178) AS varchar) 
		IF (@i != 31)
			SET @linestring = @linestring + ','
	END

SET @linestring = @linestring + ')'

SELECT @linestring

DECLARE @g4 Geometry = 
	Geometry::STGeomFromText(@linestring, 0);
SELECT @g4