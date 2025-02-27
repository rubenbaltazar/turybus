/*
Script de implementación para turybus

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybus"
:setvar DefaultFilePrefix "turybus"
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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creando Esquema [mantenimiento]...';


GO
CREATE SCHEMA [mantenimiento]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Esquema [produccion]...';


GO
CREATE SCHEMA [produccion]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Esquema [ventas]...';


GO
CREATE SCHEMA [ventas]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Tabla [mantenimiento].[Reparacion]...';


GO
CREATE TABLE [mantenimiento].[Reparacion] (
    [id_reparacion]     INT  IDENTITY (1, 1) NOT NULL,
    [nombre_reparacion] TEXT NULL,
    PRIMARY KEY CLUSTERED ([id_reparacion] ASC)
);


GO
PRINT N'Creando Tabla [mantenimiento].[Autobus]...';


GO
CREATE TABLE [mantenimiento].[Autobus] (
    [id_autobus]      INT           IDENTITY (1, 1) NOT NULL,
    [matricula]       VARCHAR (20)  NOT NULL,
    [modelo]          VARCHAR (255) NOT NULL,
    [fabricante]      VARCHAR (255) NOT NULL,
    [numero_plazas]   INT           NOT NULL,
    [caracteristicas] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([id_autobus] ASC),
    UNIQUE NONCLUSTERED ([matricula] ASC)
);


GO
PRINT N'Creando Tabla [mantenimiento].[Revision]...';


GO
CREATE TABLE [mantenimiento].[Revision] (
    [id_revision]     INT  IDENTITY (1, 1) NOT NULL,
    [id_autobus]      INT  NOT NULL,
    [id_reparacion]   INT  NOT NULL,
    [fecha_revision]  DATE NOT NULL,
    [tiempo_revision] INT  NOT NULL,
    [diagnostico]     TEXT NULL,
    PRIMARY KEY CLUSTERED ([id_revision] ASC)
);


GO
PRINT N'Creando Tabla [produccion].[Ruta]...';


GO
CREATE TABLE [produccion].[Ruta] (
    [id_ruta]        INT             IDENTITY (1, 1) NOT NULL,
    [nombre_ruta]    VARCHAR (255)   NOT NULL,
    [importe_ruta]   DECIMAL (10, 2) NOT NULL,
    [distancia_ruta] DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_ruta] ASC)
);


GO
PRINT N'Creando Tabla [produccion].[Conductor]...';


GO
CREATE TABLE [produccion].[Conductor] (
    [id_conductor]        INT          IDENTITY (1, 1) NOT NULL,
    [dni_conductor]       VARCHAR (20) NOT NULL,
    [nombres_conductor]   VARCHAR (50) NOT NULL,
    [apellidos_conductor] VARCHAR (50) NOT NULL,
    [telefono_conductor]  VARCHAR (20) NULL,
    [direccion_conductor] TEXT         NULL,
    PRIMARY KEY CLUSTERED ([id_conductor] ASC),
    UNIQUE NONCLUSTERED ([dni_conductor] ASC)
);


GO
PRINT N'Creando Tabla [produccion].[Lugar]...';


GO
CREATE TABLE [produccion].[Lugar] (
    [id_lugar]     INT           IDENTITY (1, 1) NOT NULL,
    [nombre_lugar] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_lugar] ASC)
);


GO
PRINT N'Creando Tabla [produccion].[Actividad]...';


GO
CREATE TABLE [produccion].[Actividad] (
    [id_actividad]          INT           IDENTITY (1, 1) NOT NULL,
    [nombre_actividad]      VARCHAR (255) NOT NULL,
    [descripcion_actividad] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([id_actividad] ASC)
);


GO
PRINT N'Creando Tabla [produccion].[Servicio_Diario]...';


GO
CREATE TABLE [produccion].[Servicio_Diario] (
    [id_servicio]          INT      IDENTITY (1, 1) NOT NULL,
    [id_ruta]              INT      NOT NULL,
    [fecha_servicio]       DATE     NOT NULL,
    [hora_salida]          TIME (7) NOT NULL,
    [hora_llegada]         TIME (7) NOT NULL,
    [descripcion_servicio] TEXT     NULL,
    [id_conductor]         INT      NOT NULL,
    [id_autobus]           INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([id_servicio] ASC)
);


GO
PRINT N'Creando Tabla [produccion].[Lugar_Interes]...';


GO
CREATE TABLE [produccion].[Lugar_Interes] (
    [id_lugar_interes] INT             IDENTITY (1, 1) NOT NULL,
    [id_servicio]      INT             NOT NULL,
    [id_lugar]         INT             NOT NULL,
    [id_actividad]     INT             NULL,
    [hora_prevista]    TIME (7)        NOT NULL,
    [tiempo_parada]    INT             NULL,
    [distancia_lugar]  DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_lugar_interes] ASC)
);


GO
PRINT N'Creando Tabla [ventas].[Viajero]...';


GO
CREATE TABLE [ventas].[Viajero] (
    [id_viajero]        INT          IDENTITY (1, 1) NOT NULL,
    [dni_viajero]       VARCHAR (20) NOT NULL,
    [nombres_viajero]   VARCHAR (50) NOT NULL,
    [apellidos_viajero] VARCHAR (50) NOT NULL,
    [telefono_viajero]  VARCHAR (20) NULL,
    [direccion_viajero] VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([id_viajero] ASC),
    UNIQUE NONCLUSTERED ([dni_viajero] ASC)
);


GO
PRINT N'Creando Tabla [ventas].[Billete]...';


GO
CREATE TABLE [ventas].[Billete] (
    [id_billete]      INT             IDENTITY (1, 1) NOT NULL,
    [id_servicio]     INT             NOT NULL,
    [id_viajero]      INT             NOT NULL,
    [fecha_billete]   DATE            NOT NULL,
    [importe_billete] DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_billete] ASC)
);


GO
PRINT N'Creando Clave externa restricción sin nombre en [mantenimiento].[Revision]...';


GO
ALTER TABLE [mantenimiento].[Revision] WITH NOCHECK
    ADD FOREIGN KEY ([id_autobus]) REFERENCES [mantenimiento].[Autobus] ([id_autobus]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [mantenimiento].[Revision]...';


GO
ALTER TABLE [mantenimiento].[Revision] WITH NOCHECK
    ADD FOREIGN KEY ([id_reparacion]) REFERENCES [mantenimiento].[Reparacion] ([id_reparacion]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [produccion].[Servicio_Diario]...';


GO
ALTER TABLE [produccion].[Servicio_Diario] WITH NOCHECK
    ADD FOREIGN KEY ([id_ruta]) REFERENCES [produccion].[Ruta] ([id_ruta]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [produccion].[Servicio_Diario]...';


GO
ALTER TABLE [produccion].[Servicio_Diario] WITH NOCHECK
    ADD FOREIGN KEY ([id_conductor]) REFERENCES [produccion].[Conductor] ([id_conductor]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [produccion].[Servicio_Diario]...';


GO
ALTER TABLE [produccion].[Servicio_Diario] WITH NOCHECK
    ADD FOREIGN KEY ([id_autobus]) REFERENCES [mantenimiento].[Autobus] ([id_autobus]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [produccion].[Lugar_Interes]...';


GO
ALTER TABLE [produccion].[Lugar_Interes] WITH NOCHECK
    ADD FOREIGN KEY ([id_servicio]) REFERENCES [produccion].[Servicio_Diario] ([id_servicio]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [produccion].[Lugar_Interes]...';


GO
ALTER TABLE [produccion].[Lugar_Interes] WITH NOCHECK
    ADD FOREIGN KEY ([id_lugar]) REFERENCES [produccion].[Lugar] ([id_lugar]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [produccion].[Lugar_Interes]...';


GO
ALTER TABLE [produccion].[Lugar_Interes] WITH NOCHECK
    ADD FOREIGN KEY ([id_actividad]) REFERENCES [produccion].[Actividad] ([id_actividad]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [ventas].[Billete]...';


GO
ALTER TABLE [ventas].[Billete] WITH NOCHECK
    ADD FOREIGN KEY ([id_servicio]) REFERENCES [produccion].[Servicio_Diario] ([id_servicio]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [ventas].[Billete]...';


GO
ALTER TABLE [ventas].[Billete] WITH NOCHECK
    ADD FOREIGN KEY ([id_viajero]) REFERENCES [ventas].[Viajero] ([id_viajero]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'mantenimiento.Revision'), OBJECT_ID(N'produccion.Servicio_Diario'), OBJECT_ID(N'produccion.Lugar_Interes'), OBJECT_ID(N'ventas.Billete'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Comprobando restricción:' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Error de comprobación de restricción:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'Error al comprobar las restricciones', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Actualización completada.';


GO
