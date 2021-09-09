
 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 8, 2018 
-- Description:	get employee appraisal year
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_IsInAppraisalListYear]
(@EmployeeID varchar(10))
RETURNS varchar(20)
AS 
  BEGIN
		declare @rValue varchar(8)
		if not exists (select * from [dbo].[EPA_Appr_EmployeeList] where Employee_ID =  @EmployeeID)
			set @rValue = ''
		else
			set @rValue = (	select  top 1   Appraisal_year
						from [dbo].[EPA_Appr_EmployeeList] 
						where Employee_ID =  @EmployeeID
						order by Appraisal_year DESC
						)
		RETURN(@rValue)
 END
 




