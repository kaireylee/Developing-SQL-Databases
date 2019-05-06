Declare @number As VarChar(10) = '12345';
Declare @sales As Money = 1500000.50;

Select cast(@number as Int) as 'From String To Number',
	   Convert(VarChar(20),GetDate(),107) As LongDate,
	   Convert(VarChar(20),GetDate(),101) As UsDate,
	   Convert(VarChar(20),GetDate(),104) As GermanDate,
	   Convert(VarChar(15),@sales,1) As Sales1,
	   Convert(VarChar(15),@sales,2) As Sales2;
	   


--SELECT Cast('93751.3' As int) AS ConvertedStringError;  --Returns an error
SELECT TRY_CAST('93751.3' AS int) AS ConvertedStringNull; --Returns Null
--ThereFore we can Enhance
SELECT
	CASE
		WHEN TRY_CAST('93751.3' AS int) IS NULL THEN 'FAIL'
	ELSE 'SUCCESS'
	END AS ConvertedString;