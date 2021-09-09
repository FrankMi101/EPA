





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get user application role
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_Staff.Gender]
(@EmployeeID varchar(15))
RETURNS varchar(10)
AS 
  BEGIN
		declare @rValue varchar(10)
		select  top  1  @rValue = Gender   from [dbo].[EPA_Org_EmployeeList]  
						where Employee_ID = @EmployeeID  
 
		RETURN(@rValue)
 END

   



