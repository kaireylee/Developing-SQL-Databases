Create DataBase FileStreamDB;
Go
Exec sp_configure filestream_access_level, 2
Reconfigure

Use FileStreamDB
Go
Alter Database FileStreamDB Add FileGroup [Primay_FileStream] Contains FileStream 
Go
Alter Database FileStreamDB
	   Add File (
             Name = 'MyDatabase_filestream',
             FileName = 'D:\Data\FilestreamDB_filestream'
       )
       To FileGroup [Primay_FileStream]
Go
Use FilestreamDB
Go

Create Table Images(
       Id UniqueIdentifier RowGuidCol NOT NULL Unique,
	   [Description] VarChar(50),
	   ImageFile VarBinary(MAX) FileStream
);
GO

Create Table Documents(
       Id UniqueIdentifier RowGuidCol NOT NULL Unique,
	   [Description] VarChar(50),
       DocumentFile VarBinary(MAX) FileStream
);
GO

Insert Into Images(Id, [Description], ImageFile)
Select NEWID(), 'AnyWare Logo', BulkColumn
From OpenRowSet(Bulk 'C:\Instructor\Images\anyware.jpg', Single_Blob) as f;

Insert Into Images(Id, [Description], ImageFile)
Select NEWID(), 'Desert Picture', BulkColumn
From OpenRowSet(Bulk 'C:\Instructor\Images\desert.jpg', Single_Blob) as f;

Insert Into Images(Id, [Description], ImageFile)
Select NEWID(), 'Light-House Picture', BulkColumn
From OpenRowSet(Bulk 'C:\Instructor\Images\lighthouse.jpg', Single_Blob) as f;

Insert Into Documents(Id, [Description], DocumentFile)
Select NEWID(), 'Language Syntax Document', BulkColumn
From OpenRowSet(Bulk 'C:\Instructor\Documents\Language Syntax.docx', Single_Blob) as f;

Insert Into Documents(Id, [Description], DocumentFile)
Select NEWID(), 'Normalization Document', BulkColumn
From OpenRowSet(Bulk 'C:\Instructor\Documents\Normalization.docx', Single_Blob) as f;

Select * From Images;
Select * From Documents;

--Get Image Ready for Web Front-end
Select [Description], ImageFile.PathName() as Photo
From Images

Use Master;
Drop Database FileStreamDB;
