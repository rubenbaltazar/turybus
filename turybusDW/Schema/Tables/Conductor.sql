-- Dimensión Conductor
CREATE TABLE staging.Conductor (
    sk_conductor INT PRIMARY KEY,
    dni_conductor VARCHAR(20),
    nombres_conductor VARCHAR(50),
    apellidos_conductor VARCHAR(50),
    telefono_conductor VARCHAR(20),
    direccion_conductor TEXT
);
