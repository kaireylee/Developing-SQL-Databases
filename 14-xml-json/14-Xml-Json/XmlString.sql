declare @XML xml;

set @XML = 
'
<employees>
  <employee>
    <empID>1</empID>
	<first>Robert</first>
	<last>Baratheon</last>
  </employee>
  <employee>
    <empID>2</empID>
	<first>Cersei</first>
	<last>Lannister</last>
  </employee>
   <employee>
    <empID>3</empID>
	<first>Jamie</first>
	<last>Lannister</last>
  </employee>
   <employee>
    <empID>4</empID>
	<first>Tyrion</first>
	<last>Lannister</last>
  </employee>
    <employee>
    <empID>5</empID>
	<first>Joffery</first>
	<last>Baratheon</last>
  </employee>
    <employee>
    <empID>6</empID>
	<first>Stannis</first>
	<last>Baratheon</last>
  </employee>
</employees>
';

SELECT @XML.query('/employees');
SELECT @XML.query('/employees/employee/first'); --traversing and extracting the item we want
SELECT @XML.query('/employees/employee[2]'); 
SELECT @XML.query('/employees/employee[last="Lannister"]'); --Case sensitive!