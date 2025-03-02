CREATE TABLE dim.Dim_Autobus (
    id_autobus INT PRIMARY KEY,
    id_autobus_ak INT,
    matricula VARCHAR(20),
    modelo VARCHAR(255),
    fabricante VARCHAR(255),
    numero_plazas INT,
    caracteristicas TEXT
);