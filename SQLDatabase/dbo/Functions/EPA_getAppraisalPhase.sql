
 




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 05, 2017 
-- Description:	get Appraisal Phase name by ID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalPhase]
(@Phase varchar(10))
RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50)
	     
	 	set @rValue = ( select top 1 Appraisal_PhaseName from [dbo].[EPA_sys_appraisalPhase]  where Appraisal_Phase = @Phase) 
 
		RETURN(@rValue)
 END

  



