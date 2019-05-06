Use LabData;
Go

CREATE TYPE dbo.PostalCode
FROM varchar(8);
Go

Create Table AliasTypes
(
	ID int Identity,
	ZipCode PostalCode
);
Go

Insert Into AliasTypes (ZipCode) values ('12345678')
Insert Into AliasTypes (ZipCode) values ('1234567890')

Select * From AliasTypes;

Drop Table AliasTypes;
Drop Type PostalCode;
