USE master;  
GO  

--Get All Cached Plans
------------------------------------------------------------------
SELECT * 
	FROM sys.dm_exec_cached_plans cp 
		CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle);  
GO

--Get plans and average CPU time for the top five queries.
-----------------------------------------------------------------
SELECT TOP 5 total_worker_time/execution_count AS [Avg CPU Time],  
			 Plan_handle, query_plan   
FROM sys.dm_exec_query_stats AS qs  
	CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle)  
ORDER BY total_worker_time/execution_count DESC;  
GO   