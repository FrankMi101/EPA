







-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get employee name by ID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getUserNamebyID]
(@checkID varchar(20))
RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(20)
		if len(@checkID) < 1
		    set @rValue = ''
		else if ascii(left(ltrim(@checkID),1)) < 65 
		   begin
				if exists (select * from dbo.EPA_Org_EmployeeList where Employee_ID = @checkID)
	     
	 				 set @rValue = ( select top 1  FullName from dbo.EPA_Org_EmployeeList where Employee_ID = @checkID) 
				  else
	  				  set @rValue = ''
		  
		   end
		else
		   begin
				if exists (select * from dbo.EPA_Org_EmployeeList where UserID = @checkID)
	     
	 				 set @rValue = ( select top 1  FullName from dbo.EPA_Org_EmployeeList where UserID = @checkID) 
				  else
	  				  set @rValue = ''
		  
		   end 

  
		RETURN(@rValue)
 END

  



