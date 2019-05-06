
Create Procedure Labs.spGetCustomerCountByCountry
	@Country VarChar(50),
	@CustomerCount int Output
As
	Select @CustomerCount = Count(*)
	From Customers
	Where Country = @Country;
