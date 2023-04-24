BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Article] (
    [id] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [description] NVARCHAR(1000),
    [body] NVARCHAR(1000) NOT NULL,
    [published] BIT NOT NULL CONSTRAINT [Article_published_df] DEFAULT 0,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Article_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    [authorId] INT,
    CONSTRAINT [Article_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Article_title_key] UNIQUE NONCLUSTERED ([title])
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
CREATE TABLE [dbo].[Site] (
    [Cod_Sit] INT NOT NULL,
    [Lib_Sit] VARCHAR(35),
    [Cod_Con] NCHAR(2) NOT NULL,
    CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED ([Cod_Sit])
);

-- CreateTable
CREATE TABLE [dbo].[Concepte] (
    [Cod_Con] NCHAR(2) NOT NULL,
    [Lib_Con] NVARCHAR(50),
    CONSTRAINT [PK_Concepte] PRIMARY KEY CLUSTERED ([Cod_Con])
);

-- CreateTable
CREATE TABLE [dbo].[Encours] (
    [Annee] INT NOT NULL,
    [Cod_Per] INT NOT NULL,
    [Dat_Com] DATE NOT NULL,
    [Cod_Sit] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Mon_Com] DECIMAL(18,3),
    CONSTRAINT [PK_Encours] PRIMARY KEY CLUSTERED ([Dat_Com],[Cod_Sit],[Cod_Ray],[Cod_Con]),
    CONSTRAINT [Encours_Cod_Sit_key] UNIQUE NONCLUSTERED ([Cod_Sit])
);

-- CreateTable
CREATE TABLE [dbo].[Encours_Detail] (
    [Dat_Com] DATETIME NOT NULL,
    [Cod_Sit] FLOAT(53) NOT NULL,
    [Num_Com] FLOAT(53) NOT NULL,
    [Cod_Ray] FLOAT(53),
    [Lib_Ray] NVARCHAR(255),
    [Cod_Int] FLOAT(53) NOT NULL,
    [Des_Art] NVARCHAR(255),
    [Qte_Enc] FLOAT(53),
    [Pri_Ach] FLOAT(53),
    [Mon_Ach] DECIMAL(18,3) NOT NULL,
    CONSTRAINT [PK_Encours_Detail] PRIMARY KEY CLUSTERED ([Dat_Com],[Cod_Sit],[Num_Com],[Cod_Int])
);

-- CreateTable
CREATE TABLE [dbo].[Exercice] (
    [Annee] INT NOT NULL,
    CONSTRAINT [PK_Exercice] PRIMARY KEY CLUSTERED ([Annee])
);

-- CreateTable
CREATE TABLE [dbo].[Gerer] (
    [Cod_Ray] INT NOT NULL,
    [Cod_Tra] INT NOT NULL,
    CONSTRAINT [PK_Gerer] PRIMARY KEY CLUSTERED ([Cod_Ray],[Cod_Tra])
);

-- CreateTable
CREATE TABLE [dbo].[Login] (
    [ID_Use] INT NOT NULL,
    [User_Mail] VARCHAR(64) NOT NULL,
    [Password] VARCHAR(32) NOT NULL,
    CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([ID_Use])
);

-- CreateTable
CREATE TABLE [dbo].[Periode] (
    [Cod_Per] INT NOT NULL,
    [Lib_Per] NCHAR(10),
    CONSTRAINT [PK_Periode] PRIMARY KEY CLUSTERED ([Cod_Per])
);

-- CreateTable
CREATE TABLE [dbo].[Plafond] (
    [ID_Plaf] INT NOT NULL IDENTITY(1,1),
    [Annee] INT NOT NULL,
    [Cod_Per] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Mon_Pla] DECIMAL(18,2),
    CONSTRAINT [PK_Plafond] PRIMARY KEY CLUSTERED ([ID_Plaf])
);

-- CreateTable
CREATE TABLE [dbo].[Rayon] (
    [Cod_Ray] INT NOT NULL,
    [Lib_Ray] VARCHAR(50),
    CONSTRAINT [PK_Rayon] PRIMARY KEY CLUSTERED ([Cod_Ray])
);

