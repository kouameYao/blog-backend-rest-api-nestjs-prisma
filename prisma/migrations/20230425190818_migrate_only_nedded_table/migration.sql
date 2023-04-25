/*
  Warnings:

  - You are about to drop the `Concepte` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ConceptSite` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Encours` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Encours_Detail` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Encours_pivot` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Exercice` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Gerer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Login` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PerConce` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Periode` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Plafond` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Plafond_pivot` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Rayconce` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Rayon` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Reception` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Reception_Detail` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Reception_pivot` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Site` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Stock` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Stock_Detail` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Stock_pivot` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StockPrevu` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StockPrevu_pivot` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `sysdiagrams` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Trader` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Usertype` table. If the table is not empty, all the data it contains will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[ConceptSite] DROP CONSTRAINT [FK_ConceptSite_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[ConceptSite] DROP CONSTRAINT [FK_ConceptSite_Site];

-- DropForeignKey
ALTER TABLE [dbo].[Encours] DROP CONSTRAINT [FK_Encours_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Encours] DROP CONSTRAINT [FK_Encours_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Encours] DROP CONSTRAINT [FK_Encours_Site];

-- DropForeignKey
ALTER TABLE [dbo].[Encours_pivot] DROP CONSTRAINT [FK_Encours_pivot_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Encours_pivot] DROP CONSTRAINT [FK_Encours_pivot_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Gerer] DROP CONSTRAINT [FK_Gerer_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Gerer] DROP CONSTRAINT [FK_Gerer_Trader];

-- DropForeignKey
ALTER TABLE [dbo].[Login] DROP CONSTRAINT [FK_Login_Users];

-- DropForeignKey
ALTER TABLE [dbo].[Plafond] DROP CONSTRAINT [FK_Plafond_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Plafond] DROP CONSTRAINT [FK_Plafond_Periode];

-- DropForeignKey
ALTER TABLE [dbo].[Plafond] DROP CONSTRAINT [FK_Plafond_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Plafond_pivot] DROP CONSTRAINT [FK_Plafond_pivot_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Plafond_pivot] DROP CONSTRAINT [FK_Plafond_pivot_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Rayconce] DROP CONSTRAINT [FK_Rayconce_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Rayconce] DROP CONSTRAINT [FK_Rayconce_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Reception] DROP CONSTRAINT [FK_Reception_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Reception_pivot] DROP CONSTRAINT [FK_Reception_pivot_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Reception_pivot] DROP CONSTRAINT [FK_Reception_pivot_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Site] DROP CONSTRAINT [FK_Site_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [FK_Stock_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [FK_Stock_Site];

-- DropForeignKey
ALTER TABLE [dbo].[Stock_pivot] DROP CONSTRAINT [FK_Stock_pivot_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[Stock_pivot] DROP CONSTRAINT [FK_Stock_pivot_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[StockPrevu_pivot] DROP CONSTRAINT [FK_StockPrevu_pivot_Concepte];

-- DropForeignKey
ALTER TABLE [dbo].[StockPrevu_pivot] DROP CONSTRAINT [FK_StockPrevu_pivot_Rayon];

-- DropForeignKey
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Usertype];

-- DropTable
DROP TABLE [dbo].[Concepte];

-- DropTable
DROP TABLE [dbo].[ConceptSite];

-- DropTable
DROP TABLE [dbo].[Encours];

-- DropTable
DROP TABLE [dbo].[Encours_Detail];

-- DropTable
DROP TABLE [dbo].[Encours_pivot];

-- DropTable
DROP TABLE [dbo].[Exercice];

-- DropTable
DROP TABLE [dbo].[Gerer];

-- DropTable
DROP TABLE [dbo].[Login];

-- DropTable
DROP TABLE [dbo].[PerConce];

-- DropTable
DROP TABLE [dbo].[Periode];

-- DropTable
DROP TABLE [dbo].[Plafond];

-- DropTable
DROP TABLE [dbo].[Plafond_pivot];

-- DropTable
DROP TABLE [dbo].[Rayconce];

-- DropTable
DROP TABLE [dbo].[Rayon];

-- DropTable
DROP TABLE [dbo].[Reception];

-- DropTable
DROP TABLE [dbo].[Reception_Detail];

-- DropTable
DROP TABLE [dbo].[Reception_pivot];

-- DropTable
DROP TABLE [dbo].[Site];

-- DropTable
DROP TABLE [dbo].[Stock];

-- DropTable
DROP TABLE [dbo].[Stock_Detail];

-- DropTable
DROP TABLE [dbo].[Stock_pivot];

-- DropTable
DROP TABLE [dbo].[StockPrevu];

-- DropTable
DROP TABLE [dbo].[StockPrevu_pivot];

-- DropTable
DROP TABLE [dbo].[sysdiagrams];

-- DropTable
DROP TABLE [dbo].[Trader];

-- DropTable
DROP TABLE [dbo].[Users];

-- DropTable
DROP TABLE [dbo].[Usertype];

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
