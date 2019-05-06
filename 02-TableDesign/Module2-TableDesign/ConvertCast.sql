Use LabData 
Go

Declare @number varchar(10) = '12345';
Declare @sales money = 1500000;
Declare @today DateTime = GetDate(); 

Select 
	Cast(@number as int) as IntNumber, --F1 jumps to microsoft documentation 
	Convert(varchar(20), @today, 107) as LongDate,
	Convert(varchar(20), @today, 101) as USDate,
	Convert(varchar(20), @today, 104) as GermanDate,
	'$' + Convert(varchar(20), @sales, 1) as Sales; 

Select 
	Try_Cast('12345.55' as int) as ConvertedString --returns null and allows query to continue

Select
	Case
		When Try_Cast('12345.55' as smallmoney) IS NULL Then 'Failed'--must use is not = for null values
		Else 'Success'
	End as ConvertedString

--Try_Parse / Try_Convert 