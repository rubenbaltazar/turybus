/*
Script de implementación para turybusdw

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "turybusdw"
:setvar DefaultFilePrefix "turybusdw"
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
PRINT N'Creando Esquema [dim]...';


GO
CREATE SCHEMA [dim]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Esquema [hechos]...';


GO
CREATE SCHEMA [hechos]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Tabla [dim].[Dim_Ruta]...';


GO
CREATE TABLE [dim].[Dim_Ruta] (
    [id_ruta]        INT             NOT NULL,
    [id_ruta_ak]     INT             NULL,
    [nombre_ruta]    VARCHAR (255)   NULL,
    [importe_ruta]   DECIMAL (10, 2) NULL,
    [distancia_ruta] DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([id_ruta] ASC)
);


GO
PRINT N'Creando Tabla [dim].[Dim_Fecha]...';


GO
CREATE TABLE [dim].[Dim_Fecha] (
    [id_fecha]    INT          NOT NULL,
    [id_fecha_ak] INT          NULL,
    [fecha]       DATE         NULL,
    [dia]         INT          NULL,
    [mes]         INT          NULL,
    [anio]        INT          NULL,
    [dia_semana]  VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([id_fecha] ASC)
);


GO
PRINT N'Creando Tabla [dim].[Dim_Autobus]...';


GO
CREATE TABLE [dim].[Dim_Autobus] (
    [id_autobus]      INT           NOT NULL,
    [id_autobus_ak]   INT           NULL,
    [matricula]       VARCHAR (20)  NULL,
    [modelo]          VARCHAR (255) NULL,
    [fabricante]      VARCHAR (255) NULL,
    [numero_plazas]   INT           NULL,
    [caracteristicas] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([id_autobus] ASC)
);


GO
PRINT N'Creando Tabla [dim].[Dim_Conductor]...';


GO
CREATE TABLE [dim].[Dim_Conductor] (
    [id_conductor]        INT          NOT NULL,
    [id_conductor_ak]     INT          NULL,
    [dni_conductor]       VARCHAR (20) NULL,
    [nombres_conductor]   VARCHAR (50) NULL,
    [apellidos_conductor] VARCHAR (50) NULL,
    [telefono_conductor]  VARCHAR (20) NULL,
    [direccion_conductor] TEXT         NULL,
    PRIMARY KEY CLUSTERED ([id_conductor] ASC)
);


GO
PRINT N'Creando Tabla [dim].[Dim_Lugar]...';


GO
CREATE TABLE [dim].[Dim_Lugar] (
    [id_lugar]     INT           NOT NULL,
    [id_lugar_ak]  INT           NULL,
    [nombre_lugar] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id_lugar] ASC)
);


GO
PRINT N'Creando Tabla [dim].[Dim_Actividad]...';


GO
CREATE TABLE [dim].[Dim_Actividad] (
    [id_actividad]          INT           NOT NULL,
    [id_actividad_ak]       INT           NULL,
    [nombre_actividad]      VARCHAR (255) NULL,
    [descripcion_actividad] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([id_actividad] ASC)
);


GO
PRINT N'Creando Tabla [hechos].[Hechos_Viajes]...';


GO
CREATE TABLE [hechos].[Hechos_Viajes] (
    [id_viaje]          INT             IDENTITY (1, 1) NOT NULL,
    [id_ruta]           INT             NULL,
    [id_fecha]          INT             NULL,
    [id_autobus]        INT             NULL,
    [id_conductor]      INT             NULL,
    [id_lugar]          INT             NULL,
    [id_actividad]      INT             NULL,
    [cantidad_viajeros] INT             NULL,
    [ingresos_totales]  DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([id_viaje] ASC)
);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([id_ruta]) REFERENCES [dim].[Dim_Ruta] ([id_ruta]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([id_fecha]) REFERENCES [dim].[Dim_Fecha] ([id_fecha]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([id_autobus]) REFERENCES [dim].[Dim_Autobus] ([id_autobus]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([id_conductor]) REFERENCES [dim].[Dim_Conductor] ([id_conductor]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([id_lugar]) REFERENCES [dim].[Dim_Lugar] ([id_lugar]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([id_actividad]) REFERENCES [dim].[Dim_Actividad] ([id_actividad]);


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
        WHERE  [parent_object_id] IN (OBJECT_ID(N'hechos.Hechos_Viajes'))
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
