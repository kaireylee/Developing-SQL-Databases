Use LabData; 
Go 

--char (fixed length)
Declare @City char(50) = 'Sacramento';
Declare @State char(2) = 'CA';
Select @City + @State; --concatinating variables, spaces unused are still included

Go 
--City / State are released from memory and are able to be used again
--varchar (variable length)
Declare @City varchar(50) = 'Sacramento';
Declare @State varchar(2) = 'CA';
Select @City + ' ' + @State; --concatinating variables, spaces unused are still included

--Deprecated Text type
--Declare @notes text = 'asfjasf';
Declare @notes varchar(MAX); 