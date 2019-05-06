
CREATE PROCEDURE dbo.spGetCustomerCount 
	@Country nvarchar(30), 
	@CustomerCount int OUTPUT
AS
SELECT @CustomerCount = count(*) 
	FROM Customers 
	WHERE Country = @Country;
