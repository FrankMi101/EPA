
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 4, 2018 
-- Description:	get employee ID  or User ID 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getUserID]
(@checkID varchar(20)
)
RETURNS varchar(20)
AS 
  BEGIN
 	 declare @rValue varchar(20)
     if ascii(left(ltrim(@checkID),1)) < 65 
	     set @rValue =  (select top 1 UserID from dbo.EPA_Org_EmployeeList where Employee_ID = @checkID)
     else
	     set @rValue =  (select top 1 Employee_ID from dbo.EPA_Org_EmployeeList where UserID = @checkID)
	 RETURN(@rValue)
 END

   
