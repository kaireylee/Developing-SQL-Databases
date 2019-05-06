
Create Procedure Labs.spGetEventDates
	@StartDate As Date,
	@Events As Int,
	@DaysInBetween Int
As
	Create Table #Event(EventDate DateTime);
	Declare @i Int = 1;

	While @i <= @Events
	Begin
		Insert Into #Event(EventDate) Values (@StartDate);
		Set @StartDate = DateAdd(Day,@DaysInBetween,@StartDate);
		Set @i = @i + 1;
	End
	Select Convert(varChar,EventDate,101) As [Event Date],
		   DatePart(QQ,EventDate) as Qtr,
		   DatePart(MM,EventDate) as [Month],
		   DatePart(DD,EventDate) as [Day of Month],
		   Datepart(WEEKDAY,EventDate) As [Day Of Week],
		   DatePart(DayofYear,Eventdate) as [Day of Year]
	From #Event
	Drop Table #Event;
