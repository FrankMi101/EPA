
 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 2, 2018
-- Description:	get Appraisal Evidence Log look fors geniric
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getCompetencyLookFors]
(	@DomainID		int,
	@CompetencyID	int  
)
RETURNS varchar(5000)
AS 
  BEGIN
	  declare @rValue varchar(5000), @LookForID int, @Notes varchar(500) ,@Follow varchar(250)
	  set @Follow ='The following are examples of possible ways the competency may be shown in practice. The principal and teacher may add other examples of good teaching practices that they identify during the appraisal process. It is not necessary to record information for each example. Rather, examples are intended to help the principal and teacher reflect on what the competency may look like in practice.' 
	  declare LookFors CURSOR 
	  For	select  Appraisal_LookFors, Appraisal_LookForsName   
			from  [dbo].[EPA_sys_appraisalDomainCompetencyLookFor]
			where  Appraisal_Domain = @DomainID and Appraisal_Competency = @CompetencyID
			order by Appraisal_LookFors  
	  Open LookFors
	  FETCH NEXT FROM LookFors INTO @LookForID,  @Notes
	  While @@FETCH_STATUS = 0
			begin
			    set @rValue = isnull(@rValue,'') + char(149) + '  ' +   + @Notes + ' ' +  CHAR(13) + CHAR(10)  
 			 
				FETCH NEXT FROM LookFors INTO  @LookForID,  @Notes 
			end
	  CLOSE 	LookFors
	  DEALLOCATE LookFors
 
	  RETURN(@Follow + CHAR(13) + CHAR(10)  + @rValue)
 END

  

