BEGIN TRANSACTION;

BEGIN TRY

DELETE FROM [Unify].[dbo].[AccountRole] WHERE Email = (SELECT [Email] from [Unify].[dbo].[AccountRole] EXCEPT SELECT [Email] from [Unify].[dbo].[Account]);

INSERT INTO [Unify].[dbo].[AccountRole] (Email, Role) SELECT [Email],'USER' AS [Role] FROM [Unify].[dbo].[AccountRole] WHERE EMAIL = (SELECT [Email] from [Unify].[dbo].[Account] EXCEPT SELECT [Email] from [Unify].[dbo].[AccountRole]);

ALTER TABLE [Unify].[dbo].[AccountRole] ADD CONSTRAINT FK_EMAIL_ACCOUNT FOREIGN KEY (Email) REFERENCES [Unify].[dbo].[Account] (Email);

UPDATE [Unify].[dbo].[PurchaseOrder] SET [SubTotal] = [SubTotal] * 1.12 WHERE [PurchaseOrderId] < 200;

END TRY
BEGIN CATCH
    SELECT 
	ERROR_NUMBER() AS ErrorNumber ,
    ERROR_SEVERITY() AS ErrorSeverity ,
    ERROR_STATE() AS ErrorState ,
    ERROR_PROCEDURE() AS ErrorProcedure ,
    ERROR_LINE() AS ErrorLine ,
    ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO
