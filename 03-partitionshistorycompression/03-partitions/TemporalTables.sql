Use LabTest
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
);
