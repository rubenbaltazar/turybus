-- Dimensión Conductor
CREATE TABLE dim.Dim_Conductor (
    id_conductor INT PRIMARY KEY,
    id_conductor_ak INT,
    dni_conductor VARCHAR(20),
    nombres_conductor VARCHAR(50),
    apellidos_conductor VARCHAR(50),
    telefono_conductor VARCHAR(20),
    direccion_conductor TEXT
);