-- CreateTable
CREATE TABLE [dbo].[Reception] (
    [Dat_Rec] DATE NOT NULL,
    [Cod_Sit] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Mon_Rec] DECIMAL(18,3),
    CONSTRAINT [PK_Reception] PRIMARY KEY CLUSTERED ([Dat_Rec],[Cod_Sit],[Cod_Ray])
);

-- CreateTable
CREATE TABLE [dbo].[Reception_Detail] (
    [Dat_Rec] DATE,
    [Cod_Sit] INT,
    [Ref_BL] NVARCHAR(30),
    [Num_BRV] NCHAR(16),
    [Num_Com] NVARCHAR(30),
    [Cod_Ray] INT,
    [Con_Int] INT,
    [Des_Art] NVARCHAR(65),
    [Qte_Rec] DECIMAL(18,3),
    [Pri_Net] DECIMAL(18,3),
    [Mon_Lig] DECIMAL(18,3)
);

-- CreateTable
CREATE TABLE [dbo].[Stock] (
    [Dat_Sto] DATE NOT NULL,
    [Cod_Sit] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Val_Sto] DECIMAL(18,3),
    CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED ([Dat_Sto],[Cod_Sit],[Cod_Ray])
);

-- CreateTable
CREATE TABLE [dbo].[Stock_Detail] (
    [Dat_Sto] DATE NOT NULL,
    [Cod_Sit] INT NOT NULL,
    [Cod_Ray] INT,
    [Cod_Int] INT NOT NULL,
    [Des_Art] NVARCHAR(65),
    [Val_PxAch] DECIMAL(18,3),
    [Qte_Sto] DECIMAL(18,3),
    [Val_Sto] DECIMAL(18,3),
    CONSTRAINT [PK_Stock_Detail] PRIMARY KEY CLUSTERED ([Dat_Sto],[Cod_Sit],[Cod_Int])
);

-- CreateTable
CREATE TABLE [dbo].[sysdiagrams] (
    [name] NVARCHAR(128) NOT NULL,
    [principal_id] INT NOT NULL,
    [diagram_id] INT NOT NULL IDENTITY(1,1),
    [version] INT,
    [definition] VARBINARY(max),
    CONSTRAINT [PK__sysdiagr__C2B05B613C5F2491] PRIMARY KEY CLUSTERED ([diagram_id]),
    CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED ([principal_id],[name])
);

-- CreateTable
CREATE TABLE [dbo].[Trader] (
    [Cod_Tra] INT NOT NULL,
    [Non_Pre] VARCHAR(50),
    CONSTRAINT [PK_Trader] PRIMARY KEY CLUSTERED ([Cod_Tra])
);

-- CreateTable
CREATE TABLE [dbo].[Users] (
    [ID_Use] INT NOT NULL,
    [Use_Nom] VARCHAR(35),
    [Use_Pre] VARCHAR(35),
    [ID_UseTyp] INT NOT NULL,
    [Use_Fon] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([ID_Use])
);

-- CreateTable
CREATE TABLE [dbo].[Usertype] (
    [ID_UseTyp] INT NOT NULL,
    [Lib_Typ] VARCHAR(35),
    CONSTRAINT [PK_Usertype] PRIMARY KEY CLUSTERED ([ID_UseTyp])
);

-- CreateTable
CREATE TABLE [dbo].[ConceptSite] (
    [ID_ConSit] INT NOT NULL IDENTITY(1,1),
    [Cod_Con] NCHAR(2) NOT NULL,
    [Cod_Sit] INT NOT NULL,
    CONSTRAINT [PK_ConceptSite] PRIMARY KEY CLUSTERED ([Cod_Con],[Cod_Sit])
);

