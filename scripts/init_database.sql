/*
============================================================
Create Database and Schemas
============================================================
script purpose:
This script create a new DB named 'DataWarehouse' after checking if it already exists.
If the dataset exists, it is dropped and recreated. Additionally, the script sets up three
schemas within the database: 'bronze','silver', 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted.Proceed with caution and ensure you have proper
backups before running this script.
*/

USE master;
GO
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
--Forces the database into single-user mode, meaning only one connection is allowed.
--WITH ROLLBACK IMMEDIATE kicks out any other users/sessions and rolls back their open transactions.
--This is necessary because you can’t drop a database if it’s in use.
BEGIN
  ALTER DATABASE DataWarehouse SET SINGEL_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
-- Create DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO
--create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
