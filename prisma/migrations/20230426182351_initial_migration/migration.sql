BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Article] (
    [id] INT NOT NULL IDENTITY(1,1),
    [poids] INT,
    [designation] NVARCHAR(1000) NOT NULL,
    [published] BIT NOT NULL CONSTRAINT [Article_published_df] DEFAULT 1,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Article_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    [commandeId] INT,
    CONSTRAINT [Article_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Article_designation_key] UNIQUE NONCLUSTERED ([designation])
);

-- CreateTable
CREATE TABLE [dbo].[User] (
    [id] INT NOT NULL IDENTITY(1,1),
    [nom] NVARCHAR(1000),
    [prenoms] NVARCHAR(1000),
    [email] NVARCHAR(1000) NOT NULL,
    [password] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [User_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [User_email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[Truck] (
    [id] INT NOT NULL IDENTITY(1,1),
    [marque] NVARCHAR(1000),
    [poids] INT,
    [type] NVARCHAR(1000) NOT NULL,
    [matricule] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Truck_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [Truck_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Truck_matricule_key] UNIQUE NONCLUSTERED ([matricule])
);

-- CreateTable
CREATE TABLE [dbo].[Driver] (
    [id] INT NOT NULL IDENTITY(1,1),
    [nom] NVARCHAR(1000),
    [prenoms] NVARCHAR(1000),
    [cni] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Driver_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [Driver_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Driver_cni_key] UNIQUE NONCLUSTERED ([cni])
);

-- CreateTable
CREATE TABLE [dbo].[Commande] (
    [id] INT NOT NULL IDENTITY(1,1),
    [noCmd] NVARCHAR(1000) NOT NULL,
    [siteId] INT NOT NULL,
    [camionId] INT,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Commande_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [Commande_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Commande_noCmd_key] UNIQUE NONCLUSTERED ([noCmd])
);

-- CreateTable
CREATE TABLE [dbo].[Site] (
    [id] INT NOT NULL IDENTITY(1,1),
    [code] INT NOT NULL,
    [libelle] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Site_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [Site_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Site_code_key] UNIQUE NONCLUSTERED ([code])
);

-- CreateTable
CREATE TABLE [dbo].[Reception] (
    [id] INT NOT NULL IDENTITY(1,1),
    [code] NVARCHAR(1000) NOT NULL,
    [commandeId] INT NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Reception_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [Reception_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Reception_code_key] UNIQUE NONCLUSTERED ([code])
);

-- AddForeignKey
ALTER TABLE [dbo].[Article] ADD CONSTRAINT [Article_commandeId_fkey] FOREIGN KEY ([commandeId]) REFERENCES [dbo].[Commande]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Commande] ADD CONSTRAINT [Commande_siteId_fkey] FOREIGN KEY ([siteId]) REFERENCES [dbo].[Site]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Commande] ADD CONSTRAINT [Commande_camionId_fkey] FOREIGN KEY ([camionId]) REFERENCES [dbo].[Truck]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Reception] ADD CONSTRAINT [Reception_commandeId_fkey] FOREIGN KEY ([commandeId]) REFERENCES [dbo].[Commande]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
