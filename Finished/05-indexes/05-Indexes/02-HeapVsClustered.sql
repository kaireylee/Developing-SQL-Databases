USE Northwind;
GO

SELECT object_schema_name(sys.tables.object_id)+'.'+object_name(sys.tables.object_id),
		CASE WHEN sys.indexes.OBJECT_ID IS null THEN 'Clustered' ELSE 'Heap' end
FROM sys.tables	LEFT OUTER JOIN sys.indexes
		ON sys.indexes.object_ID=sys.tables.OBJECT_ID and sys.indexes.type=0
WHERE  object_schema_name(sys.tables.object_id) <>'sys'

