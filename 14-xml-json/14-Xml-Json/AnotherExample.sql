USE LabData;
GO

--Create Table
Create Table #Rulers --temp table
(
	field1 xml
)

--Insert XML document
INSERT INTO #Rulers (field1) 
	VALUES
	(
		'<Rulers>
			<Ruler id="1">
				<FirstName>Cersei</FirstName>
				<LastName>Lannister</LastName>
			</Ruler>
			<Ruler id="2">
				<FirstName>John</FirstName>
				<LastName>Snow</LastName>
			</Ruler>			
		</Rulers>'
	)

GO

SELECT * FROM #Rulers;
SELECT field1.value('(/Rulers/Ruler)[1]', 'nvarchar(255)') FROM #Rulers;

GO

DROP TABLE #Rulers;