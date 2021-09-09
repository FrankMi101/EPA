



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 20, 2018 
-- Description:	check Session complete Result
-- ==================================================================================
 
 
CREATE  FUNCTION    [dbo].[EPA_Appr_Result_CompleteYear]
(@AppraisalYear varchar(8),
 @AppraisalYearPass varchar(8),
 @AppraisalSchool varchar(8),
 @EmployeeID  varchar(10),
 @AppraisalCycle  varchar(10),
 @SessionID   varchar(10)
 )
RETURNS varchar(15) 
AS  
BEGIN 

	declare @rValue varchar(15),    @currentSchoolYear varchar(8) , @TimeType varchar(20)
	set @currentSchoolYear =  [dbo].[EPA_CurrentApprYear](@AppraisalSchool) -- [dbo].[EPA_CurrentSchoolYear](8,25)
    set  @TimeType = 'Complete_Year'
    
	declare @Signcount int
	declare @pCount  int
	declare @pCount2  int
   
	if  @AppraisalCycle in ('NE1','NE2','NE3','NE4','UNA')
 	       set @rValue =''
	else if @AppraisalCycle ='E'
		begin
			 set @pCount = (Select count(*) from [dbo].[EPA_Appr_Rating] 
         					where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61' and Appraisal_chose = '3')  
									     
 			if @pCount >=1
				 set @rValue =  (select  top 1  case @TimeType when 'Complete_Year'  then year(Appraisal_Date) 
															   when 'Complete_Month' then month(Appraisal_Date)  
 														       else  day(Appraisal_Date)     end
					              from [dbo].[EPA_Appr_Rating] 
								 where School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61'   
								 order by Appraisal_Date DESC
								)
			else
				set  @rValue = '' 		
	    end
  else if  @AppraisalCycle   ='NTP'
     begin
	 	set @pCount = (Select count(*)  from[dbo].[EPA_Appr_Rating] 
         				where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61' and Appraisal_chose = '3')  
		if @pCount  < 2 
 			set @rValue ='' 
		else   
 			 set @rValue =  (select  top 1  case @TimeType when 'Complete_Year'  then year(Appraisal_Date) 
															   when 'Complete_Month' then month(Appraisal_Date)  
 														       else  day(Appraisal_Date)     end
					              from [dbo].[EPA_Appr_Rating] 
								 where School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61'   
								 order by Appraisal_Date DESC
								)
		 
	 end

  else if   @AppraisalCycle   ='LTO'
	 begin
	 	set @pCount = (Select count(*)  from[dbo].[EPA_Appr_Rating] 
         				where  School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61' and Appraisal_chose = '3')  
		if @pCount  >=1
 		 
 			 set @rValue =  (select  top 1  case @TimeType when 'Complete_Year'  then year(Appraisal_Date) 
															   when 'Complete_Month' then month(Appraisal_Date)  
 														       else  day(Appraisal_Date)     end
					              from [dbo].[EPA_Appr_Rating] 
								 where School_year  between @AppraisalYearPass and @AppraisalYear   and EmployeeID  =  @EmployeeID and ItemCode ='SUM61'   
								 order by Appraisal_Date DESC
								)
		 else
		   set @rValue ='' 
	 end
else 
    set @rValue =''  		
	 
    
	   
	 return  @rValue
END  



 






