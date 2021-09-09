






-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 27, 2018 
-- Description:	get employee name by ID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getUserEmailbyID]
(@UserID varchar(20))
RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50)

		select top 1  @rValue = eMail  from dbo.EPA_Org_EmployeeList where UserID = @UserID
  
		RETURN(isnull(@rValue,''))
 END

  




