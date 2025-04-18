﻿/*
Script de implementación para turybusuno

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybusuno"
:setvar DefaultFilePrefix "turybusuno"
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
INSERT INTO mantenimiento.Revision (id_autobus, id_reparacion, fecha_revision, tiempo_revision, diagnostico)
VALUES
(12, 5, '2025-02-01', 120, 'Cambio de aceite y filtros realizado con exito'),
(7, 3, '2025-02-02', 150, 'Reparacion de frenos completa y eficaz'),
(9, 15, '2025-02-03', 100, 'Reparacion de sistema de escape finalizada'),
(3, 6, '2025-02-04', 180, 'Mantenimiento de motor realizado con exito'),
(20, 2, '2025-02-05', 90, 'Cambio de aceite y filtros completado correctamente'),
(6, 18, '2025-02-06', 200, 'Reparacion de embrague realizada satisfactoriamente'),
(4, 7, '2025-02-07', 110, 'Ajuste de alineacion de ruedas hecho'),
(13, 14, '2025-02-08', 130, 'Reparacion de sistema de aire acondicionado'),
(8, 9, '2025-02-09', 140, 'Cambio de bujias y reemplazo de pastillas de freno'),
(15, 10, '2025-02-10', 160, 'Cambio de correa de distribucion completado'),
(5, 1, '2025-02-11', 130, 'Reemplazo de llantas con exito'),
(16, 4, '2025-02-12', 150, 'Mantenimiento de direccion hidraulica realizado'),
(18, 17, '2025-02-13', 180, 'Inspeccion y ajuste de frenos ABS completado'),
(10, 12, '2025-02-14', 110, 'Reparacion de transmision realizada'),
(11, 11, '2025-02-15', 160, 'Reemplazo de amortiguadores realizado'),
(7, 16, '2025-02-16', 200, 'Mantenimiento de sistema electrico completado'),
(14, 8, '2025-02-17', 120, 'Reparacion de suspension realizada'),
(9, 13, '2025-02-18', 180, 'Ajuste de suspension realizado con exito'),
(19, 5, '2025-02-19', 150, 'Cambio de aceite y filtros realizado'),
(20, 6, '2025-02-20', 200, 'Reparacion de frenos realizada'),
(3, 14, '2025-02-21', 110, 'Reparacion de sistema de aire acondicionado completada'),
(10, 16, '2025-02-22', 190, 'Cambio de bujias realizado'),
(2, 4, '2025-02-23', 140, 'Reparacion de transmision completada'),
(21, 17, '2025-02-24', 130, 'Inspeccion y ajuste de frenos ABS realizado'),
(6, 1, '2025-02-25', 160, 'Reemplazo de llantas realizado'),
(22, 3, '2025-02-26', 120, 'Reparacion de frenos completada con exito'),
(11, 15, '2025-02-27', 140, 'Reparacion de embrague realizada'),
(1, 2, '2025-02-28', 110, 'Cambio de aceite y filtros completado'),
(5, 8, '2025-03-01', 150, 'Reparacion de suspension realizada con exito'),
(8, 10, '2025-03-02', 170, 'Mantenimiento de motor realizado'),
(17, 11, '2025-03-03', 180, 'Reemplazo de amortiguadores realizado correctamente'),
(16, 12, '2025-03-04', 130, 'Cambio de correa de distribucion realizado'),
(3, 4, '2025-03-05', 140, 'Ajuste de alineacion de ruedas realizado'),
(14, 18, '2025-03-06', 150, 'Reparacion de sistema de escape completada'),
(19, 5, '2025-03-07', 160, 'Reparacion de frenos realizada'),
(6, 3, '2025-03-08', 180, 'Cambio de aceite y filtros realizado con exito'),
(7, 2, '2025-03-09', 140, 'Reemplazo de llantas realizado'),
(9, 6, '2025-03-10', 160, 'Reparacion de sistema electrico completada'),
(21, 16, '2025-03-11', 150, 'Reparacion de suspension completada'),
(2, 15, '2025-03-12', 170, 'Cambio de bujias completado'),
(13, 9, '2025-03-13', 200, 'Reparacion de frenos realizada satisfactoriamente'),
(17, 7, '2025-03-14', 150, 'Mantenimiento de motor completado'),
(14, 11, '2025-03-15', 180, 'Reparacion de embrague realizada correctamente'),
(5, 13, '2025-03-16', 190, 'Reparacion de transmision realizada'),
(18, 8, '2025-03-17', 120, 'Reparacion de sistema de aire acondicionado finalizada'),
(10, 17, '2025-03-18', 130, 'Inspeccion y ajuste de frenos ABS completado'),
(3, 1, '2025-03-19', 160, 'Reemplazo de llantas realizado correctamente'),
(22, 14, '2025-03-20', 140, 'Reparacion de suspension completada'),
(16, 12, '2025-03-21', 110, 'Reparacion de frenos realizada'),
(4, 3, '2025-03-22', 130, 'Reparacion de sistema electrico completada'),
(15, 16, '2025-03-23', 150, 'Reemplazo de amortiguadores realizado'),
(6, 10, '2025-03-24', 180, 'Mantenimiento de motor completado'),
(12, 7, '2025-03-25', 140, 'Reparacion de frenos realizada'),
(8, 5, '2025-03-26', 160, 'Reparacion de transmision completada'),
(19, 9, '2025-03-27', 150, 'Reparacion de embrague realizada'),
(4, 18, '2025-03-28', 130, 'Reparacion de sistema de escape realizada'),
(13, 2, '2025-03-29', 110, 'Cambio de aceite y filtros completado');
GO

GO
PRINT N'Actualización completada.';


GO
