

 




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 24, 2020
-- Description:	get teacher latest Appraisal category by year
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalCategory]
(@SchoolYear varchar(8),
@SchoolCode varchar(8),
@EmployeeID varchar(10) 
) 
RETURNS varchar(10)
AS 
  BEGIN
		declare @rValue varchar(10)
	     
	 	set @rValue = ( select top 1 Appraisal_type from [dbo].[EPA_Appr_EmployeeList]   
						where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID -- and Unit_ID = @SchoolCode 
						order by StartDate DESC
						) 
 
		RETURN(@rValue)
 END

  



