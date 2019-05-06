Use LabData;
Go

--Step One
Create Table ExecutionPlan
(
	PlanID int identity(1,1),
	PlanName VarChar(25),
	PlanDescription VarChar(50)
);
Go 

--Step Two
Insert Into ExecutionPlan(PlanName,PlanDescription) 
	Values('Plan....','Plan Description...')
Go 1000

--Step Three
Select * From ExecutionPlan
Where PlanID between 300 And 500
Order By PlanId;

--Step Four
Alter Table	ExecutionPlan
	Add Primary Key(PlanID);
Go

--Step Five
Select * From ExecutionPlan
Where PlanID between 300 And 500
Order By PlanId;

Drop Table ExecutionPlan