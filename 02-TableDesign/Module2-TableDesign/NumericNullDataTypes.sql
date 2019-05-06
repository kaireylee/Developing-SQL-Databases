--@ = Belongs in memory
--Numeric Types
--Integer Types
Declare @tinyInt TinyInt = 255; -- 0-255 
Declare @smallInt SmallInt; 
Set @smallInt = 100; 

--Money
Declare @annualSales SmallMoney = 1500 -- Limit 214,000 
Declare @globalInvestment Money = 1500000

--Decimal Types
Declare @decimalNumber Decimal(5, 2) = 999.99; --Number of places, decimal precision

--Bit
Declare @exempt Bit = 'False';

Select @smallInt as SmallInt, 
       @tinyInt as TinyInt, 
       @annualSales as AnnualSales,
       @globalInvestment as GlobalInvestment, 
       @decimalNumber as DecimalNumber,
	   @exempt as Exempt;