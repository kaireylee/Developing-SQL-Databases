Exec sp_configure filestream_access_level, 2;
Reconfigure;
Go

Create DataBase FileStreamDB;
Go

Use FileStreamDB;
Go

Alter DataBase FileStreamDB
	Add FileGroup Primary_FileStream
	Contains FileStream;

Alter Database FileStreamDB
	Add File (Name='MyDatabase_Filestream',
			  FileName = 'C:\Data\FileStreamDB_Filestream')
			  To FileGroup Primary_Stream;




