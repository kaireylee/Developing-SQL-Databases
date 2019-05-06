------------------------------------------------------
--Step One
------------------------------------------------------
USE master
EXEC sp_configure filestream_access_level, 2 RECONFIGURE; 
GO  
RECONFIGURE
GO

--You can use this statement to see current
--config value and running value
EXEC sp_configure filestream_access_level;
GO

------------------------------------------------------
--Step Two
------------------------------------------------------
USE master
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'FileStreamDB')
         DROP DATABASE   FileStreamDB
GO

CREATE DATABASE FileStreamDB
--Details of primary file group
ON PRIMARY
  (NAME = FileStreamDB_Primary,
      FILENAME =N'C:\Data\FileStreamDB_Data.mdf'),
	--FileGroup FILENAME refers to the FOLDER in the PATH and not to the actual file name.   
	--creates a folder which contains a filestream.hdr file.
	 FILEGROUP   FSDataGroup CONTAINS   FILESTREAM
		  (NAME = FileStream, FILENAME =N'C:\Data\FSData')
LOG ON (Name = FileStreamDB_Log,
		   FILENAME = 'C:\Data\FileStreamDB_Log.ldf')
--WITH FILESTREAM (NON_TRANSACTED_ACCESS = FULL, DIRECTORY_NAME = N'FileStreamDB')
GO

------------------------------------------------------
--Step Three
------------------------------------------------------
USE FileStreamDB
GO
CREATE TABLE FileStreamTable   AS FileTable
WITH
(
      FileTable_Directory =   'FileStreamTable',
      FileTable_Collate_Filename = database_default
);
GO

CREATE TABLE Images 
As FileTable 
WITH (FileTable_Directory = 'Images'); 
GO