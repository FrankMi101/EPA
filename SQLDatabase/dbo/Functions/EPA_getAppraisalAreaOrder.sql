








-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 12, 2017 
-- Description:	get Appraisal area sequence
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalAreaOrder]
(
	@AppraisalArea varchar(20)
)
RETURNS varchar(1)
AS 
  BEGIN
		declare @rValue varchar(1)

		set @rValue = case @AppraisalArea when 'ALP' then '1'
										  When 'AGP' then '1'
										  when 'APP' then '2'
										  when 'LOG' then '2'
										  when 'OBS' then '3'
										  when 'APM' then '3'
										  when 'SUM' then '4'
										  when 'STR' then '5'
										  When 'ENR' then '6'
										  When 'IMP' then '7' else '9' end
		  
		RETURN(@rValue)
 END

  






