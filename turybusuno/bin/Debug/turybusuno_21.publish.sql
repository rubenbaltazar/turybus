﻿/*
Script de implementación para turybus

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybus"
:setvar DefaultFilePrefix "turybus"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Modificando Procedimiento [dbo].[GetFechasChangesByRowVersion]...';


GO

ALTER  PROCEDURE [dbo].[GetFechasChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT 
distinct
    CAST(CONVERT(VARCHAR, fecha_billete, 112) AS INT) AS id_fecha
    ,fecha_billete as fecha,  
    DAY(fecha_billete) AS dia,  
    MONTH(fecha_billete) AS mes,
    YEAR(fecha_billete) AS anio, 
    DATEPART(WEEKDAY, fecha_billete) AS dia_semana 
FROM ventas.Billete
WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Actualización completada.';


GO
