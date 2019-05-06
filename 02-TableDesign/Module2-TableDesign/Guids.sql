Use LabData;
Go

--GUID global unique identifier values are not equivalent anywhere else

Create Table GuidTable
(
	RandomGuid UniqueIdentifier Default NewID(),
	SequentialGuid UniqueIdentifier Default NewSequentialID(),
	Content varchar(50)
);

Insert Into GuidTable Default Values;
Insert Into GuidTable Default Values;

Select * From GuidTable

Drop Table GuidTable