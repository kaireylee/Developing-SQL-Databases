CREATE FUNCTION [dbo].[HelloSqlFunction]
( )
RETURNS NVARCHAR (MAX)
AS
 EXTERNAL NAME [SimpleFunctionVS].[UserDefinedFunctions].[HelloSqlFunction]

