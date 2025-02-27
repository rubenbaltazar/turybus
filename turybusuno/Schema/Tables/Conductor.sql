CREATE TABLE produccion.Conductor (
    id_conductor INT IDENTITY(1,1) PRIMARY KEY,
    dni_conductor VARCHAR(20) UNIQUE NOT NULL,
    nombres_conductor VARCHAR(50) NOT NULL,
    apellidos_conductor VARCHAR(50) NOT NULL,
    telefono_conductor VARCHAR(20),
    direccion_conductor TEXT
);