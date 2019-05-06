Use LabData
Go

IF OBJECT_ID('dbo.CarInventory', 'U') IS NOT NULL 
BEGIN
	 -- When deleting a temporal table, we need to first turn versioning off
	 ALTER TABLE [dbo].[CarInventory] SET ( SYSTEM_VERSIONING = OFF  ) 
	 DROP TABLE dbo.CarInventory
	 DROP TABLE dbo.CarInventoryHistory
END

CREATE TABLE CarInventory   
(    
	 CarId INT IDENTITY PRIMARY KEY,
	 Year INT,
	 Make VARCHAR(40),
	 Model VARCHAR(40),
	 Color varchar(10),
	 Mileage INT,
	 InLot BIT NOT NULL DEFAULT 1,
	 SysStartTime datetime2 GENERATED ALWAYS AS ROW START NOT NULL,
	 SysEndTime datetime2 GENERATED ALWAYS AS ROW END NOT NULL,
 PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)     
)   
WITH 
( 
	SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.CarInventoryHistory)   
)


SELECT * FROM dbo.CarInventory
SELECT * FROM dbo.CarInventoryHistory

INSERT INTO dbo.CarInventory (Year,Make,Model,Color,Mileage) VALUES(2017,'Chevy','Malibu','Black',0)
INSERT INTO dbo.CarInventory (Year,Make,Model,Color,Mileage) VALUES(2017,'Chevy','Malibu','Silver',0)

UPDATE dbo.CarInventory SET InLot = 0 WHERE CarId = 1;
UPDATE dbo.CarInventory SET InLot = 0 WHERE CarId = 2;

SELECT * FROM dbo.CarInventory
SELECT * FROM dbo.CarInventoryHistory