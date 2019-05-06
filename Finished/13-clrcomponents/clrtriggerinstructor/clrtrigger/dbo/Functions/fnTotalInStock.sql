
CREATE FUNCTION dbo.fnTotalInStock(@CategoryID int)  
RETURNS int   
AS     
BEGIN  
    DECLARE @retTotal int;  
    SELECT @retTotal = SUM(UnitPrice * UnitsInStock)   
	FROM Products 
	WHERE (CategoryID = @CategoryID)
    IF (@retTotal IS NULL)   
        SET @retTotal = 0;  
    RETURN @retTotal;  
END;  
