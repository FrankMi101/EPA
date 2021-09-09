



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 06, 2020 
-- Description:	check Appraisal Result  by Session
-- ==================================================================================

CREATE  FUNCTION    [dbo].[EPA_Appr_Result_BySession_ForNTP]
(@AppraisalYear		varchar(8),
 @AppraisalSchool	varchar(8),
 @EmployeeID		varchar(10),
 @AppraisalCycle	varchar(10),
 @Category			varchar(10),
 @SessionID			varchar(10),
 @Source			varchar(10)
 )
RETURNS varchar(30) 
AS  
BEGIN 

	declare @rValue varchar(30), @checkYear varchar(8), @currentSchoolYear varchar(8), @PerviousSchoolYear varchar(8) , @sCount int, @PreviousCycle varchar(10)
	set @currentSchoolYear =  [dbo].[EPA_CurrentApprYear](@AppraisalSchool) -- [dbo].[EPA_CurrentSchoolYear](8,25)
    set @PerviousSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@AppraisalYear)
	
	--set @checkYear = @AppraisalYear
 --   set @PreviousCycle = dbo.EPA_getAppraisalPhaseByYear](@EmployeeID,@PerviousSchoolYear)
 --   if @PreviousCycle ='NTP'  set @checkYear = @PerviousSchoolYear

	if exists ( select * from [dbo].[EPA_Appr_SignOff]   where  School_year = @AppraisalYear and  School_code = @AppraisalSchool and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode = 'SUM95'  and Category = @Category and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
				set @rValue = ( Select top 1 dbo.EPA_GetRateByLevel(Appraisal_chose,'TPA') from [dbo].[EPA_Appr_Rating] 
         						where  School_year =  @AppraisalYear  and  School_code = @AppraisalSchool   and EmployeeID  =  @EmployeeID and SessionID =@SessionID and ItemCode ='SUM61' and Category = @Category and Appraisal_chose is not null)  
			-- Previous school year teacher could be in diffirent school. no need check the school code 
			else if exists(select * from [dbo].[EPA_Appr_SignOff]   where  School_year = @PerviousSchoolYear  and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode = 'SUM95' and Category = @Category and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
				set @rValue = ( Select top 1 dbo.EPA_GetRateByLevel(Appraisal_chose,'TPA') + ' (' + @PerviousSchoolYear +  ')'from [dbo].[EPA_Appr_Rating] 
         						where  School_year =  @PerviousSchoolYear and EmployeeID  =  @EmployeeID and SessionID =@SessionID and ItemCode ='SUM61' and Category = @Category and Appraisal_chose is not null)  
			else if exists ( select * from 	[dbo].[EPA_Appr_Rating]  where    School_year = @AppraisalYear and  School_code = @AppraisalSchool   and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode = 'SUM61' and Category = @Category and Appraisal_chose is not null)
				set @rValue ='Signoff Required'
			else if exists ( select * from [dbo].[EPA_Appr_Comments_Observation] where   School_year = @AppraisalYear and  School_code = @AppraisalSchool  and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode = 'OBS22' and Category = @Category and Observation_Date is not null)
				set  @rValue ='Incomplete' 
			else if exists ( select * from [dbo].[EPA_Appr_Comments] where   School_year = @AppraisalYear and  School_code = @AppraisalSchool   and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode in ('APM22','APM33')  and Category = @Category)
				set  @rValue ='Incomplete' 
			else
				set  @rValue ='Not Start' 

			if  (@rValue ='Not Start' and @SessionID != 'Appraisal1')
			    begin
					if @Source = 'Outside'
						begin
							declare @PreSession varchar(10) , @PreValue  varchar(20)
							set @PreSession = 'Appraisal' + case right(@SessionID,1) when '2' then '1' when '3' then '2' else '3' end
							set @PreValue = [dbo].[EPA_Appr_Result_BySession_ForNTP](@AppraisalYear, @AppraisalSchool, @EmployeeID, @AppraisalCycle,@Category, @PreSession,'Internal')
							if  @PreValue in ( 'Not Start','Incomplete','Signoff Required')
								set @rValue =''
							else if @PreValue in ( 'Unsatisfactory','Development Need')
							   begin 
							       if exists (select * from [dbo].[EPA_Appr_SignOff] where  School_year = @AppraisalYear and  EmployeeID = @EmployeeID and SessionID = @PreSession and Category  =@Category and  ItemCode in('IMP95','ERN95') and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
										set @rValue = 'Not Start'
									else
										set @rValue = ''
							   end
							else 
								if @PreValue ='Satisfactory'
								     begin
										 set @sCount = ( Select count(*) from [dbo].[EPA_Appr_Rating] 
         												 where  School_year between @PerviousSchoolYear and  @AppraisalYear and EmployeeID  =  @EmployeeID  and ItemCode ='SUM61' and Category = @Category and Appraisal_chose ='3')  -- 3- Satisfactory
										 if @sCount =2
 												set @rValue = '' --'Completed'
										 else 				 
											set @rValue = case  @SessionID  when 'Appraisal2' then  'Not Start'   when 'Appraisal3' then  'Not Start' else ''end 
									 end
								else
									set @rValue = 'Not Start'
						end
 				end
 
	 
	 return  @rValue
END  
/*
		   if @AppraisalCycle ='NTP'
			  begin
					if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  = @AppraisalYear and  School_code = @AppraisalSchool and  EmployeeID  =  @EmployeeID and   SessionID =@SessionID and ItemCode  ='SUM95'  and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
						set @rValue = ( Select top 1 dbo.EPA_GetRateByLevel(Appraisal_chose,'TPA') from [dbo].[EPA_Appr_Rating] 
         							 where  School_year =  @AppraisalYear  and  School_code = @AppraisalSchool   and EmployeeID  =  @EmployeeID and SessionID =@SessionID and ItemCode ='SUM61' and Appraisal_chose is not null)  
					else if exists (select * from 	[dbo].[EPA_Appr_Rating] where  School_year = @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID  and SessionID = @SessionID   and ItemCode ='SUM61'		)
						set @rValue = 'Sign Off Required'  
					else if exists (select * from [dbo].[EPA_Appr_Comments] where  School_year = @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID  and SessionID = @SessionID   and left(ItemCode,3) ='SUM')
						  set @rValue = 'Incompleted'
					else
						set @rValue =  case @SessionID when 'Appraisal1' then 'Not Start' when 'Appraisal2' then 'Not Start' else '' end
			  end
		  if @AppraisalCycle ='E'
			 begin
					if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  = @AppraisalYear  and  School_code = @AppraisalSchool  and  EmployeeID  =  @EmployeeID and   SessionID =@SessionID and ItemCode  ='SUM95' and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
						set @rValue = ( Select top 1  dbo.EPA_GetRateByLevel(Appraisal_chose,'TPA')  from [dbo].[EPA_Appr_Rating] 
         							 where  School_year =  @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID and SessionID =@SessionID   and ItemCode ='SUM61' and Appraisal_chose is not null)  
					else if exists (select * from 	[dbo].[EPA_Appr_Rating] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and SessionID = @SessionID and ItemCode ='SUM61'		)
						set @rValue = 'Sign Off Required'  
					else if exists (select * from [dbo].[EPA_Appr_Comments] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID and SessionID = @SessionID   and left(ItemCode,3) ='SUM')
						  set @rValue = 'Incompleted'
					else
						set @rValue = case @SessionID when 'Appraisal1' then 'Not Start' else '' end
			end	
		  if @AppraisalCycle ='LTO'
			 begin
					if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  = @AppraisalYear  and  School_code = @AppraisalSchool  and  EmployeeID  =  @EmployeeID and   SessionID =@SessionID and ItemCode  ='SUM95' and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off' )
						set @rValue = ( Select top 1  dbo.EPA_GetRateByLevel(Appraisal_chose,'TPA')  from [dbo].[EPA_Appr_Rating] 
         							 where  School_year =  @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID and SessionID =@SessionID  and ItemCode ='SUM61' and Appraisal_chose is not null)  
					else if exists (select * from 	[dbo].[EPA_Appr_Rating] where  School_year = @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and SessionID = @SessionID  and ItemCode ='SUM61'		)
						set @rValue = 'Sign Off Required'  
					else if exists (select * from [dbo].[EPA_Appr_Comments] where  School_year = @AppraisalYear  and  School_code = @AppraisalSchool   and EmployeeID  =  @EmployeeID  and SessionID = @SessionID  and left(ItemCode,3) ='SUM')
						  set @rValue = 'Incompleted'
					else
						set @rValue = case @SessionID when 'Appraisal1' then 'Not Start' else '' end
			end	
		end
*/


