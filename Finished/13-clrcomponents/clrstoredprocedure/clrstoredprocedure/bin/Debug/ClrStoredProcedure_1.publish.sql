﻿/*
Deployment script for Northwind

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Northwind"
:setvar DefaultFilePrefix "Northwind"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [ClrStoredProcedure]...';


GO
CREATE ASSEMBLY [ClrStoredProcedure]
    AUTHORIZATION [dbo]
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010300C8477F5C0000000000000000E00002210B010B00000A000000060000000000000E280000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000C02700004B00000000400000D002000000000000000000000000000000000000006000000C000000882600001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E746578740000001408000000200000000A000000020000000000000000000000000000200000602E72737263000000D00200000040000000040000000C0000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001000000000000000000000000000004000004200000000000000000000000000000000F0270000000000004800000002000500DC200000AC05000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B3003006800000001000011007201000070730500000A0A00066F0600000A00730700000A0B72310000700C07066F0800000A0007086F0900000A00076F0A00000A72BE000070028C0C0000016F0B00000A26280C00000A076F0D00000A0000DE100614FE010D092D07066F0E00000A00DC002A0110000002000C004A560010000000001E02280F00000A2A42534A4201000100000000000C00000076342E302E33303331390000000005006C0000009C010000237E0000080200004802000023537472696E67730000000050040000CC000000235553001C0500001000000023475549440000002C0500008000000023426C6F620000000000000002000001471502000900000000FA25330016000001000000100000000200000002000000010000000F0000000400000001000000010000000200000000000A00010000000000060042003B000600740061000B00880000000600B70097000600D70097000A002F0114010A005B0145010A007C0169010A008E0145010A00A80169010A00C20145010600E8013B000A00EE0145010A00080214010A0013021401060033023B0000000000010000000000010001000100100021000000050001000100502000000000960049000A000100D42000000000861855000F000200000001005B00110055001300210055001900290055000F00310055000F00390055002300410089010F00490055000F004900990128005100B20123004900D9012E005900FB01330071001B023A00790024023F0081003F020F00090055000F00200023001E002E000B004E002E00130057002E001B0060004500048000000000000000000000000000000000F5000000040000000000000000000000010032000000000004000000000000000000000001000801000000000000003C4D6F64756C653E00436C7253746F72656450726F6365647572652E646C6C0053746F72656450726F63656475726573006D73636F726C69620053797374656D004F626A6563740047657450726F6475637473002E63746F720063617449440053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C69747941747472696275746500436C7253746F72656450726F6365647572650053797374656D2E44617461004D6963726F736F66742E53716C5365727665722E5365727665720053716C50726F6365647572654174747269627574650053797374656D2E446174612E53716C436C69656E740053716C436F6E6E656374696F6E0053797374656D2E446174612E436F6D6D6F6E004462436F6E6E656374696F6E004F70656E0053716C436F6D6D616E64007365745F436F6E6E656374696F6E004462436F6D6D616E64007365745F436F6D6D616E64546578740053716C506172616D65746572436F6C6C656374696F6E006765745F506172616D657465727300496E7433320053716C506172616D65746572004164645769746856616C75650053716C436F6E746578740053716C50697065006765745F506970650045786563757465416E6453656E640049446973706F7361626C6500446973706F73650000002F63006F006E007400650078007400200063006F006E006E0065006300740069006F006E003D00740072007500650000808B530065006C0065006300740020002A002000460072006F006D002000500072006F00640075006300740073002000570068006500720065002000430061007400650067006F00720079004900440020003D00200040006300610074004900440020004F0072006400650072002000420079002000500072006F0064007500630074004E0061006D006500000D400063006100740049004400008942DFB05164BB43B098E5043ECA1E0C0008B77A5C561934E08904000101080320000105200101110D04200101080401000000042001010E05200101121D042000122D06200212350E1C040000123D052001011225080704121D12250E020801000701000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010000000000C8477F5C00000000020000001C010000A4260000A4080000525344537CCA580BC1D08041B7F558BD2FBFE4E402000000643A5C44726F70426F785C44726F70626F785C43757272656E74547261696E696E675C53716C20446576656C6F706D656E745C496E7374727563746F725C31332D436C72436F6D706F6E656E74735C436C7253746F72656450726F6365647572655C436C7253746F72656450726F6365647572655C6F626A5C44656275675C436C7253746F72656450726F6365647572652E706462000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E82700000000000000000000FE270000002000000000000000000000000000000000000000000000F02700000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF250020001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100100000001800008000000000000000000000000000000100010000003000008000000000000000000000000000000100000000004800000058400000740200000000000000000000740234000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000000000000000000000000000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B004D4010000010053007400720069006E006700460069006C00650049006E0066006F000000B001000001003000300030003000300034006200300000002C0002000100460069006C0065004400650073006300720069007000740069006F006E000000000020000000300008000100460069006C006500560065007200730069006F006E000000000030002E0030002E0030002E003000000050001700010049006E007400650072006E0061006C004E0061006D006500000043006C007200530074006F00720065006400500072006F006300650064007500720065002E0064006C006C00000000002800020001004C006500670061006C0043006F0070007900720069006700680074000000200000005800170001004F0072006900670069006E0061006C00460069006C0065006E0061006D006500000043006C007200530074006F00720065006400500072006F006300650064007500720065002E0064006C006C0000000000340008000100500072006F006400750063007400560065007200730069006F006E00000030002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000030002E0030002E0030002E00300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000103800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;


GO
ALTER ASSEMBLY [ClrStoredProcedure]
    DROP FILE ALL
    ADD FILE FROM 0x4D6963726F736F667420432F432B2B204D534620372E30300D0A1A445300000000020000010000001B000000800000000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080C18FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30F2E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0BCA3101380000000010000000100000000000000F00FFFF0400000003800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F862513FC607D311905300C04FA302A1C4454B99E9E6D211903F00C04FA302A10B9D865A1166D311BD2A0000F80849BD60A66E40CF64824CB6F042D48172A7991000000000000000B912A3DA00A9804AE49DBB887F7BE55808000000090000000C0000000D0000000E0000000F0000001100000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006800000000000000680000000000000000000000000000000000000000000000010000000000000000000000000000004191320100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF040000000380000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF040000000380000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F862513FC607D311905300C04FA302A1C4454B99E9E6D211903F00C04FA302A10B9D865A1166D311BD2A0000F80849BD60A66E40CF64824CB6F042D48172A7991000000000000000B912A3DA00A9804AE49DBB887F7BE558000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001BE23001AC00000025750848D2D3D4010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000004000000010000000C0000000000000056000000280000001BE2300199D72017580000000100000055000000560000006500000000000000000000002E010000280000001BE2300199D7201758000000AA000000550000002E0100006500000000000000000000006F64756374732E6373000400000055000000000000000100000056000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA3101380000000010000000100000000000001000FFFF04000000038000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001BE2300180000000E4A04036A36FD301010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000200000001000000010000000000000056000000280000001BE2300199D7201758000000010000005500000056000000650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FEEFFEEF01000000B201000000633A5C496E7374727563746F725C31332D436C72436F6D706F6E656E74735C436C7253746F72656450726F6365647572655C436C7253746F72656450726F6365647572655C47657450726F64756374732E63730000633A5C696E7374727563746F725C31332D636C72636F6D706F6E656E74735C636C7273746F72656470726F6365647572655C636C7273746F72656470726F6365647572655C67657470726F64756374732E637300643A5C44726F70426F785C44726F70626F785C43757272656E74547261696E696E675C53716C20446576656C6F706D656E745C496E7374727563746F725C31332D436C72436F6D706F6E656E74735C436C7253746F72656450726F6365647572655C436C7253746F72656450726F6365647572655C47657450726F64756374732E637300643A5C64726F70626F785C64726F70626F785C63757272656E74747261696E696E675C73716C20646576656C6F706D656E745C696E7374727563746F725C31332D636C72636F6D706F6E656E74735C636C7273746F72656470726F6365647572655C636C7273746F72656470726F6365647572655C67657470726F64756374732E63730007000000000000005500000000000000AA00000001000000560000002E010000050000000000000000000000000000000000000000000000000000000000000000000400000036002A1100000000A4010000000000006800000000000000000000000100000600000000010000000047657450726F6475637473000000001600031104000000700100006800000000000000010000000A0024115553797374656D00120024115553797374656D2E44617461000000001A0024115553797374656D2E446174612E53716C436C69656E7400001A0024115553797374656D2E446174612E53716C54797065730000001E002411554D6963726F736F66742E53716C5365727665722E536572766572001E00201103000000010000110000000000000400435324342430303030000000160003113C0000006C0100006600000001000000010000001A00201100000000010000110000000000000000636F6E6E0000000016000311EC00000068010000480000000C000000010000001600201101000000010000110000000000000000636D6400160020110200000001000011000000000000000073716C000200060002000600020006002E000404C93FEAC6B359D649BC250902BBABB460000000004D0044003200000004010000040000000C0000000100050002000600F2000000C0000000000000000100010068000000000000000E000000B4000000000000000B000080010000000C0000800C0000000D0000800D0000000E000080140000000F0000801A000000100000802000000011000080280000001200008030000000130000804700000015000080530000001600008054000000EEEFFE8066000000EEEFFE806700000017000080050006001000510009000A000D0019000D002F000D0062000D0023000D0023000D003A000D00310009000A00000000000000000005000600F400000008000000AA0000000000000008000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF1A092FF1100000000C0200001D000000010000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000003030303030310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001A0025110000000004000000010047657450726F64756374730000001600291100000000040000000100303630303030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000FFFFFFFF1A092FF100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000078000000DD00000038000000FFFFFFFF3800000000000000CE0000008000000058000000040000000300000006000000070000000A0000000B0000000800000072632F66696C65732F633A5C696E7374727563746F725C31332D636C72636F6D706F6E656E74735C636C7273746F72656470726F6365647572655C636C7273746F72656470726F6365647572655C67657470726F64756374732E6373000400000006000000010000001B00000000000000220000000800000011000000070000000A00000006000000000000000500000000000000419132010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001300000020000000DD00000038000000770100003800000000000000CE0000008000000058000000280000008C0200002C0200002C0000003400000003000000130000000600000012000000070000000A0000000B00000008000000090000000C0000000D0000000E0000000F00000011000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF77093101020000000B00008E0C00760C0D0000005C000000200000002C000000E4000000000000000000000016000000190000000000EEC00000000000000000FFFF000000000000FFFFFFFF00000000FFFF0000000000000000000000000A00A801000000000000D8000000010000007869B600000000000000000053746F72656450726F636564757265730043444135313336460000002DBA2EF101000000000000006800000000000000000000000000000000000000020002000D01000000000100FFFFFFFF00000000680000000802000000000000FFFFFFFF00000000FFFFFFFF010001000000010054000000633A5C496E7374727563746F725C31332D436C72436F6D706F6E656E74735C436C7253746F72656450726F6365647572655C436C7253746F72656450726F6365647572655C47657450726F64756374732E637300643A5C44726F70426F785C44726F70626F785C43757272656E74547261696E696E675C53716C20446576656C6F706D656E745C496E7374727563746F725C31332D436C72436F6D706F6E656E74735C436C7253746F72656450726F6365647572655C436C7253746F72656450726F6365647572655C47657450726F64756374732E637300FEEFFEEF010000000100000000010000000000000000000000FFFFFFFFFFFFFFFFFFFF0900FFFFFFFFFFFFFFFFFFFF0000000000942E3101FAB3295A020000007CCA580BC1D08041B7F558BD2FBFE4E4100100002F4C696E6B496E666F002F6E616D6573002F7372632F686561646572626C6F636B002F7372632F66696C65732F633A5C696E7374727563746F725C31332D636C72636F6D706F6E656E74735C636C7273746F72656470726F6365647572655C636C7273746F72656470726F6365647572655C67657470726F64756374732E6373002F7372632F66696C65732F643A5C64726F70626F785C64726F70626F785C63757272656E74747261696E696E675C73716C20646576656C6F706D656E745C696E7374727563746F725C31332D636C72636F6D706F6E656E74735C636C7273746F72656470726F6365647572655C636C7273746F72656470726F6365647572655C67657470726F64756374732E637300050000000A00000001000000A7000000000000002200000008000000110000000700000000000000050000000A00000006000000810000000E00000000000000DC51330100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F000000440000007401000038000000FB0100003800000000000000E2010000AC00000058000000280000008C0200002C0200002C000000340000005800000013000000160000000600000015000000070000000C0000000900000008000000050000000D0000000E0000000F00000010000000120000001100000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000170000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 AS N'ClrStoredProcedure.pdb';


GO
PRINT N'Creating [dbo].[GetProducts]...';


GO
CREATE PROCEDURE [dbo].[GetProducts]
@catID INT NULL
AS EXTERNAL NAME [ClrStoredProcedure].[StoredProcedures].[GetProducts]


GO
PRINT N'Update complete.';


GO
