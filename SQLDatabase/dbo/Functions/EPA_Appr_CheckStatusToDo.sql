
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 07, 2020 
-- Description: check appraisal process to do list
-- ==================================================================================
 
 
CREATE function [dbo].[EPA_Appr_CheckStatusToDo]  
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
		declare @rValue varchar(20), @CompetencyCount int
        if  @Content ='ALP'
			begin
					if exists (select top 1 * from [dbo].[EPA_Appr_Comments] where  School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and left(ItemCode,3) ='ALP'  and  len(isnull(Appraisal_Note,0)) >= 5) 
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
			end
        else if  @Content ='ALPSignOff'
			begin
					if exists (select top 1 * from [dbo].[EPA_Appr_SignOff]   where    School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and ItemCode ='ALP95'  and SignOff_Type = @Object and SignOff_Action ='Sign Off'  and SignOff_Date is not null)
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
 			end
        else if  @Content ='AGP'
					if exists (select top 1 * from [dbo].[EPA_Appr_Comments_AGP]    where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode ='AGP11' ) 
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
        else if  @Content ='AGPSignOff'
			begin
					if exists (select top 1 * from [dbo].[EPA_Appr_SignOff]   where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and ItemCode ='AGP95'  and SignOff_Type = @Object and SignOff_Action ='Sign Off'  and SignOff_Date is not null)
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
 			end
         else if  @Content = 'Assignment'
		      begin
			      if exists(select top 1 * from    [dbo].[EPA_Appr_Assignment]  where  School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category)
				      set @rValue = 'Done'
				  else
					  set @rValue =  'ToDo'  
			  end
         else if  @Content = 'ClassRoomObservation'
		      begin
			      set @CompetencyCount = ( select count(*) from   [dbo].[EPA_Appr_Comments_Observation] where    School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and  Observation_Date is not null)
			      if @CompetencyCount = 3  
					  set @rValue = 'Done'
				  else
					  set @rValue =  'ToDo'  
			  end
         else if  @Content = 'Summative'
			 begin
				 set @CompetencyCount = (select count(*) from [dbo].[EPA_Appr_Comments_DomainCompetency] where    School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category)
 				 if @Category ='LTO' 
					 begin
						 if  @CompetencyCount >= 7 
							 set @rValue = 'Done'
						 else
							 set  @rValue = 'ToDo'
					 end
				 else if @Category ='NTP' 
					 begin
						 if  @CompetencyCount >= 8 
							 set @rValue = 'Done'
						 else
							 set  @rValue = 'ToDo'
					 end
				 else if @Category ='TPA' 
					 begin
						 if  @CompetencyCount >= 16 
							 set @rValue = 'Done'
						 else
							 set  @rValue = 'ToDo'
					 end
				 
 			 end
         else if  @Content = 'SummativeRating'
		      begin
			      if exists(select top 1 * from  [dbo].[EPA_Appr_Rating]  where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category  and Appraisal_chose is not null)
				      set @rValue = 'Done'
				  else
					  set @rValue =  'ToDo'  
			  end
         else if  @Content = 'SummativeSignOff'
			begin
					if exists (select top 1 * from [dbo].[EPA_Appr_SignOff]   where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and ItemCode ='SUM95'  and SignOff_Type = @Object and SignOff_Action ='Sign Off'  and SignOff_Date is not null)
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
 			end
         else if  @Content ='PerformancePlan'
					if exists (select top 1 * from [dbo].[EPA_Appr_Comments_APP] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID   and ItemCode ='APP11'  ) 
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
         else if  @Content ='PerformanceSignOff'
			begin
					if exists (select top 1 * from [dbo].[EPA_Appr_SignOff]   where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and ItemCode ='IMP95'  and SignOff_Type = @Object and SignOff_Action ='Sign Off'  and SignOff_Date is not null)
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
 			end

         else if  @Content ='ImprovementPlan'
					if exists (select top 100 * from [dbo].[EPA_Appr_Comments]    where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and left(ItemCode,3) ='IMP'    and  len(isnull(Appraisal_Note,0)) > 5) 
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
         else if  @Content ='ImprovementSignOff'
			begin
					if exists (select top 1 * from [dbo].[EPA_Appr_SignOff]   where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and ItemCode ='IMP95'  and SignOff_Type = @Object and SignOff_Action ='Sign Off'  and SignOff_Date is not null)
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
 			end

         else if  @Content ='EnrichmentPlan'
					if exists (select top 1 * from [dbo].[EPA_Appr_Comments]    where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and left(ItemCode,3) ='ENR'    and  len(isnull(Appraisal_Note,0)) > 5) 
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
         else if  @Content ='EnrichmentSignOff'
			begin
					if exists (select top 1 * from [dbo].[EPA_Appr_SignOff]   where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and ItemCode ='ENR95'  and SignOff_Type = @Object and SignOff_Action ='Sign Off'  and SignOff_Date is not null)
                       set @rValue =  'Done'
                    else
					   set @rValue =  'ToDo'
 			end

         else if  @Content ='NTIPStratigyPlan'
		      begin
				  set @CompetencyCount  =  (select Count(*) from [dbo].[EPA_Appr_Strategy]  where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and Principal_Initail is not null) --   and SessionID = @SessionID
			      if @CompetencyCount >= 10
				      set @rValue = 'Done'
				  else
					  set @rValue =  'ToDo'  
			  end
         else if  @Content ='NTIPStratigySignOff'
 			begin
 					if exists (select top 100 * from [dbo].[EPA_Appr_SignOff]   where    School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and Category = @Category and ItemCode ='STR95'  and SignOff_Type = @Object and SignOff_Action ='Sign Off'  and SignOff_Date is not null)
                       set @rValue = 'Done'
                    else
					   set @rValue =  'ToDo'
 			end
        else
		    set @rValue  ='ToDo'
		  
		RETURN    @rValue  
 END

   
    

-- select * from [dbo].[EPA_sys_Appraisal_Definition]
 -- where  appraisal_Text like ('%Sign off%')




