--Create Database
 

--Create Partitions

--View Partitions
SELECT name AS AvailableFilegroups
FROM sys.filegroups
WHERE type = 'FG'

--Create FileGroups

--Create Partition Function


--Create Partition Scheme


--Create Table for Date Partitions
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



Select * From Reports

--Remove database

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