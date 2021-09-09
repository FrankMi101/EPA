





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get user application role
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getUserAppraisalRole]
(@UserID varchar(30))
RETURNS varchar(20)
AS 
  BEGIN
		declare @gRole varchar(20)
		set @gRole = ( select top 1 GroupID  from dbo.EPA_sys_securityUsers where UserID = @UserID)  
		if @gRole is null
			set @gRole = ( select  top  1 'SO' from  [dbo].[EPA_Org_RegionArea] where SuperID = @UserID )
        if @gRole is null
			set @gRole = ( select  top  1 Appraisal_Role from  dbo.EPA_appr_EmployeeList where UserID = @UserID  order by Appraisal_year DESC)

		if @gRole is null set @gRole ='Other'   
		set @gRole = isnull(@gRole,'Other') 

		RETURN(@gRole)
 END

   


