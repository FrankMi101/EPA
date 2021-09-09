
CREATE  FUNCTION    [dbo].[EPA_Appr_Result_OutCome]  
(@AppraisalYear varchar(8),
 @AppraisalYearPass varchar(8),
 @AppraisalSchool varchar(8),
 @EmployeeID  varchar(10),
 @AppraisalCycle  varchar(10),
 @SessionID   varchar(10)
 )
RETURNS varchar(50) 
AS  
BEGIN 

	declare @rValue varchar(50),     @gCount int ,  @sCount  int ,  @tCount  int, @rate varchar(2) 
--	set @currentSchoolYear =[dbo].[EPA_CurrentSchoolYear](8,25)  @currentSchoolYear varchar(8)
  
   
if @AppraisalCycle in ('NE1','NE2','NE3','NE4','UNA')
    set @rValue =''
else
	begin
	    if @AppraisalCycle in ('E','LTO') set @AppraisalYearPass = @AppraisalYear
		set @rate = (select top 1 dbo.EPA_GetRateByLevel( Appraisal_chose,'TPA') from  [dbo].[EPA_Appr_Rating]  where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61' order by SessionID DESC)
 		set @sCount = (Select count(*) from [dbo].[EPA_Appr_Rating]  where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61' and Appraisal_chose = '3')  
		set @tCount = (Select count(*) from [dbo].[EPA_Appr_Rating]  where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61' )  
		set @gCount = (Select count(*) from [dbo].[EPA_Appr_SignOff]  where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode  ='SUM95' and SignOff_Action  ='Sign Off' and SignOff_Type='Appraisee')  
	 


		if @tCount = 0 	
			 begin
				if exists (select * from [dbo].[EPA_Appr_Comments] where  School_year  between @AppraisalYearPass and @AppraisalYear and  EmployeeID = @EmployeeID   and left(ItemCode,3) ='SUM')
					set @rValue = 'Incompleted'
				else    	
					set @rValue = 'Not Started'
			 end									
		else if @tCount = 1 	
	 		begin
			   if @sCount = 1
			      if @gCount = 1
					  set @rValue =  case @AppraisalCycle When 'NTP' then 'Need 2nd Appraisal' else  @rate End
                  else
					  set @rValue =  'SignOff Required'
			   else 
			     if @gCount = 1
					  set @rValue =  'Need 2nd Appraisal'  
                  else
					  set @rValue =  'SignOff Required' 
			end
		else if @tCount  = 2
			begin
				if @sCount =2 
					if @gCount = 2
						if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode  ='STR95' and SignOff_Action  ='Sign Off' and SignOff_Type='Appraiser')
							set @rValue = 'Successful completion of NTIP'  
						else
							set @rValue = @rate
					 else
						set @rValue = 'SignOff Required'
				else
					 if @gCount = 2
						set @rValue = 'Need 3rd Appraisal' 
					 else
						set @rValue = 'SignOff Required'
				end 
			
		else if @tCount  = 3
			begin
				if @sCount = 2
					if @gCount = 3
						if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode  ='STR95' and SignOff_Action  ='Sign Off' and SignOff_Type='Appraiser')
							set @rValue = 'Successful completion of NTIP'  
						else
							set @rValue = @rate
					 else
						set @rValue = 'SignOff Required'
                else
					 if @gCount = 3
						set @rValue = 'Need 4th Appraisal' 
					 else
						set @rValue = 'SignOff Required'
 					
			end 
		else if @tCount  = 4
			begin
				if @sCount = 2
					 if @gCount = 4
						if exists (select * from [dbo].[EPA_Appr_SignOff]  where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode  ='STR95' and SignOff_Action  ='Sign Off' and SignOff_Type='Appraiser')
							set @rValue = 'Successful completion of NTIP'  
						else
							set @rValue = @rate  
					 else
						set @rValue = 'SignOff Required'
                else
					 if @gCount = 4
						set @rValue = 'Recommended Termination'  
					 else
						set @rValue = 'SignOff Required'
 				
			end 							
	end
 
	 return  @rValue -- + '-'+  cast(@tCount as char(2)) + '-'+ cast(@sCount as varchar(2))  + '-'+  cast(@gCount as char(2))
END  


 


