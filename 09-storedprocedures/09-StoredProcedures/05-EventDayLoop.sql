use Northwind;
Go

IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'Labs.spGetEventDates') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure Labs.spGetEventDates;
Go

CREATE PROCEDURE Labs.spGetEventDates
	@StartDate AS Date,
	@EventTotal AS int,
	@DaysInBetween AS int
AS
	--useful for reporting purposes merging data from two different databases
	CREATE TABLE #Event --@variable table, has no percistancy # = temp table, ## = global temp table
	(
		EventDate Date --Table variable
	); --it is created in temporary tables under SystemDb/TemporaryTables
	
	DECLARE @i int = 1;

	WHILE @i <= @EventTotal
	BEGIN
		INSERT INTO #Event(EventDate) 
			VALUES (@StartDate); 
		SET @StartDate = DateAdd(Day, @DaysInBetween, @StartDate); 
		SET @i += 1;
	END

	SELECT Convert(varchar, EventDate, 101) AS [Event Date],
		DatePart(QQ, EventDate) AS Qtr,
		DatePart(MM, EventDate) AS [Month],
		DatePart(DD, EventDate) AS [Day of Month],
		Datepart(WEEKDAY, EventDate) AS [Day Of Week],
		DatePart(DayofYear, Eventdate) AS [Day of Year]
	FROM #Event
	DROP TABLE #Event;

GO

EXEC Labs.spGetEventDates '20200101', 10, 2