-- Dimensión Conductor
CREATE TABLE staging.Conductor (
    sk_conductor int NOT NULL,
    dni_conductor VARCHAR(20),
    nombres_conductor VARCHAR(50),
    apellidos_conductor VARCHAR(50),
    telefono_conductor VARCHAR(20),
    direccion_conductor TEXT
);
