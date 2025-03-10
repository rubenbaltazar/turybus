-- Dimensión Lugar
CREATE TABLE dim.Dim_Lugar (
    sk_lugar INT IDENTITY(1,1) PRIMARY KEY,
    id_lugar INT,
    nombre_lugar VARCHAR(255)
);