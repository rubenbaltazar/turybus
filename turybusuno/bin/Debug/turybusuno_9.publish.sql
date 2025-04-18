﻿/*
Script de implementación para turybusuno

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybusuno"
:setvar DefaultFilePrefix "turybusuno"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
INSERT INTO mantenimiento.Autobus (matricula, modelo, fabricante, numero_plazas, caracteristicas) VALUES
('ABC1234', 'Mercedes-Benz Sprinter 515', 'Mercedes-Benz', 20, 'Aire acondicionado, WiFi, asientos cómodos, sistema de audio'),
('XYZ5678', 'Volvo B9R', 'Volvo', 42, 'Aire acondicionado, asientos reclinables, WiFi, pantallas de entretenimiento'),
('LMN9012', 'Scania K360IB', 'Scania', 48, 'Sistema de audio de alta calidad, aire acondicionado, 3 puertas'),
('DEF3456', 'Iveco Crossway', 'Iveco', 30, 'Asientos de lujo, ventanas panorámicas, WiFi, aire acondicionado'),
('GHI7890', 'MAN Lion’s Coach', 'MAN', 45, 'Asientos de cuero, aire acondicionado, pantallas, sistema de sonido premium'),
('JKL1234', 'Mercedes-Benz Tourismo', 'Mercedes-Benz', 52, 'Asientos de lujo, aire acondicionado, WiFi, sistema de entretenimiento'),
('MNO5678', 'Setra S 431 DT', 'Setra', 60, 'Asientos de 2 pisos, aire acondicionado, entretenimiento a bordo'),
('PQR9012', 'Volkswagen Crafter', 'Volkswagen', 18, 'Asientos cómodos, aire acondicionado, sistema de sonido básico'),
('STU3456', 'Ford Transit', 'Ford', 16, 'Asientos ergonómicos, aire acondicionado, puerta corrediza'),
('VWX7890', 'Neoplan Cityliner', 'Neoplan', 50, 'Aire acondicionado, asientos reclinables, WiFi, pantallas LCD'),
('YZ1234A', 'Isuzu LV', 'Isuzu', 30, 'Aire acondicionado, asientos cómodos, sistema de audio básico'),
('BCD5678A', 'Volvo 9900', 'Volvo', 55, 'Pantallas de entretenimiento, WiFi, aire acondicionado, asientos cómodos'),
('EFG9012B', 'Iveco Evadys', 'Iveco', 40, 'Asientos de tela, aire acondicionado, WiFi, servicio de catering'),
('HIJ3456C', 'Scania Touring', 'Scania', 48, 'Asientos de tela, aire acondicionado, WiFi, sistema de sonido básico'),
('KLM7890D', 'Mercedes-Benz O 500 RSD', 'Mercedes-Benz', 52, 'Pantallas LCD, WiFi, asientos cómodos, aire acondicionado'),
('NOP1234E', 'Volvo 9700', 'Volvo', 46, 'Aire acondicionado, asientos de cuero, sistema de entretenimiento'),
('QRS5678F', 'Setra S 516 HD', 'Setra', 55, 'Asientos de lujo, aire acondicionado, pantallas, WiFi'),
('TUV9012G', 'MAN Lion’s City', 'MAN', 28, 'Aire acondicionado, asientos cómodos, sistema de audio'),
('WXY3456H', 'Neoplan Starliner', 'Neoplan', 50, 'Asientos de 2 pisos, aire acondicionado, pantallas de entretenimiento'),
('ZAB7890I', 'Iveco Daily', 'Iveco', 20, 'Aire acondicionado, asientos ergonómicos, sistema de sonido básico'),
('CDE1234J', 'Ford F-Max', 'Ford', 15, 'Asientos de lujo, aire acondicionado, WiFi'),
('FGH5678K', 'Volkswagen VW 6.1', 'Volkswagen', 18, 'Asientos ergonómicos, sistema de audio, aire acondicionado'),
('IJK9012L', 'Mercedes-Benz Sprinter 519', 'Mercedes-Benz', 22, 'Asientos cómodos, aire acondicionado, WiFi'),
('LMN3456M', 'Scania K360', 'Scania', 40, 'Aire acondicionado, asientos reclinables, WiFi, sistema de entretenimiento'),
('OPQ7890N', 'Setra S 415 LE', 'Setra', 30, 'Pantallas de entretenimiento, aire acondicionado, WiFi'),
('RST1234O', 'MAN TGX', 'MAN', 25, 'Asientos cómodos, aire acondicionado, sistema de audio básico'),
('UVX5678P', 'Volvo 7900', 'Volvo', 45, 'Aire acondicionado, asientos de lujo, WiFi, entretenimiento multimedia'),
('WYZ9012Q', 'Neoplan N 31', 'Neoplan', 48, 'Asientos reclinables, aire acondicionado, WiFi'),
('ABC3456R', 'Iveco S-Way', 'Iveco', 40, 'Aire acondicionado, pantallas LCD, asientos cómodos'),
('DEF7890S', 'Ford Transit 350', 'Ford', 15, 'Aire acondicionado, asientos ergonómicos, WiFi'),
('GHI1234T', 'Mercedes-Benz Citaro', 'Mercedes-Benz', 30, 'Asientos de tela, aire acondicionado, sistema de sonido básico'),
('JKL5678U', 'Volvo FH16', 'Volvo', 35, 'Asientos cómodos, aire acondicionado, WiFi, pantallas'),
('MNO9012V', 'Setra S 515 HD', 'Setra', 55, 'Aire acondicionado, asientos cómodos, pantallas de entretenimiento'),
('PQR3456W', 'Scania Citywide', 'Scania', 28, 'Aire acondicionado, asientos ergonómicos, sistema de sonido básico'),
('STU7890X', 'Volkswagen VW 6.0', 'Volkswagen', 18, 'Asientos ergonómicos, aire acondicionado, WiFi'),
('VWX1234Y', 'Iveco Trakker', 'Iveco', 22, 'Asientos cómodos, aire acondicionado, sistema de audio'),
('YZ5678Z', 'Neoplan Cityliner', 'Neoplan', 50, 'Pantallas LCD, WiFi, aire acondicionado'),
('BCD9012A1', 'MAN Lion’s Coach L', 'MAN', 45, 'Asientos de lujo, aire acondicionado, sistema de entretenimiento'),
('EFG3456B2', 'Volvo B8R', 'Volvo', 40, 'Aire acondicionado, asientos de lujo, pantallas de entretenimiento'),
('HIJ7890C3', 'Mercedes-Benz O 350', 'Mercedes-Benz', 55, 'Aire acondicionado, asientos cómodos, pantallas'),
('KLM1234D4', 'Setra S 416 HD', 'Setra', 53, 'Aire acondicionado, WiFi, asientos de lujo, sistema de entretenimiento'),
('NOP5678E5', 'Scania N 360', 'Scania', 30, 'Asientos ergonómicos, aire acondicionado, sistema de sonido básico'),
('PQR9012F6', 'Volvo 9700H', 'Volvo', 45, 'Pantallas, WiFi, asientos cómodos, aire acondicionado'),
('STU3456G7', 'Iveco Daily 70C', 'Iveco', 18, 'Asientos ergonómicos, aire acondicionado, sistema de audio básico');
GO

GO
PRINT N'Actualización completada.';


GO
