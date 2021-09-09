

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 23, 2018 
-- Description:	get Appraisal Rate result by Appraisal Level
-- ==================================================================================
 
 
CREATE  FUNCTION  [dbo].[EPA_GetRateByLevel]
(@AppraisalLevel varchar(2),
 @AppraisalCode varchar(8)  
 )
RETURNS varchar(20) 
AS  
BEGIN
	declare @rValue varchar(20)
	set  @rValue = (select top 1 Appraisal_Rate 
					from  [dbo].[EPA_sys_appraisalRating] 
					where Appraisal_Level = @AppraisalLevel and Appraisal_Code ='TPA')

	return isnull(@rValue,'')

END