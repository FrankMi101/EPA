







-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 3, 2018 
-- Description:	get user application role by EmployeeID or UserID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalRole]
(@EmployeeID varchar(20)
)
RETURNS varchar(20)
AS 
  BEGIN
		declare @gRole varchar(20), @EmployeePosition varchar(50)
		if ASCII(lower(left(@EmployeeID,1))) > 57
		    set @EmployeePosition = ( select top 1 Employee_Position from [dbo].[EPA_Org_EmployeeList] where UserID =  @EmployeeID )
        else
		    set @EmployeePosition = ( select top 1 Employee_Position from [dbo].[EPA_Org_EmployeeList] where Employee_ID =  @EmployeeID )
		   

	    set @gRole =  case @EmployeePosition	when 'Supervisor'		then 'SO' 
												when 'Superintendent'	then 'SO'
												when 'Vice Principal'	then 'VP' 
												when 'Principal'		then 'Principal' 
												when 'Coordinator'		then 'Principal' 
												else 'Teacher' end
	 
		 
       --  set @gRole = (select top 1 Appraisal_Role from dbo.EPA_Org_PositionToRole where Employee_Position =  @EmployeePosition )
 
		RETURN(@gRole)
 END
  

