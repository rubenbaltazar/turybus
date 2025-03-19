CREATE  PROCEDURE [dbo].[GetDatabaseRowVersion]
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET NOCOUNT ON

	SELECT DBTS = (CONVERT(BIGINT,MIN_ACTIVE_ROWVERSION())-1);
END
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

CREATE  PROCEDURE [dbo].[GetFechasChangesByRowVersion]
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
