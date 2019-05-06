Begin Try
	-----------------------------------------------
	-- TinyInt
	-----------------------------------------------
	Declare @tinyNum tinyint;
	Set @tinyNum = 255;
	--Set @tinyNum = 256;
	Select @tinyNum As 'Tiny-Integer';

	-----------------------------------------------
	-- Decimal
	-----------------------------------------------
	Declare @decNum decimal(5,2); --Precision, Scale
	Set @decNum = 123.12;
	--Set @decNum = 12345.12;
	Select @decNum As 'Decimal';

	-----------------------------------------------
	-- Bit
	-----------------------------------------------
	Declare @bit bit;
	Set @bit = 'FALSE';
	Select @bit;

	--If (@bit = 0)
	--	Select 'False' As 'Bit';
	--Else
	--	Select 'True' As 'Bit';
	
	-----------------------------------------------
	-- Null / SmallMoney
	-----------------------------------------------
	Declare @num smallmoney;
	--Set @num = 10.1234
	Select @num;

	--If (@num IS Null) 
	--	Select 0 As 'Null'
	--Else
	--	Select @num As 'Money'

End Try
Begin Catch
	Select ERROR_MESSAGE()
End Catch



