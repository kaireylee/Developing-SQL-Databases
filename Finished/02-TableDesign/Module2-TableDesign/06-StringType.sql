--Char
Declare @City As Char(50) = 'Sacramento';
Declare @State As Char(2) = 'CA';
--Go
Select @city + @state;
Select Len(@City) As Content, DataLength(@city) As Structure;

--VarChar
Declare @City2 As VarChar(50) = 'Sacramento';
Declare @State2 As VarChar(2) = 'CA';

Select @city2 + @state2;
Select Len(@City2) As Content, DataLength(@city2) As Structure;