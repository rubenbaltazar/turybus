

-- Dimensión Ruta
CREATE TABLE staging.Viajero (
    sk_viajero int NOT NULL,
    dni_viajero VARCHAR(20),
    nombres_viajero VARCHAR(50),
    apellidos_viajero VARCHAR(50),
    telefono_viajero VARCHAR(20),
    direccion_viajero VARCHAR(100)
);