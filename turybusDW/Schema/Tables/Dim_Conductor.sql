-- Dimensión Conductor
CREATE TABLE dim.Dim_Conductor (
    sk_conductor INT IDENTITY(1,1) PRIMARY KEY,
    id_conductor INT,
    dni_conductor VARCHAR(20),
    nombres_conductor VARCHAR(50),
    apellidos_conductor VARCHAR(50),
    telefono_conductor VARCHAR(20),
    direccion_conductor TEXT
);
