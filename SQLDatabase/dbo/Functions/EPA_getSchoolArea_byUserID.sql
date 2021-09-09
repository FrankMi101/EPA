







 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 31, 2020 
-- Description:	get user school area by user id
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getSchoolArea_byUserID]
(
	@UserID varchar(30),
	@UserRole varchar(30)
)
RETURNS varchar(50)
AS 
  BEGIN
      if @UserRole ='Unknow' set @UserRole = [dbo].[EPA_getUserAppraisalRole](@UserID)
		declare @rValue varchar(50)
		if @UserRole ='SO'
 		    select  top 1 @rValue = AreaCode   from [dbo].[EPA_Org_RegionArea] where SuperID = @UserID
        else if @UserRole in ('Teacher','Principal','VP')
            select top 1 @rValue = Area from EPA_Org_Schools where UnitCode = ( select top 1 Unit_ID  from [dbo].[EPA_Org_EmployeeList] where UserID = @UserID) 
        else if @UserRole = 'Admin'
		    select top 1 @rValue = Area from EPA_Org_Schools where UnitCode = ( select  top 1 Working_Unit  from [dbo].[EPA_sys_UsersActionTrack] where UserID = @UserID	)	
		else
		    set @rValue ='All'
 
		  
		RETURN(@rValue)
 END

  







