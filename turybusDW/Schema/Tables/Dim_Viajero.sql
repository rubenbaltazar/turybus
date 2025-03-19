-- Dimensión Ruta
CREATE TABLE dim.Dim_Viajero (
    sk_viajero INT IDENTITY(1,1) PRIMARY KEY,
    id_viajero INT,
    dni_viajero VARCHAR(20),
    nombres_viajero VARCHAR(50),
    apellidos_viajero VARCHAR(50),
    telefono_viajero VARCHAR(20),
    direccion_viajero VARCHAR(100)
);