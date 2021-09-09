





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 20, 2018 
-- Description:	check Appraisal Result  by Session
-- ==================================================================================
 
 
CREATE  FUNCTION    [dbo].[EPA_Appr_Result_AppraisalII]
(@AppraisalYear varchar(8),
 @AppraisalYearPass varchar(8),
 @AppraisalSchool	varchar(8),
 @EmployeeID  varchar(10),
 @AppraisalCycle  varchar(10),
 @SessionID   varchar(10)
 )
RETURNS varchar(20) 
AS  
BEGIN 

	declare @rValue varchar(20),    @currentSchoolYear varchar(8) 
	set @currentSchoolYear =[dbo].[EPA_CurrentSchoolYear](8,25)
     
	if  @AppraisalCycle in ('NE1','NE2','NE3','NE4','UNA')
 	       set @rValue =''
	else  
		begin
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
	 return  @rValue
END  


 


