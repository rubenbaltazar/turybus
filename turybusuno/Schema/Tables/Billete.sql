CREATE TABLE ventas.Billete (
    id_billete INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_viajero INT NOT NULL,
    fecha_billete DATE NOT NULL,
    importe_billete DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_servicio) REFERENCES produccion.Servicio_Diario(id_servicio),
    FOREIGN KEY (id_viajero) REFERENCES ventas.Viajero(id_viajero)
);