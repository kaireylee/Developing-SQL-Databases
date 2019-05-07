USE LabData;
GO

--Step One
CREATE TABLE ExecutionPlan
(
	PlanID INT IDENTITY,
	PlanName VARCHAR(25),
	PlanDescription VARCHAR(MAX)
);
GO

--Step Two
INSERT INTO ExecutionPlan 
	VALUES('Plan1', 'This is Plan 1');
GO 1000

--Step Three
SELECT * FROM ExecutionPlan
WHERE PlanID Between 100 and 200
ORDER BY PlanId DESC;
GO

--Step Four
ALTER TABLE ExecutionPlan
	ADD Primary Key(PlanID)
GO

--Step Five
SELECT * FROM ExecutionPlan
WHERE PlanID Between 100 and 200
ORDER BY PlanId DESC;
GO

DROP TABLE ExecutionPlan;