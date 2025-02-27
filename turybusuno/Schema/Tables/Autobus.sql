CREATE TABLE mantenimiento.Autobus (
    id_autobus INT IDENTITY(1,1) PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    fabricante VARCHAR(255) NOT NULL,
    numero_plazas INT NOT NULL,
    caracteristicas TEXT
);