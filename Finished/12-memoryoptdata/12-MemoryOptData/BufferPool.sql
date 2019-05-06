Use master
Go

Alter Server Configuration
	Set Buffer Pool Extension On
	(FileName='D:\Data\MyCache.bpe',Size=50 GB);
Go

--Removes Buffer pool extension
Alter Server Configuration
	Set Buffer Pool Extension Off;
Go


--To Increase Size, Remove then reinstall
Alter Server Configuration
	Set Buffer Pool Extension On
	(FileName='D:\Data\MyCache.bpe',Size=100 GB);
Go