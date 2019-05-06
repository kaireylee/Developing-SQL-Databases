Use LabData;

Create Table CourseIdentity
(
	CourseID int Identity(1,1) Primary Key,
	Description varchar(max)
);
Go

Insert Into CourseIdentity (Description) Values('Sql Server');
Insert Into CourseIdentity (Description) Values('JavaScript');

Select SCOPE_IDENTITY() as LastID;
Select * From CourseIdentity;

Create Table CourseGuid
(
	CourseID UniqueIdentifier Default NewSequentialId() Primary Key,
	Description varchar(max)
);

Insert Into CourseGuid (Description) Values('Sql Server');
Insert Into CourseGuid (Description) Values('Javascript');
Select * From CourseGuid;

Drop Table CourseIdentity;
Drop Table CourseGuid