-- CreateTable
CREATE TABLE [dbo].[Encours_pivot] (
    [Annee] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Janv] DECIMAL(18,3),
    [Fevr] DECIMAL(18,3),
    [Mars] DECIMAL(18,3),
    [Avril] DECIMAL(18,3),
    [Mai] DECIMAL(18,3),
    [Juin] DECIMAL(18,3),
    [Juil] DECIMAL(18,3),
    [aout] DECIMAL(18,3),
    [Sept] DECIMAL(18,3),
    [Octo] DECIMAL(18,3),
    [Nove] DECIMAL(18,3),
    [Dece] DECIMAL(18,3),
    CONSTRAINT [PK_Encours_pivot] PRIMARY KEY CLUSTERED ([Annee],[Cod_Ray],[Cod_Con])
);

-- CreateTable
CREATE TABLE [dbo].[PerConce] (
    [ID_PerCon] INT NOT NULL IDENTITY(1,1),
    [Cod_Per] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Annee] INT NOT NULL,
    CONSTRAINT [PK_PerConce] PRIMARY KEY CLUSTERED ([Cod_Per],[Cod_Con],[Annee])
);

-- CreateTable
CREATE TABLE [dbo].[Plafond_pivot] (
    [Annee] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Janv] DECIMAL(18,3),
    [Fevr] DECIMAL(18,3),
    [Mars] DECIMAL(18,3),
    [Avril] DECIMAL(18,3),
    [Mai] DECIMAL(18,3),
    [Juin] DECIMAL(18,3),
    [Juil] DECIMAL(18,3),
    [aout] DECIMAL(18,3),
    [Sept] DECIMAL(18,3),
    [Octo] DECIMAL(18,3),
    [Nove] DECIMAL(18,3),
    [Dece] DECIMAL(18,3),
    CONSTRAINT [PK_Plafond_pivot_1] PRIMARY KEY CLUSTERED ([Annee],[Cod_Ray],[Cod_Con])
);

-- CreateTable
CREATE TABLE [dbo].[Rayconce] (
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    CONSTRAINT [PK_Rayconce] PRIMARY KEY CLUSTERED ([Cod_Ray],[Cod_Con])
);

-- CreateTable
CREATE TABLE [dbo].[Reception_pivot] (
    [Annee] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Janv] DECIMAL(18,3),
    [Fevr] DECIMAL(18,3),
    [Mars] DECIMAL(18,3),
    [Avril] DECIMAL(18,3),
    [Mai] DECIMAL(18,3),
    [Juin] DECIMAL(18,3),
    [Juil] DECIMAL(18,3),
    [aout] DECIMAL(18,3),
    [Sept] DECIMAL(18,3),
    [Octo] DECIMAL(18,3),
    [Nove] DECIMAL(18,3),
    [Dece] DECIMAL(18,3),
    CONSTRAINT [PK_Reception_pivot] PRIMARY KEY CLUSTERED ([Annee],[Cod_Ray],[Cod_Con])
);

-- CreateTable
CREATE TABLE [dbo].[Stock_pivot] (
    [Annee] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Janv] DECIMAL(18,3),
    [Fevr] DECIMAL(18,3),
    [Mars] DECIMAL(18,3),
    [Avril] DECIMAL(18,3),
    [Mai] DECIMAL(18,3),
    [Juin] DECIMAL(18,3),
    [Juil] DECIMAL(18,3),
    [aout] DECIMAL(18,3),
    [Sept] DECIMAL(18,3),
    [Octo] DECIMAL(18,3),
    [Nove] DECIMAL(18,3),
    [Dece] DECIMAL(18,3),
    CONSTRAINT [PK_Stock_pivot] PRIMARY KEY CLUSTERED ([Annee],[Cod_Ray],[Cod_Con])
);

-- CreateTable
CREATE TABLE [dbo].[StockPrevu] (
    [ID_StkPre] INT NOT NULL IDENTITY(1,1),
    [Annee] INT NOT NULL,
    [Cod_Per] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [StkPre_Val] DECIMAL(18,3),
    CONSTRAINT [PK_StockPrevu] PRIMARY KEY CLUSTERED ([ID_StkPre])
);

