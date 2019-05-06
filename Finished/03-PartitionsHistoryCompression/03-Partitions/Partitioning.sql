Create Database PartitionDB;
Go
 
Use PartitionDB;
Go

ALTER DATABASE PartitionDB
ADD FILEGROUP January
GO
ALTER DATABASE PartitionDB
ADD FILEGROUP February
GO
ALTER DATABASE PartitionDB
ADD FILEGROUP March
GO
ALTER DATABASE PartitionDB
ADD FILEGROUP April
GO

--Create Physical Structure
-------------------------------------- 
SELECT name AS AvailableFilegroups
FROM sys.filegroups
WHERE type = 'FG'

ALTER DATABASE PartitionDB
    ADD FILE 
    (
    NAME = [PartJan],
    FILENAME = 'C:\DATA\PartitionDB.ndf',
        SIZE = 3072 KB, 
        MAXSIZE = UNLIMITED, 
        FILEGROWTH = 1024 KB
    ) TO FILEGROUP [January]

ALTER DATABASE PartitionDB
    ADD FILE 
    (
    NAME = [PartFeb],
    FILENAME = 'C:\DATA\PartitionDB2.ndf',
        SIZE = 3072 KB, 
        MAXSIZE = UNLIMITED, 
        FILEGROWTH = 1024 KB
    ) TO FILEGROUP [February]

ALTER DATABASE PartitionDB
    ADD FILE 
    (
    NAME = [PartMar],
    FILENAME = 'C:\DATA\PartitionDB3.ndf',
        SIZE = 3072 KB, 
        MAXSIZE = UNLIMITED, 
        FILEGROWTH = 1024 KB
    ) TO FILEGROUP [March]

ALTER DATABASE PartitionDB
    ADD FILE 
    (
    NAME = [PartApr],
    FILENAME = 'C:\DATA\PartitionDB4.ndf',
        SIZE = 3072 KB, 
        MAXSIZE = UNLIMITED, 
        FILEGROWTH = 1024 KB
    ) TO FILEGROUP [April]


--Create Logic for Partitioned Data
----------------------------------------------------
CREATE PARTITION FUNCTION [PartitioningByMonth] (datetime)
AS RANGE RIGHT FOR VALUES ('2017-12-31','2017-02-01', '2017-03-01');


--Create Pipeline to Phisical Structure
----------------------------------------------------
CREATE PARTITION SCHEME PartitionBymonth
AS PARTITION PartitioningBymonth
TO (January, February, March, April);


--Create Table and Data
------------------------------------------------------
CREATE TABLE Reports
(ReportDate datetime PRIMARY KEY,
MonthlyReport varchar(max))
ON PartitionBymonth (ReportDate);
GO
 
INSERT INTO Reports (ReportDate,MonthlyReport)
	SELECT '20170105', 'ReportJanuary' UNION ALL
	SELECT '20170205', 'ReportFebruary' UNION ALL
	SELECT '20170308', 'ReportMarch' UNION ALL
	SELECT '20170131', 'ReportJanuary2' UNION ALL
	SELECT '20170214', 'ReportFebruary2' UNION ALL
	SELECT '20170301', 'ReportMarch2' 


SELECT 
p.partition_number AS PartitionNumber,
f.name AS PartitionFilegroup, 
p.rows AS NumberOfRows 
FROM sys.partitions p
JOIN sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
JOIN sys.filegroups f ON dds.data_space_id = f.data_space_id
WHERE OBJECT_NAME(OBJECT_ID) = 'Reports'

Select * From Reports

Use Master;
Drop Database PartitionDB;

--Check Partition Status
--------------------------------
--SELECT 
--p.partition_number AS PartitionNumber,
--f.name AS PartitionFilegroup, 
--p.rows AS NumberOfRows 
--FROM sys.partitions p
--JOIN sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
--JOIN sys.filegroups f ON dds.data_space_id = f.data_space_id
--WHERE OBJECT_NAME(OBJECT_ID) = 'Reports'
