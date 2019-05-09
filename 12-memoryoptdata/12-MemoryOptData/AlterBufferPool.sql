USE MASTER;
GO
--------------------------------------------
--Add MORE room for Buffering to an SSD
--  NOT Useful for In-Memory Tables
--RAM Memory is more expensive than SSD memory 
---------------------------------------------
ALTER SERVER CONFIGURATION
	SET BUFFER POOL Extension OFF; 

ALTER SERVER CONFIGURATION
	SET BUFFER POOL Extension ON
	(FILENAME='C:\Data\MyCache.bpe', Size=50 GB);


------------------------------------------------
--To reconfigure Turn off then ALTER again
------------------------------------------------
