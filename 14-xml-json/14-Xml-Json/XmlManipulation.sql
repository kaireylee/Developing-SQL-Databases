DECLARE @xml XML
 
SET @xml=N'<Root>
    <orderHRD ID="101">
        <custID>501</custID>
        <orderDTL ID="201">
            <prodID>1</prodID>
            <qty>5</qty>
            <cost>25.12</cost>
        </orderDTL>
        <orderDTL ID="202">
            <prodID>2</prodID>
            <qty>3</qty>
            <cost>30.00</cost>
        </orderDTL>
    </orderHRD>
    <orderHRD ID="102">
        <custID>502</custID>
        <orderDTL ID="203">
            <prodID>11</prodID>
            <qty>12</qty>
            <cost>140.78</cost>
        </orderDTL>
    </orderHRD>
    <orderHRD ID="103">
        <custID>503</custID>
        <orderDTL ID="204">
            <prodID>6</prodID>
            <qty>8</qty>
            <cost>60.35</cost>
        </orderDTL>
        <orderDTL ID="205">
            <prodID>9</prodID>
            <qty>2</qty>
            <cost>10.50</cost>
        </orderDTL>
        <orderDTL ID="206">
            <prodID>10</prodID>
            <qty>6</qty>
            <cost>120.89</cost>
        </orderDTL>
    </orderHRD>
</Root>';

SELECT DISTINCT 
	XMLSet.Field.value('../@ID', 'int') AS OrderHeaderID,
	XMLSet.Field.value('../custID[1]', 'int') AS CustomerID 
FROM @xml.nodes('/Root/orderHRD/orderDTL') XMLSet(Field); 
 
