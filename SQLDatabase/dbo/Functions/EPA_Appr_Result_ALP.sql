




 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 20, 2018 
-- Description:	check ALP complete Result
-- ==================================================================================
  

CREATE FUNCTION [dbo].[EPA_Appr_Result_ALP]
(@AppraisalYear varchar(8),
 @AppraisalSchool varchar(8),
 @EmployeeID  varchar(10),
 @AppraisalCycle  varchar(10),
 @SessionID   varchar(10)
 )
  

RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50),  @cSession varchar(15), @currentSchoolYear varchar(8),@PerviousSchoolYear varchar(8), @lastSession varchar(10), @SatisfactoryCount int
		--set @currentSchoolYear =[dbo].[EPA_CurrentSchoolYear](8,25)
		--set @PerviousSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@currentSchoolYear)
 if @AppraisalCycle in ('LTO','NTP','UNA')
     set @rValue = ''
 else if exists (select * from  [dbo].[EPA_Appr_SignOff] where  school_year = @AppraisalYear and EmployeeID = @EmployeeID and SignOff_Type = 'Appraiser' and ItemCode ='ALP95' and SignOff_Action ='Sign Off')
     set @rValue = 'Completed'
 else if exists (select * from  [dbo].[EPA_Appr_SignOff] where  school_year = @AppraisalYear and EmployeeID = @EmployeeID and SignOff_Type = 'Appraisee' and ItemCode ='ALP95' and SignOff_Action ='Sign Off')
     set @rValue = 'Need Appraiser Sign Off'
 else if exists (select * from [dbo].[EPA_Appr_Comments]  where  school_year = @AppraisalYear and EmployeeID = @EmployeeID and SessionID = @SessionID and  left(itemCode,4)  ='ALP5')
     set  @rValue = 'Need Appraisee Sign Off'
 else if exists (select * from [dbo].[EPA_Appr_Comments]  where  school_year = @AppraisalYear and EmployeeID = @EmployeeID and SessionID = @SessionID and left(itemCode,3) ='ALP')
     set  @rValue = 'Incompleted'
 else
	 set @rValue = 'Not Start'
	  
   return @rValue
End	 





