-- Dimensión Fecha
CREATE TABLE staging.Fecha (
    sk_fecha INT PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    anio INT,
    dia_semana VARCHAR(20)
);