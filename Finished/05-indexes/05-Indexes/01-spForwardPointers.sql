Use LabData;
Go

Create Procedure spForwardPointers
	@Table VarChar(15)
AS
---------------------------------------------------------------------
--Check Forward Pointers
---------------------------------------------------------------------
	Select Database_id, 
	Index_id,
	Object_name([object_id]) as TableName, 
	Case when SI.name is null then 'HEAP' else SI.name End as IndexName,
	Index_type_desc, 
	Avg_fragmentation_in_percent,
		   forwarded_record_count
	From sys.dm_db_index_physical_stats(db_id(),object_id(@Table),null,null,'detailed') AS SDDIPS
	Inner join sys.sysindexes AS SI on SDDIPS.[object_id] = SI.id 
	AND SDDIPS.index_id = SI.indid
	Where index_level = 0
Go
