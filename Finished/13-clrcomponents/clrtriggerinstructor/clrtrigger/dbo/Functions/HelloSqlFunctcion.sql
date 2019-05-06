CREATE FUNCTION [dbo].[HelloSqlFunctcion]
( )
RETURNS NVARCHAR (50)
AS
 EXTERNAL NAME [MyFunctionLibrary].[udfLab].[HelloSqlFunctcion]

