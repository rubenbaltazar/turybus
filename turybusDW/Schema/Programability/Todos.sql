﻿CREATE PROCEDURE [dbo].[MergeDim_Actividad]
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
CREATE PROCEDURE [dbo].[MergeDim_Autobus]
AS
BEGIN

	UPDATE dc
	SET 

	    [matricula]    = sc.[matricula]
	   ,[modelo] = sc.[modelo]
	   ,[fabricante] = sc.[fabricante]
	   ,[numero_plazas] = sc.[numero_plazas]
	   ,[caracteristicas] = sc.[caracteristicas]
	   
	FROM [dim].[Dim_Autobus]         dc
	INNER JOIN [staging].[Autobus] sc ON (dc.[sk_autobus] = sc.[sk_autobus])
END
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


CREATE PROCEDURE [dbo].[MergeHecho_Venta]
AS
BEGIN

	UPDATE DC
	SET 
		 [cantidad_viajeros]    = sc.[cantidad_viajeros]
	   ,[ingresos_totales] = sc.[ingresos_totales]
	   ,[fecha_servicio] = sc.[fecha_servicio]
	   ,[hora_salida] = sc.hora_salida
	   ,hora_llegada = sc.hora_llegada

	FROM [hechos].[Hecho_Venta] dc
	 JOIN [staging].[Ventas] sc ON dc.id_billete=sc.sk_billete
END

