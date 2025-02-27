CREATE TABLE mantenimiento.Revision (
    id_revision INT IDENTITY(1,1) PRIMARY KEY,
    id_autobus INT NOT NULL,
    id_reparacion INT NOT NULL,
    fecha_revision DATE NOT NULL,
    tiempo_revision INT NOT NULL,
    diagnostico TEXT,
    FOREIGN KEY (id_autobus) REFERENCES mantenimiento.Autobus(id_autobus),
    FOREIGN KEY (id_reparacion) REFERENCES mantenimiento.Reparacion(id_reparacion)
);
