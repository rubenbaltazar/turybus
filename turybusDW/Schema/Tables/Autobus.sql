CREATE TABLE staging.Autobus (
    sk_autobus INT PRIMARY KEY,
    matricula VARCHAR(20),
    modelo VARCHAR(255),
    fabricante VARCHAR(255),
    numero_plazas INT,
    caracteristicas TEXT
);