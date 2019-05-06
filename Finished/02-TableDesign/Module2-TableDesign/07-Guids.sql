Use LabData;
Go

Create Table GuidTable 
(
	RandomGuid UniqueIdentifier Default NewId(),
	SequentialGuid UniqueIdentifier Default NewSequentialID(),
	Content varchar(20) --Not Null
);

Insert Into GuidTable Default Values; --Breaks if Not Null
Insert Into GuidTable (Content) Values ('Hello Town')
Insert Into GuidTable (Content) Values ('Hello World');

Select * From GuidTable;

Drop Table GuidTable;