CREATE TABLE produccion.Ruta (
    id_ruta INT IDENTITY(1,1) PRIMARY KEY,
    nombre_ruta VARCHAR(255) NOT NULL,
    importe_ruta DECIMAL(10,2) NOT NULL,
    distancia_ruta DECIMAL(10,2) NOT NULL
);
