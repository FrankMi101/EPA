

	  

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 26, 2020 
-- Description: check appraisal process to do list
-- ==================================================================================
 
 
CREATE function [dbo].[EPA_Appr_GetStatusTitle]  
(   @Result			varchar(10) = null,	
	@Category		varchar(20)= null, 
	@Content		varchar(50) = null,
	@Object			varchar(30) =null 
	)

RETURNS varchar(200)
AS 
  BEGIN
		declare @rValue varchar(200)
        if  @Content ='ALP'
		    begin
				 if @Result ='Done'
				   set @rValue = 'Annual Learning Plan completed'
				else
				   set @rValue = ' Needs to complete Annual Learning Plan'
			end
        else if  @Content ='ALPSignOff'
		    begin
				 if @Result ='Done'
				   set @rValue = 'Annual Learning Plan sign off completed by ' + @Object
				else
				   set @rValue =  @Object  + ' needs to sign off Annual Learning Plan'
			end 
        else if  @Content ='AGP'
		    begin
				 if @Result ='Done'
				   set @rValue = 'Annual Growth Plan completed'
				else
				   set @rValue = 'Needs to complete Annual Growth Plan'
			end 
        else if  @Content ='AGPSignOff'
		    begin
				 if @Result ='Done'
				   set @rValue = 'Annual Growth Plan sign off completed by ' + @Object
				else
				   set @rValue =  @Object  + ' needs to sign off Annual Growth Plan'
			end 
         else if  @Content = 'Assignment'
		      begin
				 if @Result ='Done'
				      set @rValue = 'Staff Assignment completed'
				  else
					  set @rValue =  'Need to complete Staff Assignment'  
			  end
         else if  @Content = 'ClassRoomObservation'
		      begin
 			      if @Result ='Done' 
					  set @rValue = 'Classroom Observation completed'
				  else
					  set @rValue =  'Need to complete Classrom Observation'  
			  end
         else if  @Content = 'Summative'
			 begin
 	 			 if  @Result ='Done'
					 set @rValue = 'Summative Domain Competencies Appraisal completed'
				 else
					 set  @rValue = 'Need to complete Domain Competencies Appraisal'
			 end
         else if  @Content = 'SummativeRating'
		      begin
			      if  @Result ='Done'
				      set @rValue = 'Appraisal Rate has been completed'
				  else
					  set @rValue =  'Need to complete Appraisal Rate'  
			  end
         else if  @Content = 'SummativeSignOff'
			begin
				 if  @Result ='Done' 
					 set @rValue = ' Summative Report sign off completed by ' + @Object
                 else
				     set @rValue =  @Object + ' needs to sign Off Summative Report '
			end
          else if  @Content ='ImprovementPlan'
			     if  @Result ='Done' 
					 set @rValue = 'Improvement Plan completed'
                 else
				     set @rValue =  'Needs to complete Improvement Plan'
         else if  @Content ='ImprovementSignOff'
			begin
				 if  @Result ='Done' 
					 set @rValue = 'Improvement Plan sign off completed by ' + @Object
                 else
				     set @rValue =  @Object + ' needs to sign Off Improvement Plan'
			end

         else if  @Content ='EnrichmentPlan'
			     if  @Result ='Done' 
					 set @rValue = 'Enrichment Plan completed'
                 else
				     set @rValue =  'Needs to complete Enrichment Plan'
         else if  @Content ='EnrichmentSignOff'
			begin
				 if  @Result ='Done' 
					 set @rValue = ' Enrichment Plan sign off completed by ' + @Object
                 else
				     set @rValue =  @Object + ' needs to sign Off Enrichment Plan'
			end
         else if  @Content ='PerformancePlan'
			     if  @Result ='Done' 
					 set @rValue = 'Performance Plan completed'
                 else
				     set @rValue =  'Needs to complete Performance Plan'
         else if  @Content ='PerformanceSignOff'
			begin
				 if  @Result ='Done' 
					 set @rValue = ' Performance Plan sign off completed by ' + @Object
                 else
				     set @rValue =  @Object + ' needs to sign Off Performance Plan'
			end


         else if  @Content ='NTIPStratigyPlan'
		      begin
			     if  @Result ='Done' 
					 set @rValue = ' Individual NTIP Strategy completed'
                 else
				     set @rValue =  'Needs to complete Individual NTIP Strategy'
			  end
         else if  @Content ='NTIPStratigySignOff'
			begin
				 if  @Result ='Done' 
					 set @rValue = ' Individual NTIP Strategy sign off completed by ' + @Object
                 else
				     set @rValue =  @Object + ' needs to sign Off Individual NTIP Strategy'
			end
        else
		    set @rValue  =''
		  
		RETURN  '<li>' +  @rValue + ' </li>'
 END

   
    
