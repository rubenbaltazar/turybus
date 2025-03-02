-- Dimensión Fecha
CREATE TABLE dim.Dim_Fecha (
    id_fecha INT PRIMARY KEY,
    id_fecha_ak INT,
    fecha DATE,
    dia INT,
    mes INT,
    anio INT,
    dia_semana VARCHAR(20)
);