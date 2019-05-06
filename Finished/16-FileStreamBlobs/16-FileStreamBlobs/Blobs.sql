USE master;
GO

CREATE DATABASE BlobDB;
GO

USE BlobDB;
GO

CREATE TABLE BlobTable
(
ID int IDENTITY(1,1),
BlobName varChar(50),
BlobData varBinary(MAX)
);

INSERT INTO BlobTable
	(BlobName, BlobData)
	SELECT 'Logo', 
		BulkColumn FROM OPENROWSET(
			Bulk 'C:\Data\Images\AnyWare.jpg', SINGLE_BLOB) AS Blob

Select * From BlobTable;

Drop Table BlobTable;
Use Master;
Drop DataBase BlobDB;

