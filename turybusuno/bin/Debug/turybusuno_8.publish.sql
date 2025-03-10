/*
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
PRINT N'Creando Procedimiento [dbo].[GetActividadChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetActividadChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_actividad]
      ,[nombre_actividad]
      ,[descripcion_actividad]
      ,[rowversion]
  FROM [produccion].[Actividad]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetAutobusChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetAutobusChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_autobus]
      ,[matricula]
      ,[modelo]
      ,[fabricante]
      ,[numero_plazas]
      ,[caracteristicas]
      ,[rowversion]
  FROM [mantenimiento].[Autobus]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetBilleteChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetBilleteChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_billete]
      ,[id_servicio]
      ,[id_viajero]
      ,[fecha_billete]
      ,[importe_billete]
      ,[rowversion]
  FROM [ventas].[Billete]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetConductorChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetConductorChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_conductor]
      ,[dni_conductor]
      ,[nombres_conductor]
      ,[apellidos_conductor]
      ,[telefono_conductor]
      ,[direccion_conductor]
      ,[rowversion]
  FROM [produccion].[Conductor]

	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetLugar_InteresChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetLugar_InteresChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_lugar_interes]
      ,[id_servicio]
      ,[id_lugar]
      ,[id_actividad]
      ,[hora_prevista]
      ,[tiempo_parada]
      ,[distancia_lugar]
      ,[rowversion]
  FROM [produccion].[Lugar_Interes]

	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetLugarChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetLugarChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_lugar]
      ,[nombre_lugar]
      ,[rowversion]
      FROM [produccion].[Lugar]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetReparacionChangesByRowVersion]...';


GO
CREATE  PROCEDURE [dbo].[GetReparacionChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_reparacion]
      ,[nombre_reparacion]
      ,[rowversion]
  FROM [mantenimiento].[Reparacion]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetRevisionChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetRevisionChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_revision]
      ,[id_autobus]
      ,[id_reparacion]
      ,[fecha_revision]
      ,[tiempo_revision]
      ,[diagnostico]
      ,[rowversion]
  FROM [mantenimiento].[Revision]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetRutaChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetRutaChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_ruta]
      ,[nombre_ruta]
      ,[importe_ruta]
      ,[distancia_ruta]
      ,[rowversion]
  FROM [produccion].[Ruta]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Creando Procedimiento [dbo].[GetViajeroChangesByRowVersion]...';


GO

CREATE  PROCEDURE [dbo].[GetViajeroChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

SELECT [id_viajero]
      ,[dni_viajero]
      ,[nombres_viajero]
      ,[apellidos_viajero]
      ,[telefono_viajero]
      ,[direccion_viajero]
      ,[rowversion]
  FROM [ventas].[Viajero]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
PRINT N'Actualización completada.';


GO
