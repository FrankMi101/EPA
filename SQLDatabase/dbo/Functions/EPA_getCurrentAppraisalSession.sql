

 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 10, 2017 
-- Description:	get Appraisal current Session
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getCurrentAppraisalSession]
(@AppraisalYear varchar(8),
 @EmployeeID  varchar(10),
 @AppraisalSchool varchar(8),
 @AppraisalCycle  varchar(10),
 @AppraisalType   varchar(10)
 )
RETURNS varchar(20)
AS 
  BEGIN
		declare @rValue varchar(20)
 
	  	  set @rValue = 'Appraisal1'
		  
		RETURN(@rValue)
 END

  






