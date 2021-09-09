







 

 
 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: June 02, 2020 
-- Modified   : July 26 2020 Modified by Frank change all statements to function 
-- Description:	get appraisal Summary tasks
-- ==================================================================================
 
--   [dbo].[EPA_Appr_AppraisalProcess_Summary]   'Done', 'mif','20182019','0529','00039524','Appraisal1','LTO','LTO','Admin'
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_Summary]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null,
	@Category		varchar(10)= null,
	@Phase			varchar(20) = null,
	@AppraisalRole	varchar(20) = null  
as

set nocount on
declare @Rate varchar(20)
select top 1 @Rate = Appraisal_chose from [dbo].[EPA_Appr_Rating] where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and category = @Category and ItemCode ='SUM61'

if @Operate = 'Tasks'
	begin
		if @category ='LTO'
     		    select   'You are as a ' + @AppraisalRole +', current working Appraisee is a LTO  Assignment in current School year. <br />'
				+ ' Appraisal should be complete before the LTO assignment end in current school year, can do multiple times appraisal. follow tasks must complete:'
				+ '  <a href="javascript:OpenAppraisalDocument(''LTOProcess'')"> Process</a> '
				+ ' <ul>'
				+ ' <li> 1. Complete Assigment Overview. </li>'
				+ ' <li> 2. Complete Classroom Observation. </li>'
				+ ' <li> 3. Complete Summative Report by Appraiser. </li>'
				+ ' <li> 4. Complete Appraisal Rating by Appraiser. </li>'
				+ ' <li> 5. Complete Sign off Summative Report (Appraisee) </li>'
				+ ' <li> 6. Complete Sign off Summative Report (Appraiser) </li>'
				+ ' <li> 7. Optional to do the Appraisee Evidence Log </li>'  
				+ ' <li> 8. Optional to do NTIP strategy  </li>'  
 				+ '</ul>' as rValue
		if @category ='NTP'
     			select   'You are as a ' + @AppraisalRole +', current working Appraisee is a New Teacher Induction Program in current School year. <br />'
				+ ' Appraisal should be have at last two Satisfactory in one or two school year, follow tasks must complete:'
				+ '  <a href="javascript:OpenAppraisalDocument(''NTIPProcess'')"> Process</a> '
				+ ' <ul>'
				+ ' <li> 1. Complete Classroom Observation. </li>'
				+ ' <li> 2. Complete Summative Report by Appraiser. </li>'
				+ ' <li> 3. Complete Appraisal Rating.      </li>'
				+ ' <li> 4. Complete Sign off Summative Report (Appraisee/Appraiser) </li>'
				+ ' <li> 5. Optional to do the Appraisee Evidence Log </li>'  
				+ ' <li> 6. Appraisee may have to do an Enrichment Plan if he or she got a Development needed appraisal result  </li>'  
				+ ' <li> 7. Appraisee may have to do an Imptovement Plan if he or she got a Unsatisfactory appraisal result  </li>'  
				+ '</ul>' as rValue
		if @category ='TPA'
			if @Phase ='E'
     			select   'You are as a ' + @AppraisalRole +', current working Appraisee is an Evaluation Year in current School year. <br />'
				+ ' In order to complete this year Appraisal Process, follow tasks must complete: <ul>'
				+ ' <li> 1. Complete Annual Learning Plan. </li>'
				+ ' <li> 2. Sign Off the Annual Learning Plan (Appraisee/Appraiser).</li>'
				+ ' <li> 3. Complete Classroom Observation. </li>'
				+ ' <li> 4. Complete Summative Report by Appraiser. </li>'
				+ ' <li> 5. Complete Appraisal Rating.      </li>'
				+ ' <li> 6. Complete Sign off Summative Report (Appraisee/Appraiser) </li>'
				+ ' <li> 7. Optional to do the Appraisee Evidence Log </li>'  
				+ '</ul>' as rValue
			else
   				select   ' As a ' + @AppraisalRole +', Current School year, ' +  case @AppraisalRole when 'Appraisee' then 'you are' else 'Appraisee is ' end + ' in Non Evaluation Year: <br />'
					+ ' In order to complete this year Appraisal Process, follow tasks must complete by Appraisee and Appraiser: <ul>'
					+ ' <li> 1. Complete Annual Learning Plan. </li>'
					+ ' <li> 2. Sign Off the Annual Learning Plan (Appraisee). </li>' 
					+ ' <li> 3. Sign Off the Annual Learning Plan (Appraiser). </li>' 
					+ '</ul>'   as rValue
		if 	@category ='PPA'	
			if @Phase ='E'
     			select   'You are as a ' + @AppraisalRole +', current working Appraisee is Evaluation Year of PPA appraisal Process in current School year. <br />'
				+ ' In order to complete this year Appraisal Process, follow tasks must complete: <ul>'
				+ ' <li> 1. Complete Annual Growth Plan. </li>'
				+ ' <li> 2. Sign Off the Annual Growth Plan. (Appraisee).</li>'
				+ ' <li> 3. Sign Off the Annual Growth Plan. (Appraiser).</li>'
				+ ' <li> 4. Complete Performance Plan and Performance Dialog Meeting. </li>'
				+ ' <li> 5. Complete Summative Report by Appraiser. </li>'
				+ ' <li> 6. Complete Appraisal Rating.      </li>'
				+ ' <li> 7. Complete Sign off Summative Report (Appraisee/Appraiser) </li>' 
				+ '</ul>' as rValue
			else
   				select   'You are as a ' + @AppraisalRole +', current working Appraisee is Non Evaluation Year of PPA process in current School year. <br />'
				+ ' Appraisaee only need complete the Annual Growth Plan: <ul>'
				+ ' <li> 1. Complete Annual Growth Plan. </li>'
				+ ' <li> 2. Sign Off the Annual Growth Plan. (Appraisee).</li>' 
				+ ' <li> 3. Sign Off the Annual Growth Plan. (Appraiser).</li>' 
				+ '</ul>' as rValue
	     
    end
 if @Operate = 'ToDo'
  	begin
		if @category ='LTO'
			 select  '<ul>'
 				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Assignment','ToDo')				when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','Assignment','ToDo')  else '' end
 				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ClassRoomObservation','ToDo')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ClassRoomObservation','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','ToDo')				when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','Summative','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','ToDo')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeRating','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')  when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')  when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue 
		if @category ='NTP'
     		 select  '<ul>'
 				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ClassRoomObservation','ToDo')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ClassRoomObservation','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','ToDo')				when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','Summative','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','ToDo')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeRating','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')  when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')  when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraiser')  else '' end

				+ case @Rate when '5' then  case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementPlan','ToDo')			when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ImprovementPlan','ToDo')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraisee')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ImprovementSignOff','Appraisee')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraiser')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ImprovementSignOff','Appraiser')  else '' end
				             when '4' then  case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'EnrichmentPlan','ToDo')			when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','EnrichmentPlan','ToDo')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'EnrichmentSignOff','Appraisee')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','EnrichmentSignOff','Appraisee')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'EnrichmentSignOff','Appraiser')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','EnrichmentSignOff','Appraiser')  else '' end
							 else '' end
 
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'NTIPStratigyPlan','ToDo')			when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','NTIPStratigyPlan','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'NTIPStratigySignOff','Appraisee')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','NTIPStratigySignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'NTIPStratigySignOff','Appraiser')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','NTIPStratigySignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue 
		if @category ='TPA'
			if @Phase ='E'	   
     			select  '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALP','ToDo')						when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ALP','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraisee')			when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ALPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraiser')			when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ALPSignOff','Appraiser')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ClassRoomObservation','ToDo')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ClassRoomObservation','ToDo')  else '' end      
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','ToDo')					when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','Summative','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','ToDo')			when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeRating','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraiser')  else '' end
				+ case @Rate when '5' then case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementPlan','ToDo')		  when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ImprovementPlan','ToDo')  else '' end
										 + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraisee') when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ImprovementSignOff','Appraisee')  else '' end
										 + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraiser') when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ImprovementSignOff','Appraiser')  else '' end
							 else ''  end
				+ '</ul>'  as rValue
			else
      			select '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALP','ToDo')			 when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ALP','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraisee') when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ALPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraiser') when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','ALPSignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue
		if 	@category ='PPA'	
			if @Phase ='E'
     			select  '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGP','ToDo')					when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','AGP','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraisee')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','AGPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraiser')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','AGPSignOff','Appraiser')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'PerformancePlan','ToDo')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','PerformancePlan','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','ToDo')				when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','Summative','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','ToDo')		when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeRating','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','SummativeSignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue
			else
   				select  '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGP','Done')				when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','AGP','ToDo')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraisee')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','AGPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraiser')	when 'ToDo' then dbo.EPA_Appr_GetStatusTitle('ToDo','LTO','AGPSignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue
	     
    end
