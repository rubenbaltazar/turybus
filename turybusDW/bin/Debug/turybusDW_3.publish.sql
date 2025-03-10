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
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_ac__5535A963];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_au__52593CB8];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_co__534D60F1];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_fe__5165187F];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_lu__5441852A];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_ru__5070F446];


GO
PRINT N'Iniciando recompilación de la tabla [dim].[Dim_Actividad]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dim].[tmp_ms_xx_Dim_Actividad] (
    [sk_actividad]          INT           IDENTITY (1, 1) NOT NULL,
    [id_actividad]          INT           NULL,
    [nombre_actividad]      VARCHAR (255) NULL,
    [descripcion_actividad] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([sk_actividad] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dim].[Dim_Actividad])
    BEGIN
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Actividad] ON;
        INSERT INTO [dim].[tmp_ms_xx_Dim_Actividad] ([sk_actividad], [id_actividad], [nombre_actividad], [descripcion_actividad])
        SELECT   [sk_actividad],
                 [id_actividad],
                 [nombre_actividad],
                 [descripcion_actividad]
        FROM     [dim].[Dim_Actividad]
        ORDER BY [sk_actividad] ASC;
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Actividad] OFF;
    END

DROP TABLE [dim].[Dim_Actividad];

EXECUTE sp_rename N'[dim].[tmp_ms_xx_Dim_Actividad]', N'Dim_Actividad';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dim].[Dim_Autobus]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dim].[tmp_ms_xx_Dim_Autobus] (
    [sk_autobus]      INT           IDENTITY (1, 1) NOT NULL,
    [id_autobus]      INT           NULL,
    [matricula]       VARCHAR (20)  NULL,
    [modelo]          VARCHAR (255) NULL,
    [fabricante]      VARCHAR (255) NULL,
    [numero_plazas]   INT           NULL,
    [caracteristicas] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([sk_autobus] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dim].[Dim_Autobus])
    BEGIN
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Autobus] ON;
        INSERT INTO [dim].[tmp_ms_xx_Dim_Autobus] ([sk_autobus], [id_autobus], [matricula], [modelo], [fabricante], [numero_plazas], [caracteristicas])
        SELECT   [sk_autobus],
                 [id_autobus],
                 [matricula],
                 [modelo],
                 [fabricante],
                 [numero_plazas],
                 [caracteristicas]
        FROM     [dim].[Dim_Autobus]
        ORDER BY [sk_autobus] ASC;
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Autobus] OFF;
    END

DROP TABLE [dim].[Dim_Autobus];

EXECUTE sp_rename N'[dim].[tmp_ms_xx_Dim_Autobus]', N'Dim_Autobus';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dim].[Dim_Conductor]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dim].[tmp_ms_xx_Dim_Conductor] (
    [sk_conductor]        INT          IDENTITY (1, 1) NOT NULL,
    [id_conductor]        INT          NULL,
    [dni_conductor]       VARCHAR (20) NULL,
    [nombres_conductor]   VARCHAR (50) NULL,
    [apellidos_conductor] VARCHAR (50) NULL,
    [telefono_conductor]  VARCHAR (20) NULL,
    [direccion_conductor] TEXT         NULL,
    PRIMARY KEY CLUSTERED ([sk_conductor] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dim].[Dim_Conductor])
    BEGIN
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Conductor] ON;
        INSERT INTO [dim].[tmp_ms_xx_Dim_Conductor] ([sk_conductor], [id_conductor], [dni_conductor], [nombres_conductor], [apellidos_conductor], [telefono_conductor], [direccion_conductor])
        SELECT   [sk_conductor],
                 [id_conductor],
                 [dni_conductor],
                 [nombres_conductor],
                 [apellidos_conductor],
                 [telefono_conductor],
                 [direccion_conductor]
        FROM     [dim].[Dim_Conductor]
        ORDER BY [sk_conductor] ASC;
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Conductor] OFF;
    END

DROP TABLE [dim].[Dim_Conductor];

