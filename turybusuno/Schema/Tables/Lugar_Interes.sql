CREATE TABLE produccion.Lugar_Interes (
    id_lugar_interes INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_lugar INT NOT NULL,
    id_actividad INT,
    hora_prevista TIME NOT NULL,
    tiempo_parada INT,
    distancia_lugar DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_servicio) REFERENCES produccion.Servicio_Diario(id_servicio),
    FOREIGN KEY (id_lugar) REFERENCES produccion.Lugar(id_lugar),
    FOREIGN KEY (id_actividad) REFERENCES produccion.Actividad(id_actividad)
);
