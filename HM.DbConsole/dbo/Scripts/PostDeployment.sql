/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

UPDATE [dbo].[User] SET 
[Password] = '5259042001e99b7e2059c38b857c8630'

UPDATE [dbo].[User] SET Email = 'huyennm@gmail.com', User_Name = 'huyennm' WHERE ID = 1
UPDATE [dbo].[User] SET Email = 'thaond@gmail.com', User_Name = 'thaond' WHERE ID = 2
UPDATE [dbo].[User] SET Email = 'huongbka@gmail.com', User_Name = 'huongth' WHERE ID = 3