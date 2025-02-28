CREATE TABLE ventas.Viajero (
    id_viajero INT IDENTITY(1,1) PRIMARY KEY,
    dni_viajero VARCHAR(20) UNIQUE NOT NULL,
    nombres_viajero VARCHAR(50) NOT NULL,
    apellidos_viajero VARCHAR(50) NOT NULL,
    telefono_viajero VARCHAR(20),
    direccion_viajero VARCHAR(100)
);