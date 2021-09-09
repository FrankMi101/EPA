

 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 8, 2018
-- Description:	get Appraisal Evidence Log look fors  
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getLookFors]
(	@DomainID		int,
	@CompetencyID	int,
	@LookForsID  int  
)
RETURNS varchar(5000)
AS 
  BEGIN
	  declare @rValue varchar(500) 
 	  set @rValue = (select  top 1 Appraisal_LookForsName 
					from  [dbo].[EPA_sys_appraisalDomainCompetencyLookFor]
					where  Appraisal_Domain = @DomainID and Appraisal_Competency = @CompetencyID and Appraisal_LookFors = @LookForsID
					order by Appraisal_LookFors  
					)
 
	  RETURN isnull( @rValue,'')
 END

  


