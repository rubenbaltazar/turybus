CREATE TABLE produccion.Servicio_Diario (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    id_ruta INT NOT NULL,
    fecha_servicio DATE NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    descripcion_servicio TEXT,
    id_conductor INT NOT NULL,
    id_autobus INT NOT NULL,
    FOREIGN KEY (id_ruta) REFERENCES produccion.Ruta(id_ruta),
    FOREIGN KEY (id_conductor) REFERENCES produccion.Conductor(id_conductor),
    FOREIGN KEY (id_autobus) REFERENCES mantenimiento.Autobus(id_autobus)
);