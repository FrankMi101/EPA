
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 20, 2018 
-- Description:	check Appraisal Process Steps  
-- ==================================================================================
 
 
CREATE  FUNCTION    [dbo].[EPA_Appr_Result_ProcessStep]
(@AppraisalYear		varchar(8),
 @AppraisalSchool	varchar(8),
 @EmployeeID		varchar(10),
 @AppraisalCycle	varchar(10),
 @AppraisalType		varchar(10),
 @SessionID			varchar(10)
 )
RETURNS varchar(100) 
AS  
BEGIN 

	declare @rValue varchar(100),  @sValue varchar(30),    @currentSchoolYear varchar(8) , @PreviousSchoolYear varchar(8) , @currentSession varchar(20), @sCount int ,@strCount int
	set @currentSchoolYear =  [dbo].[EPA_CurrentApprYear](@AppraisalSchool)  --   [dbo].[EPA_CurrentSchoolYear](8,25)
	set @PreviousSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@AppraisalYear)

    set @currentSession = [dbo].[EPA_appr_CurrentAppraisalSession](@AppraisalYear,@EmployeeID,@AppraisalSchool,@AppraisalCycle,@AppraisalType)
 
	if  @AppraisalCycle in ('NE1','NE2','NE3','NE4','UNA')
		begin
 	    -- set @rValue =''
			if exists(select * from [dbo].[EPA_Appr_SignOff] where  School_year =  @AppraisalYear and EmployeeID = @EmployeeID  and Category = @AppraisalType and ItemCode ='ALP95'and  SignOff_Action  ='Sign Off' and  SignOff_Type = 'Appraiser'  )
				set @rValue ='Completed'
			else if exists(select * from [dbo].[EPA_Appr_SignOff] where  School_year =  @AppraisalYear and EmployeeID = @EmployeeID  and Category = @AppraisalType and ItemCode ='ALP95' and  SignOff_Action  ='Sign Off' and  SignOff_Type = 'Appraisee' )
				set @rValue ='Need Appraiser Sign Off'
			else if exists(select * from [dbo].[EPA_Appr_Comments]  where  School_year =  @AppraisalYear and EmployeeID = @EmployeeID  and Category = @AppraisalType and left(ItemCode,4) = 'ALP5' and len(Appraisal_Note) > 10)
				set @rValue ='Need Appraisee Sign Off'
			else if exists(select * from [dbo].[EPA_Appr_Comments]  where  School_year =  @AppraisalYear and EmployeeID = @EmployeeID  and Category = @AppraisalType and left(ItemCode,3) = 'ALP' and len(Appraisal_Note) > 10)
				set @rValue ='Incomplete'
			else
				set @rValue ='Not Start'
		end
	else
		begin  		  
					 set @sValue = dbo.EPA_Appr_Result_BySession_New(@AppraisalYear, @AppraisalSchool, @EmployeeID, @AppraisalCycle,@AppraisalType, @currentSession,'Outside')
					 if @sValue ='' 
					    begin
							set @currentSession = 'Appraisal' + cast( cast(right(@currentSession,1) as int) - 1 as varchar(1))  
							set @sValue = dbo.EPA_Appr_Result_BySession_New(@AppraisalYear, @AppraisalSchool, @EmployeeID, @AppraisalCycle,@AppraisalType, @currentSession,'Outside')
						end
					 set @sValue = REPLACE (@sValue , '('+ @PreviousSchoolYear +')' , '')
					 if (@sValue = 'Satisfactory') 
						begin
							if  @AppraisalCycle ='NTP'
								begin
									set @sCount = ( Select count(*) from [dbo].[EPA_Appr_Rating] 
         											where  School_year between @PreviousSchoolYear and  @AppraisalYear and EmployeeID = @EmployeeID and ItemCode ='SUM61' and Category = @AppraisalType and Appraisal_chose ='3')  
									if  @sCount =2
										begin
											set @strCount = ( Select count(*) from [dbo].[EPA_Appr_SignOff] 
         											where  School_year between @PreviousSchoolYear and  @AppraisalYear and EmployeeID = @EmployeeID and ItemCode ='STR95' and Category = @AppraisalType   and  SignOff_Action  ='Sign Off') 
											if  @strCount = 2	
												set @rValue ='Completed' 
											else
												set @rValue ='Strategy Signoff Required'		 
										end
									else
									   set @rValue ='Incomplete'	
								end
							else
								set @rValue ='Completed' 
						end
					 else if @sValue in ('Unsatisfactory','Development Needed')
						 begin
							 if exists (select * from [dbo].[EPA_Appr_SignOff] where  School_year = @AppraisalYear and  School_code = @AppraisalSchool and EmployeeID = @EmployeeID and Category = @AppraisalType  and SessionID = @currentSession and ItemCode in('IMP95','ERN95') and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
								set @rValue = 'Completed'
							else
								set @rValue = 'Incomplete'
 
						 end	
					 else
					    begin
						   if  @sValue ='Not Start'
								begin
								   if @AppraisalCycle ='LTO' 
									   if  @currentSession != 'Appraisal1'  
											set @rValue ='Completed'
										else
											 set @rValue = @sValue
								   else
									   set @rValue = @sValue
								end
							else
							    if  @currentSession = 'Appraisal0'  
								    set @rValue ='Not Start'
                                else
									set @rValue = @sValue

						end
				end
		 
	 
	 return  @rValue -- + ' - ' +  @currentSession + ' - ' +  @sValue  
END  

/*
		begin
		   if @AppraisalCycle ='NTP'
			  begin
					if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  = @AppraisalYear and  School_code = @AppraisalSchool and  EmployeeID  =  @EmployeeID and  SessionID = @currentSession and  ItemCode  ='STR95'  and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
						set @rValue =  'Completed'
					else if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  = @AppraisalYear and  School_code = @AppraisalSchool and  EmployeeID  =  @EmployeeID and  SessionID = @currentSession and ItemCode  ='SUM95'  and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
						begin
						    set   @sCount =(select count(*) from  [dbo].[EPA_Appr_Rating] where  School_year  between @PreviousSchoolYear and @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and ItemCode ='SUM61' and Appraisal_chose ='3')
							if @sCount = 2
							   set @rValue =  'Strategy SignOff Required'
							else
								set @rValue =  'Incompleted'	
						end
					else if exists (select * from 	[dbo].[EPA_Appr_Rating] where  School_year = @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID  and  SessionID = @currentSession and ItemCode ='SUM61'		)
						set @rValue = 'SignOff Required'  
					else if exists (select * from [dbo].[EPA_Appr_Comments] where  School_year = @AppraisalYear  and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID  and  SessionID = @currentSession and left(ItemCode,3) ='SUM')
						  set @rValue = 'Incompleted'
					else if exists (select * from  [dbo].[EPA_Appr_Comments_Observation] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and  SessionID = @currentSession and left(ItemCode,3) ='OBS')
						  set @rValue = 'Incompleted'
					else
						set @rValue =   'Not Start'  
			  end
		  if @AppraisalCycle ='E'
			 begin
					if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  = @AppraisalYear  and  School_code = @AppraisalSchool  and  EmployeeID  =  @EmployeeID   and  SessionID = @currentSession and ItemCode  ='SUM95' and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
						set @rValue =  'Completed'
					else if exists (select * from 	[dbo].[EPA_Appr_Rating] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and  SessionID = @currentSession and ItemCode ='SUM61'		)
						set @rValue = 'SignOff Required'  
					else if exists (select * from [dbo].[EPA_Appr_Comments] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and  SessionID = @currentSession and left(ItemCode,3) ='SUM')
						  set @rValue = 'Incompleted'
					else if exists (select * from  [dbo].[EPA_Appr_Comments_Observation] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and  SessionID = @currentSession and left(ItemCode,3) ='OBS')
						  set @rValue = 'Incompleted'
					else
						set @rValue = 'Not Start' 
			end	
		  if @AppraisalCycle ='LTO'
			 begin
					if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  = @AppraisalYear  and  School_code = @AppraisalSchool  and  EmployeeID  =  @EmployeeID  and  SessionID = @currentSession and   ItemCode  ='SUM95' and SignOff_Type='Appraisee' and SignOff_Action  ='Sign Off')
						set @rValue =  'Completed'
					else if exists (select * from 	[dbo].[EPA_Appr_Rating] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and  SessionID = @currentSession  and ItemCode ='SUM61'		)
						set @rValue = 'SignOff Required'  
					else if exists (select * from [dbo].[EPA_Appr_Comments] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and  SessionID = @currentSession and left(ItemCode,3) ='SUM')
						  set @rValue = 'Incompleted'
					else if exists (select * from  [dbo].[EPA_Appr_Comments_Observation] where  School_year = @AppraisalYear   and  School_code = @AppraisalSchool  and EmployeeID  =  @EmployeeID   and  SessionID = @currentSession and left(ItemCode,3) ='OBS')
						  set @rValue = 'Incompleted'
					else
						set @rValue = 'Not Start' 
			 end	

*/
 


