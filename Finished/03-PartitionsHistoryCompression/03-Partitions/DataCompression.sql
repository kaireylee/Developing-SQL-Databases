Use LabData;
Go


CREATE TABLE [dbo].[TestCompression](
	[m_id] [int]  NULL,
	[text] [nvarchar](3000) NULL
) ON [PRIMARY]

 
INSERT INTO [dbo].[TestCompression] 
	SELECT message_id, text from sys.messages

Select * From TestCompression

--Check potential % of Logical Reads
-------------------------------------------------------------------------------
--                                         Schema  Object          index  Part. Tpe
EXEC sp_estimate_data_compression_savings 'dbo', 'TestCompression', NULL, NULL, 'ROW' ;  
GO
--take size_with_requested_compression_setting (KB) / 
--     size_with_current_compression_setting (KB)


--Determain how many Logical reads need to return Per-Compressed Table
-----------------------------------------------------------------------
SET STATISTICS IO ON
SELECT m_id, text
FROM dbo.TestCompression
SET STATISTICS IO OFF
--8573 Logical Reads

--Compress Data
------------------------------------------------
ALTER TABLE dbo.TestCompression REBUILD PARTITION = ALL 
WITH  
(DATA_COMPRESSION = ROW) 
GO


--Determain how many Logical reads need to return Per-Compressed Table
-----------------------------------------------------------------------
SET STATISTICS IO ON
SELECT m_id, text
FROM dbo.TestCompression
SET STATISTICS IO OFF

Drop Table TestCompression;