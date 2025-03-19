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
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_ac__6E01572D];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_au__6EF57B66];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_co__6FE99F9F];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_fe__70DDC3D8];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_lu__71D1E811];


GO
PRINT N'Quitando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] DROP CONSTRAINT [FK__Hechos_Vi__sk_ru__72C60C4A];


GO
PRINT N'Iniciando recompilación de la tabla [hechos].[Hechos_Viajes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [hechos].[tmp_ms_xx_Hechos_Viajes] (
    [id_viaje]          INT             IDENTITY (1, 1) NOT NULL,
    [sk_ruta]           INT             NULL,
    [sk_fecha]          INT             NULL,
    [sk_autobus]        INT             NULL,
    [sk_conductor]      INT             NULL,
    [sk_lugar]          INT             NULL,
    [sk_actividad]      INT             NULL,
    [sk_viajero]        INT             NULL,
    [cantidad_viajeros] INT             NULL,
    [ingresos_totales]  DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([id_viaje] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [hechos].[Hechos_Viajes])
    BEGIN
        SET IDENTITY_INSERT [hechos].[tmp_ms_xx_Hechos_Viajes] ON;
        INSERT INTO [hechos].[tmp_ms_xx_Hechos_Viajes] ([id_viaje], [sk_ruta], [sk_fecha], [sk_autobus], [sk_conductor], [sk_lugar], [sk_actividad], [cantidad_viajeros], [ingresos_totales])
        SELECT   [id_viaje],
                 [sk_ruta],
                 [sk_fecha],
                 [sk_autobus],
                 [sk_conductor],
                 [sk_lugar],
                 [sk_actividad],
                 [cantidad_viajeros],
                 [ingresos_totales]
        FROM     [hechos].[Hechos_Viajes]
        ORDER BY [id_viaje] ASC;
        SET IDENTITY_INSERT [hechos].[tmp_ms_xx_Hechos_Viajes] OFF;
    END

DROP TABLE [hechos].[Hechos_Viajes];

EXECUTE sp_rename N'[hechos].[tmp_ms_xx_Hechos_Viajes]', N'Hechos_Viajes';

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
PRINT N'Creando Clave externa restricción sin nombre en [hechos].[Hechos_Viajes]...';


GO
ALTER TABLE [hechos].[Hechos_Viajes] WITH NOCHECK
    ADD FOREIGN KEY ([sk_viajero]) REFERENCES [dim].[Dim_Viajero] ([sk_viajero]);


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
