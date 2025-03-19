/*
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
PRINT N'Creando Procedimiento [dbo].[GetVentasChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetVentasChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_billete]
	  ,SE.id_ruta
	  ,CAST(CONVERT(VARCHAR, fecha_billete, 112) AS INT) AS id_fecha
	  ,SE.id_autobus
	  ,SE.id_conductor
	  ,LUI.id_lugar
	  ,LUI.id_actividad
	  ,BI.id_viajero
	  ,SE.id_servicio AS codigo_servicio
	  ,SE.fecha_servicio
	  ,SE.hora_salida
	  ,SE.hora_llegada
	  ,1 AS cantidad_viajeros
	  ,bi.importe_billete as ingresos_totales
      ,SE.[rowversion]
  FROM [ventas].[Billete] bi 
       join [produccion].[Servicio_Diario] SE ON BI.id_servicio=SE.id_servicio
	   join [produccion].[Lugar_Interes] LUI ON SE.id_servicio=LUI.id_servicio
	  WHERE BI.rowversion > CONVERT(ROWVERSION,@startRow) 
	  AND BI.rowversion <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Actualización completada.';


GO
