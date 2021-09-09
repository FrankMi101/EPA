

 




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Apirl 09, 2018
-- Description:	get Appraisal Phase by EmployeeID and school year
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalPhaseByYear]
(@EmployeeID varchar(10),
 @SchoolYear varchar(8))
RETURNS varchar(10)
AS 
  BEGIN
	  declare @rValue varchar(10)
      if exists( select * from [dbo].[EPA_Appr_EmployeeList] where Appraisal_Year = @SchoolYear and Employee_ID = @EmployeeID)
	       	set @rValue = ( select top 1  Appraisal_Cycle from   [dbo].[EPA_Appr_EmployeeList] where Appraisal_Year = @SchoolYear and Employee_ID = @EmployeeID) 
	  else
			set @rValue ='UNE'

		RETURN(@rValue)
 END

  




