

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 4, 2018 
-- Description:	get employee ID  or User ID 
-- ================================================================================== 

CREATE FUNCTION [dbo].[Frank_Azure_Information]
(@checkID varchar(20)
)
RETURNS varchar(20)
AS 
  BEGIN
 	 declare @appsUsers varchar(100),@appsAdmin varchar(200)

	 set @appsUsers ='Data Source=tcp:epa.database.windows.net,1433;Initial Catalog=EPA;User ID=appsUsers;PWD=apps!@#$%Users;Application Name=EPA"'
	 set @appsAdmin ='Data Source=tcp:epa.database.windows.net,1433;Initial Catalog=EPA;User ID=appsUsers;PWD=apps!@#$%Admin;Application Name=EPA"'
     

	 RETURN(@appsUsers)
 END

   
