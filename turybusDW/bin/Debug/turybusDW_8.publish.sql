﻿/*
Script de implementación para turybusdw

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybusdw"
:setvar DefaultFilePrefix "turybusdw"
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
PRINT N'Creando Procedimiento [dbo].[MergeDim_Viajero]...';


GO

CREATE PROCEDURE [dbo].[MergeDim_Viajero]
AS
BEGIN

	UPDATE dc
	SET 

	    [dni_viajero]    = sc.[dni_viajero]
	   ,[nombres_viajero] = sc.[nombres_viajero]
	   ,[apellidos_viajero] = sc.[apellidos_viajero]
	   ,[telefono_viajero] = sc.[telefono_viajero]
	   ,[direccion_viajero] = sc.[direccion_viajero]
	   
	FROM [dim].[Dim_Viajero]         dc
	INNER JOIN [staging].[Viajero] sc ON (dc.[sk_viajero] = sc.[sk_viajero])
END
GO
PRINT N'Actualización completada.';


GO
