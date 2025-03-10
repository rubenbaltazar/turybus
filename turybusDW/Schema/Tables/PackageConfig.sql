CREATE TABLE PackageConfig (
    [PackageID] INT IDENTITY(1,1) PRIMARY KEY,
    [TableName] [varchar](50) NOT NULL,
	[LastRowVersion] [bigint] NULL
);
