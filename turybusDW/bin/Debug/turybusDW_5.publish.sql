/*
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
PRINT N'Creando Procedimiento [dbo].[MergeDim_Actividad]...';


GO
CREATE PROCEDURE [dbo].[MergeDim_Actividad]
AS
BEGIN

	UPDATE dc
	SET 
	    [nombre_actividad]    = sc.[nombre_actividad]
	   ,[descripcion_actividad] = sc.[descripcion_actividad]
	   
	FROM [dim].[Dim_Actividad]         dc
	INNER JOIN [staging].[Actividad] sc ON (dc.[sk_actividad] = sc.[sk_actividad])
END
GO
PRINT N'Creando Procedimiento [dbo].[MergeDim_Conductor]...';


GO
CREATE PROCEDURE [dbo].[MergeDim_Conductor]
AS
BEGIN

	UPDATE dc
	SET 

	    [dni_conductor]    = sc.[dni_conductor]
	   ,[nombres_conductor] = sc.[nombres_conductor]
	   ,[apellidos_conductor] = sc.[apellidos_conductor]
	   ,[telefono_conductor] = sc.[telefono_conductor]
	   ,[direccion_conductor] = sc.[direccion_conductor]
	   
	FROM [dim].[Dim_Conductor]         dc
	INNER JOIN [staging].[Conductor] sc ON (dc.[sk_conductor] = sc.[sk_conductor])
END
GO
PRINT N'Creando Procedimiento [dbo].[MergeDim_Fecha]...';


GO
CREATE PROCEDURE [dbo].[MergeDim_Fecha]
AS
BEGIN

	UPDATE dc
	SET 

	    [fecha]    = sc.[fecha]
	   ,[dia] = sc.[dia]
	   ,[mes] = sc.[mes]
	   ,[anio] = sc.[anio]
	   ,[dia_semana] = sc.[dia_semana]
	   
	FROM [dim].[Dim_Fecha]         dc
	INNER JOIN [staging].[Fecha] sc ON (dc.[sk_fecha] = sc.[sk_fecha])
END
GO
PRINT N'Creando Procedimiento [dbo].[MergeDim_Lugar]...';


GO

CREATE PROCEDURE [dbo].[MergeDim_Lugar]
AS
BEGIN

	UPDATE dc
	SET 

	    [nombre_lugar]    = sc.[nombre_lugar]
	   
	   
	FROM [dim].[Dim_Lugar]         dc
	INNER JOIN [staging].[Lugar] sc ON (dc.[sk_lugar] = sc.[sk_lugar])
END
GO
PRINT N'Creando Procedimiento [dbo].[MergeDim_Ruta]...';


GO
CREATE PROCEDURE [dbo].[MergeDim_Ruta]
AS
BEGIN

	UPDATE dc
	SET 

	    [nombre_ruta]    = sc.[nombre_ruta]
	   ,[importe_ruta] = sc.[importe_ruta]
	   ,[distancia_ruta] = sc.[distancia_ruta]
	   
	FROM [dim].[Dim_Ruta]         dc
	INNER JOIN [staging].[Ruta] sc ON (dc.[sk_ruta] = sc.[sk_ruta])
END
GO
PRINT N'Actualización completada.';


GO