EXECUTE sp_rename N'[dim].[tmp_ms_xx_Dim_Conductor]', N'Dim_Conductor';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dim].[Dim_Fecha]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dim].[tmp_ms_xx_Dim_Fecha] (
    [sk_fecha]   INT          IDENTITY (1, 1) NOT NULL,
    [id_fecha]   INT          NULL,
    [fecha]      DATE         NULL,
    [dia]        INT          NULL,
    [mes]        INT          NULL,
    [anio]       INT          NULL,
    [dia_semana] VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([sk_fecha] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dim].[Dim_Fecha])
    BEGIN
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Fecha] ON;
        INSERT INTO [dim].[tmp_ms_xx_Dim_Fecha] ([sk_fecha], [id_fecha], [fecha], [dia], [mes], [anio], [dia_semana])
        SELECT   [sk_fecha],
                 [id_fecha],
                 [fecha],
                 [dia],
                 [mes],
                 [anio],
                 [dia_semana]
        FROM     [dim].[Dim_Fecha]
        ORDER BY [sk_fecha] ASC;
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Fecha] OFF;
    END

DROP TABLE [dim].[Dim_Fecha];

EXECUTE sp_rename N'[dim].[tmp_ms_xx_Dim_Fecha]', N'Dim_Fecha';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dim].[Dim_Lugar]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dim].[tmp_ms_xx_Dim_Lugar] (
    [sk_lugar]     INT           IDENTITY (1, 1) NOT NULL,
    [id_lugar]     INT           NULL,
    [nombre_lugar] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([sk_lugar] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dim].[Dim_Lugar])
    BEGIN
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Lugar] ON;
        INSERT INTO [dim].[tmp_ms_xx_Dim_Lugar] ([sk_lugar], [id_lugar], [nombre_lugar])
        SELECT   [sk_lugar],
                 [id_lugar],
                 [nombre_lugar]
        FROM     [dim].[Dim_Lugar]
        ORDER BY [sk_lugar] ASC;
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Lugar] OFF;
    END

DROP TABLE [dim].[Dim_Lugar];

EXECUTE sp_rename N'[dim].[tmp_ms_xx_Dim_Lugar]', N'Dim_Lugar';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dim].[Dim_Ruta]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dim].[tmp_ms_xx_Dim_Ruta] (
    [sk_ruta]        INT             IDENTITY (1, 1) NOT NULL,
    [id_ruta]        INT             NULL,
    [nombre_ruta]    VARCHAR (255)   NULL,
    [importe_ruta]   DECIMAL (10, 2) NULL,
    [distancia_ruta] DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([sk_ruta] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dim].[Dim_Ruta])
    BEGIN
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Ruta] ON;
        INSERT INTO [dim].[tmp_ms_xx_Dim_Ruta] ([sk_ruta], [id_ruta], [nombre_ruta], [importe_ruta], [distancia_ruta])
        SELECT   [sk_ruta],
                 [id_ruta],
                 [nombre_ruta],
                 [importe_ruta],
                 [distancia_ruta]
        FROM     [dim].[Dim_Ruta]
        ORDER BY [sk_ruta] ASC;
        SET IDENTITY_INSERT [dim].[tmp_ms_xx_Dim_Ruta] OFF;
    END

DROP TABLE [dim].[Dim_Ruta];

EXECUTE sp_rename N'[dim].[tmp_ms_xx_Dim_Ruta]', N'Dim_Ruta';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Actividad]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Actividad] (
    [sk_actividad]          INT           IDENTITY (1, 1) NOT NULL,
    [nombre_actividad]      VARCHAR (255) NULL,
    [descripcion_actividad] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([sk_actividad] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Actividad])
    BEGIN
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Actividad] ON;
        INSERT INTO [staging].[tmp_ms_xx_Actividad] ([sk_actividad], [nombre_actividad], [descripcion_actividad])
        SELECT   [sk_actividad],
                 [nombre_actividad],
                 [descripcion_actividad]
        FROM     [staging].[Actividad]
        ORDER BY [sk_actividad] ASC;
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Actividad] OFF;
    END

