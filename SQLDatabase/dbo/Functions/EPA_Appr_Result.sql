






 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 20, 2018 
-- Description:	check Session complete Result
-- ==================================================================================
  

CREATE FUNCTION [dbo].[EPA_Appr_Result]
(@AppraisalYear		varchar(8),
 @AppraisalSchool	varchar(8),
 @EmployeeID		varchar(10),
 @AppraisalCycle	varchar(10),
 @SessionID			varchar(20),
 @AppraisalType		varchar(10)
 )

RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50),  @cSession varchar(15), @currentSchoolYear varchar(8),@PerviousSchoolYear varchar(8), @lastSession varchar(10), @SatisfactoryCount int
		set @currentSchoolYear =[dbo].[EPA_CurrentSchoolYear](8,25)
		set @PerviousSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@currentSchoolYear)

 if @AppraisalCycle in ('NE1','NE2','NE3','NE4','UNA')
     set @rValue = ''   
 else 
 	begin  
		 if @SessionID in ('Complete_Year','Complete_Month','Complete_Date')				
			 set @rValue =  dbo.EPA_Appr_Result_CompleteYear( @AppraisalYear,@PerviousSchoolYear, @AppraisalSchool, @EmployeeID,@AppraisalCycle, @SessionID)
		 else if  @SessionID ='Process_Step'
			 set  @rValue =  dbo.EPA_Appr_Result_ProcessStep( @AppraisalYear,@PerviousSchoolYear, @AppraisalSchool,@EmployeeID,@AppraisalCycle, @SessionID, @AppraisalType)
		 else if @SessionID ='OutCome'
			 set  @rValue =  dbo.EPA_Appr_Result_OutCome( @AppraisalYear,@PerviousSchoolYear, @AppraisalSchool,@EmployeeID, @AppraisalCycle, @SessionID)
		 else  -- Appraisal 1 to 4
		     set  @rValue =  dbo.EPA_Appr_Result_AppraisalII( @AppraisalYear,@PerviousSchoolYear, @AppraisalSchool,@EmployeeID,@AppraisalCycle, @SessionID)
		
	end
  set @rValue =  isnull(@rValue,'') 
	   
	return @rValue
END  
  


 





