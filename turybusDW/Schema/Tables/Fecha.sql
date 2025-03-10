-- Dimensión Fecha
CREATE TABLE staging.Fecha (
    sk_fecha int NOT NULL,
    fecha DATE,
    dia INT,
    mes INT,
    anio INT,
    dia_semana VARCHAR(20)
);