USE Northwind;
GO

CREATE DATABASE FileStreamDM; 

EXEC sp_configure Filestream_Access_Level, 1;
RECONFIGURE;

USE FileStreamDB;
GO

ALTER DATABASE FileStreamDB
	ADD FILEGROUP Primary_Filestream CONTAINS FILESTREAM;

GO

ALTER DATABASE FileStreamDB
	ADD File(Name='MyBlobs', Filename='C:\Data\MyFilestream_Blobs')
		TO FILEGROUP Primary_Filestream

GO

CREATE TABLE Images
(
	ID UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL UNIQUE,
	ImageFile VARBINARY(MAX) FILESTREAM
);

GO

INSERT INTO Images(Id, ImageFile)
	SELECT NewID(), BulkColumn
	FROM OpenRowSet(Bulk 'C:\Developing SQL Databases\Images\test.jpg', single_blob) AS F; 

SELECT * FROM Images;