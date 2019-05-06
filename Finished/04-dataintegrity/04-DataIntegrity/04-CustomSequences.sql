Use LabData;
Go

Create Sequence Course_Sequence
	As Int 
	Start With 100 
	Increment By 10;
Go

Create Table NextSequenceTable
(
	RowID int Identity(1,1) Primary Key,
	CourseNumber int,
	Description varchar(max)
);
	
Insert Into NextSequenceTable 
	Values (Next Value For Course_Sequence, 'Sql Server');
Insert Into NextSequenceTable 
	Values (Next Value For Course_Sequence, 'JavaScript');

Select * From NextSequenceTable;

Drop Sequence Course_Sequence;
Drop Table NextSequenceTable;
go