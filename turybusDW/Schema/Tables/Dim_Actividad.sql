CREATE TABLE dim.Dim_Actividad (
    sk_actividad INT IDENTITY(1,1) PRIMARY KEY,
    id_actividad INT,
    nombre_actividad VARCHAR(255),
    descripcion_actividad TEXT
);