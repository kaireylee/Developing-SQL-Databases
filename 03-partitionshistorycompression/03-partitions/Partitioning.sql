--Create Database
 Create Database PartitionDB;
 Go

 Use PartitionDB;

--Create Paritions
Alter Database  PartitionDB
	Add Filegroup January
Go

Alter Database  PartitionDB
	Add Filegroup February
Go

Alter Database  PartitionDB
	Add Filegroup March
Go

Alter Database  PartitionDB
	Add Filegroup April
Go

--View Partitions
SELECT name as AvailableFilegroups
FROM sys.filegroups --system table within db that hosts info regarding the filegroups
WHERE type = 'FG'

--Create Physical Structure
Alter Database PartitionDB
	Add File
	(
		Name = [PartJan],
		Filename =  'C:\Data\PartitionDB1.ndf',
			Size = 3072 KB,
			MaxSize = Unlimited,
			FileGrowth = 1024 KB --All part of Filename declaration 
	) To Filegroup [January]

Alter Database PartitionDB
	Add File
	(
		Name = [PartFeb],
		Filename =  'C:\Data\PartitionDB2.ndf',
			Size = 3072 KB,
			MaxSize = Unlimited,
			FileGrowth = 1024 KB --All part of Filename declaration 
	) To Filegroup [February]

Alter Database PartitionDB
	Add File
	(
		Name = [PartMar],
		Filename =  'C:\Data\PartitionDB3.ndf',
			Size = 3072 KB,
			MaxSize = Unlimited,
			FileGrowth = 1024 KB --All part of Filename declaration 
	) To Filegroup [March]

Alter Database PartitionDB
	Add File
	(
		Name = [PartApr],
		Filename =  'C:\Data\PartitionDB4.ndf',
			Size = 3072 KB,
			MaxSize = Unlimited,
			FileGrowth = 1024 KB --All part of Filename declaration 
	) To Filegroup [April]

--Create Partition Function (logic on how data will be routed)
Create Partition Function [PartitioningByMonth] (DateTime)
	As Range Right For Values('2017-12-31', '2017-02-01', '2017-03-01') --left = default 

--Create Partition Scheme
Create Partition Scheme [PartitionByMonth]
	As Partition [PartitioningByMonth]
	To (January, February, March, April)

--Create Table for Date Partitions
CREATE TABLE Reports
(
	ReportDate datetime PRIMARY KEY,
	MonthlyReport varchar(max)
) ON PartitionByMonth (ReportDate);
GO
 
INSERT INTO Reports (ReportDate,MonthlyReport)
	SELECT '20170105', 'ReportJanuary' UNION ALL
	SELECT '20170205', 'ReportFebruary' UNION ALL
	SELECT '20170308', 'ReportMarch' UNION ALL
	SELECT '20170131', 'ReportJanuary2' UNION ALL
	SELECT '20170214', 'ReportFebruary2' UNION ALL
	SELECT '20170301', 'ReportMarch2' 

Select * From Reports

--Check Partition Status
--------------------------------
SELECT 
p.partition_number AS PartitionNumber,
f.name AS PartitionFilegroup, 
p.rows AS NumberOfRows 
FROM sys.partitions p
JOIN sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
JOIN sys.filegroups f ON dds.data_space_id = f.data_space_id
WHERE OBJECT_NAME(OBJECT_ID) = 'Reports'

--Remove database
Use Master;
Go

Drop Database PartitionDB