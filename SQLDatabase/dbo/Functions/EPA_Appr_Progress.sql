


 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 20, 2018 
-- Description:	check Appraislal process progress
-- ==================================================================================
  

Create FUNCTION [dbo].[EPA_Appr_Progress]
(@ResultFor		varchar(20),
 @AppraisalYear varchar(8),
 @AppraisalSchool varchar(8),
 @EmployeeID  varchar(10),
 @AppraisalCycle  varchar(10),
 @AppraisalType   varchar(10)
 )
RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(20),  @cSession varchar(15), @currentSchoolYear varchar(8),@PerviousSchoolYear varchar(8), @lastSession varchar(10), @SatisfactoryCount int
		set @currentSchoolYear =[dbo].[EPA_CurrentSchoolYear](8,25)
		set @PerviousSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@currentSchoolYear)

 
 -- Step 1 check those No Evaluable year staff
if @AppraisalCycle   in ('NE0','NE1','NE2','NE3','NE4','UNA')
   set @cSession ='Appraisal1'
-- step 2 check Non Current school year staff
else if @AppraisalYear < @currentSchoolYear
    begin
	    if exists (select * from  [dbo].[EPA_Appr_SignOff] where  school_year = @AppraisalYear and EmployeeID = @EmployeeID and SignOff_Type = 'Appraisee')
			set @cSession = (select top 1  SessionID from [dbo].[EPA_Appr_SignOff]  
 								where  school_year = @AppraisalYear and EmployeeID = @EmployeeID and SignOff_Type = 'Appraisee'
								order by  SessionID DESC)				 
        else  
			set @cSession = 'Appraisal1'
   end
else -- Step 3 check current school year 
   begin
        if not exists (select * from [dbo].[EPA_Appr_SignOff] 
					where  School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID  and SignOff_Type = 'Appraisee'  and SignOff_Action ='Sign Off' and ItemCode ='SUM95')
     		set @cSession = 'Appraisal1'
		else
		    set @cSession =(select top 1 SessionID  from [dbo].[EPA_Appr_SignOff] 
							where  School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID  and SignOff_Type = 'Appraisee'  and SignOff_Action ='Sign Off' and ItemCode ='SUM95'
							order by School_Year DESC, SessionID DESC)
    

	    if @AppraisalCycle ='LTO' 
		    set @cSession = 'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end
        if @AppraisalCycle ='E'
		   begin
		       if exists (select * from [dbo].[EPA_Appr_SignOff] where  School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID  and SignOff_Type = 'Appraisee'  and SignOff_Action ='Sign Off' and ItemCode ='IMP95')
				  set @cSession = 'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end 
               else
			      set @cSession = @cSession
		   end 
		if @AppraisalCycle ='NTP'  
			begin
				declare @Count2S int, @CountT int
				set @Count2S = (select count(*)   from [dbo].[EPA_Appr_Rating]
										  where School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID and ItemCode ='SUM61' and Appraisal_chose ='3')
                if @Count2S = 2					 
					   set  @cSession = @cSession
                else
				   if exists ( select * from  [dbo].[EPA_Appr_SignOff] where  School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID  and SignOff_Type = 'Appraisee'  and SignOff_Action ='Sign Off' and ItemCode ='ENR95')
						set @cSession =  'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end 
				   else
						set  @cSession = @cSession
		   end
 
	end                                                                                                                                                                                                                                 
	set @cSession = isnull(@cSession,'Appraisal1') 
   
   return @cSession
End	 



