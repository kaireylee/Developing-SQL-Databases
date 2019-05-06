DECLARE @Counter float;
SET @Counter = 0;
WHILE (@Counter <> 1.0) BEGIN
SET @Counter += 0.1;
PRINT @Counter;
END;

