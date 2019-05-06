USE LabData;
GO

CREATE TABLE PersonDisabledIndex
(
	PersonID int Identity(1,1),
	FirstName VarChar(25) NOT NULL,
	LastName VarChar(25) NOT NULL,
	State VarChar(2) NOT NULL,
    PRIMARY KEY (PersonID)
);
GO

CREATE NONCLUSTERED INDEX FullName_Index ON dbo.PersonDisabledIndex
(
	LastName ASC,
	FirstName ASC
); --With (Drop_Existing = On); 
GO

ALTER INDEX FullName_Index ON PersonDisabledIndex DISABLE;
Go 

SELECT i.name AS Index_Name, i.index_id, i.type_desc, s.name AS 'Schema_Name', o.name AS Table_Name
FROM sys.indexes i
JOIN sys.objects o on o.object_id = i.object_id
JOIN sys.schemas s on s.schema_id = o.schema_id
WHERE i.is_disabled = 1
ORDER BY
i.name
GO

ALTER INDEX FullName_Index ON PersonDisabledIndex REBUILD;
Go 

SELECT i.name AS Index_Name, i.index_id, i.type_desc, s.name AS 'Schema_Name', o.name AS Table_Name
FROM sys.indexes i
JOIN sys.objects o on o.object_id = i.object_id
JOIN sys.schemas s on s.schema_id = o.schema_id
WHERE i.is_disabled = 1
ORDER BY
i.name
GO

Drop Table PersonDisabledIndex;