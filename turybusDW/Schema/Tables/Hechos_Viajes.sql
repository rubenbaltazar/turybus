CREATE TABLE hechos.Hechos_Viajes (
    id_viaje INT IDENTITY(1,1) PRIMARY KEY,
    sk_ruta INT,
    sk_fecha INT,
    sk_autobus INT,
    sk_conductor INT,
    sk_lugar INT,
    sk_actividad INT,
    cantidad_viajeros INT,
    ingresos_totales DECIMAL(10,2),
    FOREIGN KEY (sk_ruta) REFERENCES dim.Dim_Ruta(sk_ruta),
    FOREIGN KEY (sk_fecha) REFERENCES dim.Dim_Fecha(sk_fecha),
    FOREIGN KEY (sk_autobus) REFERENCES dim.Dim_Autobus(sk_autobus),
    FOREIGN KEY (sk_conductor) REFERENCES dim.Dim_Conductor(sk_conductor),
    FOREIGN KEY (sk_lugar) REFERENCES dim.Dim_Lugar(sk_lugar),
    FOREIGN KEY (sk_actividad) REFERENCES dim.Dim_Actividad(sk_actividad)
);
