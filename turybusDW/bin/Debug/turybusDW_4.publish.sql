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
PRINT N'Quitando Clave principal restricción sin nombre en [staging].[Fecha]...';


GO
ALTER TABLE [staging].[Fecha] DROP CONSTRAINT [PK__Fecha__18FB76FF76E05065];


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Actividad]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Actividad] (
    [sk_actividad]          INT           NOT NULL,
    [nombre_actividad]      VARCHAR (255) NULL,
    [descripcion_actividad] TEXT          NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Actividad])
    BEGIN
        INSERT INTO [staging].[tmp_ms_xx_Actividad] ([sk_actividad], [nombre_actividad], [descripcion_actividad])
        SELECT [sk_actividad],
               [nombre_actividad],
               [descripcion_actividad]
        FROM   [staging].[Actividad];
    END

DROP TABLE [staging].[Actividad];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Actividad]', N'Actividad';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Autobus]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Autobus] (
    [sk_autobus]      INT           NOT NULL,
    [matricula]       VARCHAR (20)  NULL,
    [modelo]          VARCHAR (255) NULL,
    [fabricante]      VARCHAR (255) NULL,
    [numero_plazas]   INT           NULL,
    [caracteristicas] TEXT          NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Autobus])
    BEGIN
        INSERT INTO [staging].[tmp_ms_xx_Autobus] ([sk_autobus], [matricula], [modelo], [fabricante], [numero_plazas], [caracteristicas])
        SELECT [sk_autobus],
               [matricula],
               [modelo],
               [fabricante],
               [numero_plazas],
               [caracteristicas]
        FROM   [staging].[Autobus];
    END

DROP TABLE [staging].[Autobus];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Autobus]', N'Autobus';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Conductor]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Conductor] (
    [sk_conductor]        INT          NOT NULL,
    [dni_conductor]       VARCHAR (20) NULL,
    [nombres_conductor]   VARCHAR (50) NULL,
    [apellidos_conductor] VARCHAR (50) NULL,
    [telefono_conductor]  VARCHAR (20) NULL,
    [direccion_conductor] TEXT         NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Conductor])
    BEGIN
        INSERT INTO [staging].[tmp_ms_xx_Conductor] ([sk_conductor], [dni_conductor], [nombres_conductor], [apellidos_conductor], [telefono_conductor], [direccion_conductor])
        SELECT [sk_conductor],
               [dni_conductor],
               [nombres_conductor],
               [apellidos_conductor],
               [telefono_conductor],
               [direccion_conductor]
        FROM   [staging].[Conductor];
    END

DROP TABLE [staging].[Conductor];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Conductor]', N'Conductor';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Lugar]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Lugar] (
    [sk_lugar]     INT           NOT NULL,
    [nombre_lugar] VARCHAR (255) NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Lugar])
    BEGIN
        INSERT INTO [staging].[tmp_ms_xx_Lugar] ([sk_lugar], [nombre_lugar])
        SELECT [sk_lugar],
               [nombre_lugar]
        FROM   [staging].[Lugar];
    END

DROP TABLE [staging].[Lugar];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Lugar]', N'Lugar';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Ruta]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Ruta] (
    [sk_ruta]        INT             NOT NULL,
    [nombre_ruta]    VARCHAR (255)   NULL,
    [importe_ruta]   DECIMAL (10, 2) NULL,
    [distancia_ruta] DECIMAL (10, 2) NULL
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Ruta])
    BEGIN
        INSERT INTO [staging].[tmp_ms_xx_Ruta] ([sk_ruta], [nombre_ruta], [importe_ruta], [distancia_ruta])
        SELECT [sk_ruta],
               [nombre_ruta],
               [importe_ruta],
               [distancia_ruta]
        FROM   [staging].[Ruta];
    END

DROP TABLE [staging].[Ruta];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Ruta]', N'Ruta';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Actualización completada.';


GO