DROP TABLE [staging].[Actividad];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Actividad]', N'Actividad';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Autobus]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Autobus] (
    [sk_autobus]      INT           IDENTITY (1, 1) NOT NULL,
    [matricula]       VARCHAR (20)  NULL,
    [modelo]          VARCHAR (255) NULL,
    [fabricante]      VARCHAR (255) NULL,
    [numero_plazas]   INT           NULL,
    [caracteristicas] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([sk_autobus] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Autobus])
    BEGIN
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Autobus] ON;
        INSERT INTO [staging].[tmp_ms_xx_Autobus] ([sk_autobus], [matricula], [modelo], [fabricante], [numero_plazas], [caracteristicas])
        SELECT   [sk_autobus],
                 [matricula],
                 [modelo],
                 [fabricante],
                 [numero_plazas],
                 [caracteristicas]
        FROM     [staging].[Autobus]
        ORDER BY [sk_autobus] ASC;
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Autobus] OFF;
    END

DROP TABLE [staging].[Autobus];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Autobus]', N'Autobus';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Conductor]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Conductor] (
    [sk_conductor]        INT          IDENTITY (1, 1) NOT NULL,
    [dni_conductor]       VARCHAR (20) NULL,
    [nombres_conductor]   VARCHAR (50) NULL,
    [apellidos_conductor] VARCHAR (50) NULL,
    [telefono_conductor]  VARCHAR (20) NULL,
    [direccion_conductor] TEXT         NULL,
    PRIMARY KEY CLUSTERED ([sk_conductor] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Conductor])
    BEGIN
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Conductor] ON;
        INSERT INTO [staging].[tmp_ms_xx_Conductor] ([sk_conductor], [dni_conductor], [nombres_conductor], [apellidos_conductor], [telefono_conductor], [direccion_conductor])
        SELECT   [sk_conductor],
                 [dni_conductor],
                 [nombres_conductor],
                 [apellidos_conductor],
                 [telefono_conductor],
                 [direccion_conductor]
        FROM     [staging].[Conductor]
        ORDER BY [sk_conductor] ASC;
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Conductor] OFF;
    END

DROP TABLE [staging].[Conductor];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Conductor]', N'Conductor';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Lugar]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Lugar] (
    [sk_lugar]     INT           IDENTITY (1, 1) NOT NULL,
    [nombre_lugar] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([sk_lugar] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Lugar])
    BEGIN
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Lugar] ON;
        INSERT INTO [staging].[tmp_ms_xx_Lugar] ([sk_lugar], [nombre_lugar])
        SELECT   [sk_lugar],
                 [nombre_lugar]
        FROM     [staging].[Lugar]
        ORDER BY [sk_lugar] ASC;
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Lugar] OFF;
    END

DROP TABLE [staging].[Lugar];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Lugar]', N'Lugar';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [staging].[Ruta]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [staging].[tmp_ms_xx_Ruta] (
    [sk_ruta]        INT             IDENTITY (1, 1) NOT NULL,
    [nombre_ruta]    VARCHAR (255)   NULL,
    [importe_ruta]   DECIMAL (10, 2) NULL,
    [distancia_ruta] DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([sk_ruta] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [staging].[Ruta])
    BEGIN
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Ruta] ON;
        INSERT INTO [staging].[tmp_ms_xx_Ruta] ([sk_ruta], [nombre_ruta], [importe_ruta], [distancia_ruta])
        SELECT   [sk_ruta],
                 [nombre_ruta],
                 [importe_ruta],
                 [distancia_ruta]
        FROM     [staging].[Ruta]
        ORDER BY [sk_ruta] ASC;
        SET IDENTITY_INSERT [staging].[tmp_ms_xx_Ruta] OFF;
    END

DROP TABLE [staging].[Ruta];

EXECUTE sp_rename N'[staging].[tmp_ms_xx_Ruta]', N'Ruta';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([sk_actividad]) REFERENCES [dim].[Dim_Actividad] ([sk_actividad]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([sk_autobus]) REFERENCES [dim].[Dim_Autobus] ([sk_autobus]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([sk_conductor]) REFERENCES [dim].[Dim_Conductor] ([sk_conductor]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([sk_fecha]) REFERENCES [dim].[Dim_Fecha] ([sk_fecha]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([sk_lugar]) REFERENCES [dim].[Dim_Lugar] ([sk_lugar]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([sk_ruta]) REFERENCES [dim].[Dim_Ruta] ([sk_ruta]);


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
