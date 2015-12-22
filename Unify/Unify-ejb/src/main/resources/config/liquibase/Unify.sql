-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: src/main/resources/config/liquibase/master.xml
-- Ran at: 12/21/15 1:11 AM
-- Against: sa@jdbc:sqlserver://localhost\sqlexpress:1433;xopenStates=false;trustServerCertificate=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;packetSize=8000;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;databaseName=Unifies;applicationName=Microsoft SQL Server JDBC Driver;
-- Liquibase version: 3.4.1
-- *********************************************************************

USE [Unifies];
GO

-- Lock Database
UPDATE [DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = 'KIERONTRAN-PC (192.168.2.101)', [LOCKGRANTED] = '2015-12-21T01:11:11.061' WHERE [ID] = 1 AND [LOCKED] = 0
GO

-- Release Database Lock
UPDATE [DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1
GO

