Begin Try
	Declare @goodDate DateTime;
	Set @goodDate = '20170131 23:59:59';
	Select @goodDate AS GoodDate;

	Declare @badDate as DateTime = '20170132 23:59:59'
	Select @badDate;
End Try
Begin Catch
	Select ERROR_MESSAGE();
End Catch

--DATETIME2 has a date range of "0001/01/01" through "9999/12 31" 
--while the DATETIME type only supports year 1753-9999. 
--Also, if you need to, DATETIME2 can be more precise in terms of time;
--DATETIME2 can be accurate down to 100ns