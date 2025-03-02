CREATE TABLE hechos.Hechos_Viajes (
    id_viaje INT IDENTITY(1,1) PRIMARY KEY,
    id_ruta INT,
    id_fecha INT,
    id_autobus INT,
    id_conductor INT,
    id_lugar INT,
    id_actividad INT,
    cantidad_viajeros INT,
    ingresos_totales DECIMAL(10,2),
    FOREIGN KEY (id_ruta) REFERENCES dim.Dim_Ruta(id_ruta),
    FOREIGN KEY (id_fecha) REFERENCES dim.Dim_Fecha(id_fecha),
    FOREIGN KEY (id_autobus) REFERENCES dim.Dim_Autobus(id_autobus),
    FOREIGN KEY (id_conductor) REFERENCES dim.Dim_Conductor(id_conductor),
    FOREIGN KEY (id_lugar) REFERENCES dim.Dim_Lugar(id_lugar),
    FOREIGN KEY (id_actividad) REFERENCES dim.Dim_Actividad(id_actividad)
);