-- CreateTable
CREATE TABLE [dbo].[StockPrevu_pivot] (
    [Annee] INT NOT NULL,
    [Cod_Ray] INT NOT NULL,
    [Cod_Con] NCHAR(2) NOT NULL,
    [Janv] DECIMAL(18,3),
    [Fevr] DECIMAL(18,3),
    [Mars] DECIMAL(18,3),
    [Avril] DECIMAL(18,3),
    [Mai] DECIMAL(18,3),
    [Juin] DECIMAL(18,3),
    [Juil] DECIMAL(18,3),
    [aout] DECIMAL(18,3),
    [Sept] DECIMAL(18,3),
    [Octo] DECIMAL(18,3),
    [Nove] DECIMAL(18,3),
    [Dece] DECIMAL(18,3),
    CONSTRAINT [PK_StockPrevu_pivot] PRIMARY KEY CLUSTERED ([Annee],[Cod_Ray],[Cod_Con])
);

-- AddForeignKey
ALTER TABLE [dbo].[Article] ADD CONSTRAINT [Article_authorId_fkey] FOREIGN KEY ([authorId]) REFERENCES [dbo].[User]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Site] ADD CONSTRAINT [FK_Site_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Encours] ADD CONSTRAINT [FK_Encours_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Encours] ADD CONSTRAINT [FK_Encours_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Encours] ADD CONSTRAINT [FK_Encours_Site] FOREIGN KEY ([Cod_Sit]) REFERENCES [dbo].[Site]([Cod_Sit]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Gerer] ADD CONSTRAINT [FK_Gerer_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Gerer] ADD CONSTRAINT [FK_Gerer_Trader] FOREIGN KEY ([Cod_Tra]) REFERENCES [dbo].[Trader]([Cod_Tra]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Login] ADD CONSTRAINT [FK_Login_Users] FOREIGN KEY ([ID_Use]) REFERENCES [dbo].[Users]([ID_Use]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Plafond] ADD CONSTRAINT [FK_Plafond_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Plafond] ADD CONSTRAINT [FK_Plafond_Periode] FOREIGN KEY ([Cod_Per]) REFERENCES [dbo].[Periode]([Cod_Per]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Plafond] ADD CONSTRAINT [FK_Plafond_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Reception] ADD CONSTRAINT [FK_Reception_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [FK_Stock_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [FK_Stock_Site] FOREIGN KEY ([Cod_Sit]) REFERENCES [dbo].[Site]([Cod_Sit]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [FK_Users_Usertype] FOREIGN KEY ([ID_UseTyp]) REFERENCES [dbo].[Usertype]([ID_UseTyp]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ConceptSite] ADD CONSTRAINT [FK_ConceptSite_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ConceptSite] ADD CONSTRAINT [FK_ConceptSite_Site] FOREIGN KEY ([Cod_Sit]) REFERENCES [dbo].[Site]([Cod_Sit]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Encours_pivot] ADD CONSTRAINT [FK_Encours_pivot_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Encours_pivot] ADD CONSTRAINT [FK_Encours_pivot_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Plafond_pivot] ADD CONSTRAINT [FK_Plafond_pivot_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Plafond_pivot] ADD CONSTRAINT [FK_Plafond_pivot_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Rayconce] ADD CONSTRAINT [FK_Rayconce_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Rayconce] ADD CONSTRAINT [FK_Rayconce_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Reception_pivot] ADD CONSTRAINT [FK_Reception_pivot_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Reception_pivot] ADD CONSTRAINT [FK_Reception_pivot_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Stock_pivot] ADD CONSTRAINT [FK_Stock_pivot_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Stock_pivot] ADD CONSTRAINT [FK_Stock_pivot_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[StockPrevu_pivot] ADD CONSTRAINT [FK_StockPrevu_pivot_Concepte] FOREIGN KEY ([Cod_Con]) REFERENCES [dbo].[Concepte]([Cod_Con]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[StockPrevu_pivot] ADD CONSTRAINT [FK_StockPrevu_pivot_Rayon] FOREIGN KEY ([Cod_Ray]) REFERENCES [dbo].[Rayon]([Cod_Ray]) ON DELETE NO ACTION ON UPDATE NO ACTION;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
