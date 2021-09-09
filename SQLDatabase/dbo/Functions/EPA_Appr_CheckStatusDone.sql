


--select  dbo.EPA_Appr_CheckStatusDone('20192020','0529','000004431','Appraisal 1','NTP','NTP','ppraisaer','SummativeSignOff','Appraisee')


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 07, 2020 
-- Description: check appraisal processdone list
-- ==================================================================================
 
CREATE function [dbo].[EPA_Appr_CheckStatusDone]  
(
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(20)= null, 
	@Phase			varchar(20)= null,
	@AppraisalRole	varchar(20) =null,
	@Content		varchar(50) = null,
	@Object			varchar(30) =null 
	)

RETURNS varchar(200)
AS 
  BEGIN
		declare @rValue varchar(200)
        if  @Content ='ALP'
			set @rValue = 'Annual Learning Plan completed'
        else if  @Content ='ALPSignOff'
 					set @rValue = @Object +  ' Sign Off Annual Learning Plan completed' 
        else if  @Content = 'ClassRoomObservation'
			set  @rValue = ' ClassRoom Observation completed'
        else if  @Content = 'Summative'
			set  @rValue = 'Summative Domain Competencies Appraisal completed '
        else if  @Content = 'SummativeRating'
			set  @rValue = ' Appraisal Rating Result completed'
        else if  @Content = 'SummativeSignOff'
 			set @rValue = @Object +  ' Sign Off Summative Report complete' 
 
        else if  @Content ='ImprovementPlan'
 			set @rValue =  'Improvement Plan completed' 
        else if  @Content ='ImprovementSignOff'
 			set @rValue = @Object +  ' Sign Off Improment Plan sign off completed' 

        else if  @Content ='EnrichmentPlan'
 			set @rValue =  'Enrichment Plan completed' 
        else  if @Content ='EnrichmentSignOff'
 			set @rValue = @Object +  ' Sign Off Enrichment Plan sign off completed' 
         else if  @Content ='NTIPStratigyPlan'
 			set @rValue =  '  complete NTIP Stratigy Plan' 
         else if  @Content ='NTIPStratigySignOff'
 			set @rValue = @Object +  ' Sign Off NTIP stratigy Plan complete' 
         else 
			set @rValue =''
		  
		RETURN  '<li>' +  @rValue + ' </li>' 
 END

   
    





