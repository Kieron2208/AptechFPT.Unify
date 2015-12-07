-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: src/main/resources/config/liquibase/changelog/20151202-0833-changelog.xml
-- Ran at: 12/2/15 9:53 AM
-- Against: sa@jdbc:sqlserver://localhost\sqlexpress:1433;xopenStates=false;trustServerCertificate=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;packetSize=8000;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;databaseName=Unify;applicationName=Microsoft SQL Server JDBC Driver;
-- Liquibase version: 3.4.1
-- *********************************************************************

USE [Unify];
GO

-- Lock Database
UPDATE [DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = 'KIERONTRAN-PC (192.168.56.1)', [LOCKGRANTED] = '2015-12-02T09:53:10.455' WHERE [ID] = 1 AND [LOCKED] = 0
GO

-- Changeset src/main/resources/config/liquibase/changelog/20151202-0833-changelog.xml::1449020006425-1::Kiero (generated)
DELETE FROM [Image]
GO

DELETE FROM [AccountRole]
GO

DBCC CHECKIDENT ("Image", RESEED, 0)
GO

UPDATE [Account] SET [Password] = 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413' WHERE AccountId = 1
GO

UPDATE [Account] SET [Password] = 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413' WHERE AccountId = 2
GO

UPDATE [Account] SET [Password] = 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413' WHERE AccountId = 3
GO

UPDATE [Account] SET [Password] = '8204bbf1f3135659cd315302bec57b8cc38ac73b8c566c7cc8565f330bff195191fffa2a8e4a06480a6fd8c4f7922a8f9e2776515fbbcaf66cd152d676cad6be' WHERE AccountId = 4
GO

UPDATE [Account] SET [Password] = '6c491ddd51037361309ac6be0f792ace7356094530e0955855d10a04bb4c66fa7c80ad48d6c4ff5291cd90b9ae6aeb96c6b09c77942d3020028b75b6337f2115' WHERE AccountId = 5
GO

UPDATE [Account] SET [Password] = 'dd5d440cf9eade36a15f2936706232fa0b6310d8b250249f71e5fed5dddf9e4e5ba0a1043505cbcaeff09ae58f7c89856bddd127b626c235b85dca66f854b3b2' WHERE AccountId = 6
GO

UPDATE [Account] SET [Password] = '2804671139f59745f976206051e8502b93a4020e5efa7fb8afce09378aa15307cd1305dcc0a38f8f4a13a860cc40bd70c7a80f33396139abdc87886ef040e604' WHERE AccountId = 7
GO

UPDATE [Account] SET [Password] = '13b2a5b6fc5d8ab99733f3d299be8024cf314056e31e479171236fd1db854e10f8c998ef05a96fc64f75a02178e0b999d1582cc96e6a11ab8359676fcc7d8993' WHERE AccountId = 8
GO

UPDATE [Account] SET [Password] = '47ee6421f2e4743d594f26bd7d216597b41af46c7a9f8169582994e81b1bd3b0045063011e3c6435026c4497119eaf6acb61224218deeee46334e8ce2e9c83ea' WHERE AccountId = 9
GO

UPDATE [Account] SET [Password] = 'f264bd95983a9667010a696836a8166cf30e39f690fbb3473f8283a5f00cc827c4ac4e4d176779204b6c9ad03a4f491d5bb31e2bfa1106174f489fbe48cdfbe4' WHERE AccountId = 10
GO

ALTER TABLE [Account] ADD CreatedDate DATETIME NOT NULL DEFAULT (GETDATE())
GO

UPDATE Account SET Account.CreatedDate = CAST(Account.ModifiedDate AS DATETIME)
GO

ALTER TABLE Account DROP CONSTRAINT DF_Account_ModifiedDate
GO

ALTER TABLE Account DROP COLUMN ModifiedDate 
GO

ALTER TABLE [FeedBack] DROP CONSTRAINT [FK_FEEDBACK_PRODUCT]
GO

ALTER TABLE [FeedBack] DROP COLUMN [ProductId]
GO

ALTER TABLE [AccountRole] DROP CONSTRAINT [FK_ACCOUNTROLE_ACCOUNT]
GO

ALTER TABLE [AccountRole] DROP CONSTRAINT [UC_AccountId_Role]
GO

DROP TABLE [AccountRole]
GO

CREATE TABLE [AccountRole] ([Email] [varchar](100) NOT NULL, [Role] [varchar](20) NOT NULL)
GO

ALTER TABLE [AccountRole] ADD CONSTRAINT UC_Email_Role UNIQUE ([Email], [Role])
GO

INSERT INTO [AccountRole] ([Email], [Role]) VALUES ('admin@yourstore.com', 'ADMINISTRATOR'),('admin@yourstore.com', 'SALEPERSON'),('admin@yourstore.com', 'USER'),('kieron2208@gmail.com', 'SALEPERSON'),('kieron2208@gmail.com', 'USER'),('user@gmail.com', 'USER'),('aramos1@google.de', 'USER'),('kclark2@microsoft.com', 'USER'),('cwagner3@hud.gov', 'USER'),('vjacobs4@xing.com', 'USER'),('martinez5@barnesandnoble.com', 'USER'),('sdixon6@google.co.jp', 'USER'),('creed7@people.com.cn', 'USER');
GO

INSERT INTO [Image] ([ProductId], [ImagePath], [DisplayOrder]) VALUES ('1', 'img/product/Tshirt01.jpg', '1'),('2', 'img/product/Tshirt02.jpg', '1'),('3', 'img/product/Tshirt03.jpg', '1'),('4', 'img/product/Tshirt04 .jpg', '1'),('5', 'img/product/Tshirt05.jpg', '1'),('6', 'img/product/Shirt01.jpg', '1'),('7', 'img/product/Shirt02.jpg', '1'),('8', 'img/product/Shirt03.jpg', '1'),('9', 'img/product/Shirt04.jpg', '1'),('10', 'img/product/Shirt05.jpg', '1'),('11', 'img/product/Kaki01.jpg', '1'),('12', 'img/product/Kaki02.jpg', '1'),('13', 'img/product/Kaki03.jpg', '1'),('14', 'img/product/Kaki04.jpg', '1'),('15', 'img/product/Kaki05.jpg', '1'),('16', 'img/product/Jeans01.jpg', '1'),('17', 'img/product/Jeans02.jpg', '1'),('18', 'img/product/Jeans03.jpg', '1'),('19', 'img/product/Jeans04.jpg', '1'),('20', 'img/product/Jeans05.jpg', '1'),('21', 'img/product/Dress01.jpg', '1'),('22', 'img/product/Dress02.jpg', '1'),('23', 'img/product/Dress03.jpg', '1'),('24', 'img/product/Dress04.png', '1'),('25', 'img/product/Dress05.jpg', '1'),('26', 'img/product/Skirt01.jpg', '1'),('27', 'img/product/Skirt02.jpg', '1'),('28', 'img/product/Skirt03.jpg', '1'),('29', 'img/product/Skirt04.jpg', '1'),('30', 'img/product/Skirt05.jpg', '1'),('31', 'img/product/Tie01.jpg', '1'),('32', 'img/product/Tie02.jpg', '1'),('33', 'img/product/Tie03.jpg', '1'),('34', 'img/product/Tie04.jpg', '1'),('35', 'img/product/Tie05.jpg', '1'),('36', 'img/product/Belt01.jpg', '1'),('37', 'img/product/Belt02.jpg', '1'),('38', 'img/product/Belt03.jpg', '1'),('39', 'img/product/Belt04.jpg', '1'),('40', 'img/product/Belt05.jpg', '1'),('41', 'img/product/Glasses01.jpeg', '1'),('42', 'img/product/Glasses02.jpg', '1'),('43', 'img/product/Glasses03.jpeg', '1'),('44', 'img/product/Glasses04.jpg', '1'),('45', 'img/product/Glasses05.jpg', '1'),('46', 'img/product/Shoes01.jpg', '1'),('47', 'img/product/Shoes02.jpg', '1'),('48', 'img/product/Shoes03.jpg', '1'),('49', 'img/product/Shoes04.jpg', '1'),('50', 'img/product/Shoes05.jpg', '1');
INSERT INTO [Image] ([ProductId], [ImagePath], [DisplayOrder]) VALUES ('51', 'img/product/Bag01.jpg', '1'),('52', 'img/product/Bag02.jpg', '1'),('53', 'img/product/Bag03.jpg', '1'),('54', 'img/product/Bag04.jpg', '1'),('55', 'img/product/Bag05.jpg', '1');
GO

UPDATE [Product] SET [Product].[UnitPrice] = [PriceHistory].[Price] FROM [Product] JOIN [PriceHistory] ON [Product].[ProductId] = [PriceHistory].[ProductId]
GO

INSERT INTO [DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE]) VALUES ('1449020006425-1', 'Kiero (generated)', 'src/main/resources/config/liquibase/changelog/20151202-0833-changelog.xml', GETDATE(), 4, '7:eaddad8c32af7cce154cf85663528980', 'delete (x3), sql, loadUpdateData, dropForeignKeyConstraint, dropColumn, dropAllForeignKeyConstraints, dropUniqueConstraint, dropTable, createTable, addUniqueConstraint, loadData (x3)', '', 'EXECUTED', NULL, NULL, '3.4.1')
GO

-- Release Database Lock
UPDATE [DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1
GO

