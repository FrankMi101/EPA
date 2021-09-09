






-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 3, 2018 
-- Description:	get user application role by EmployeeID or UserID and School year
-- ================================================================================== 

create FUNCTION [dbo].[EPA_getAppraisalRoleByYear]
(	@SchoolYear	varchar(8),
	@EmployeeID varchar(20)
)
RETURNS varchar(20)
AS 
  BEGIN
		declare @gRole varchar(20)
		if ASCII( left(@EmployeeID,1)) > 57
			set @gRole = (	select  top 1   Appraisal_Role
							from [dbo].[EPA_Appr_EmployeeList]
							where Appraisal_Year = @SchoolYear and  UserID =  @EmployeeID -- parameter is User ID
							)
		else

			set @gRole = (	select  top 1   Appraisal_Role
							from [dbo].[EPA_Appr_EmployeeList]
							where Appraisal_Year = @SchoolYear and  Employee_ID =  @EmployeeID -- parameter is User ID
							)
		RETURN(@gRole)
 END
 
  

