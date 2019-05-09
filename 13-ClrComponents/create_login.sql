-- Module 13 Demo 2 File 1

USE master
GO

IF EXISTS ( SELECT * FROM sys.server_principals WHERE name = N'Trusted_Assembly_Login' )
	DROP LOGIN [Trusted_Assembly_Login]

IF EXISTS ( SELECT * FROM sys.asymmetric_keys WHERE name = N'CLRDemo')
	DROP ASYMMETRIC KEY CLRDemo

CREATE ASYMMETRIC KEY CLRDemo
FROM EXECUTABLE FILE = 'D:\Demofiles\Mod13\ClrDemo\ClrDemo\bin\Debug\ClrDemo.dll';

GO

CREATE LOGIN Trusted_Assembly_Login FROM ASYMMETRIC KEY CLRDemo
GO

GRANT UNSAFE ASSEMBLY TO Trusted_Assembly_Login
GO