if @Operate = 'Done'
   
  	begin
		if @category ='LTO'
      			select  '<ul>'
 				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Assignment','Done')				when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','Assignment','Done')  else '' end
 				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ClassRoomObservation','Done')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ClassRoomObservation','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','Done')				when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','Summative','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','Done')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeRating','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')  when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')  when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraiser')  else '' end
		         + ' </ul>'  as rValue
	     if @category ='NTP'
       			select  '<ul>'				
 				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ClassRoomObservation','Done')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ClassRoomObservation','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','Done')				when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','Summative','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','Done')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeRating','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')  when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')  when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraiser')  else '' end

				+ case @Rate when '5' then  case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementPlan','Done')			when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ImprovementPlan','Done')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraisee')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ImprovementSignOff','Appraisee')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraiser')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ImprovementSignOff','Appraiser')  else '' end
				             when '4' then  case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'EnrichmentPlan','Done')			when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','EnrichmentPlan','Done')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'EnrichmentSignOff','Appraisee')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','EnrichmentSignOff','Appraisee')  else '' end
										  + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'EnrichmentSignOff','Appraiser')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','EnrichmentSignOff','Appraiser')  else '' end
							 else '' end
 
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'NTIPStratigyPlan','Done')			when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','NTIPStratigyPlan','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'NTIPStratigySignOff','Appraisee')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','NTIPStratigySignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'NTIPStratigySignOff','Appraiser')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','NTIPStratigySignOff','Appraiser')  else '' end
		         + ' </ul>'  as rValue
		if @category ='TPA'
			if @Phase ='E'	   
     			select  '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALP','Done')						when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ALP','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraisee')			when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ALPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraiser')			when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ALPSignOff','n')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ClassRoomObservation','Done')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ClassRoomObservation','Done')  else '' end      
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','Done')					when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','Summative','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','Done')			when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeRating','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraiser')  else '' end
				+ case @Rate when '5' then case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementPlan','Done')		  when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ImprovementPlan','Done')  else '' end
										 + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraisee') when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ImprovementSignOff','Appraisee')  else '' end
										 + case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ImprovementSignOff','Appraiser') when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ImprovementSignOff','Appraiser')  else '' end
							 else ''  end
				+ '</ul>'  as rValue
			else
      			select '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALP','Done')			 when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ALP','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraisee') when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ALPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'ALPSignOff','Appraiser') when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','ALPSignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue
		if 	@category ='PPA'	
			if @Phase ='E'
     			select  '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGP','Done')					when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','AGP','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraisee')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','AGPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraiser')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','AGPSignOff','Appraiser')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'PerformancePlan','Done')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','PerformancePlan','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'Summative','Done')				when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','Summative','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeRating','Done')		when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeRating','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraisee')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'SummativeSignOff','Appraiser')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','SummativeSignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue
			else
   				select  '<ul>'
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGP','Done')				when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','AGP','Done')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraisee')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','AGPSignOff','Appraisee')  else '' end
				+ case dbo.EPA_Appr_CheckStatusToDo(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole,'AGPSignOff','Appraiser')	when 'Done' then dbo.EPA_Appr_GetStatusTitle('Done','LTO','AGPSignOff','Appraiser')  else '' end
				+ '</ul>'  as rValue
	     
    end








