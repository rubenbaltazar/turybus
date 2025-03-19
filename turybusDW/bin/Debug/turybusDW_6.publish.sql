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
PRINT N'Creando Tabla [dim].[Dim_Viajero]...';


GO
CREATE TABLE [dim].[Dim_Viajero] (
    [sk_viajero]        INT           IDENTITY (1, 1) NOT NULL,
    [id_viajero]        INT           NULL,
    [dni_viajero]       VARCHAR (20)  NULL,
    [nombres_viajero]   VARCHAR (50)  NULL,
    [apellidos_viajero] VARCHAR (50)  NULL,
    [telefono_viajero]  VARCHAR (20)  NULL,
    [direccion_viajero] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([sk_viajero] ASC)
);


GO
PRINT N'Creando Tabla [staging].[Viajero]...';


GO
CREATE TABLE [staging].[Viajero] (
    [sk_viajero]        INT           NOT NULL,
    [dni_viajero]       VARCHAR (20)  NULL,
    [nombres_viajero]   VARCHAR (50)  NULL,
    [apellidos_viajero] VARCHAR (50)  NULL,
    [telefono_viajero]  VARCHAR (20)  NULL,
    [direccion_viajero] VARCHAR (100) NULL
);


GO
PRINT N'Actualización completada.';


GO
