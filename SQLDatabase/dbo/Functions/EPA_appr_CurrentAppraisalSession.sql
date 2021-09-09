
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Feburary 20, 2018 
-- Description:	get Appraisal current Session
-- ================================================================================== 
-- select [dbo].[EPA_appr_CurrentAppraisalSession]('20192020','00033591','0529','NTP','NTP')

CREATE FUNCTION [dbo].[EPA_appr_CurrentAppraisalSession]  
(@AppraisalYear varchar(8),
 @EmployeeID  varchar(10),
 @AppraisalSchool varchar(8),
 @AppraisalCycle  varchar(10),
 @AppraisalType   varchar(10)
 )
RETURNS varchar(120)
AS 
  BEGIN  
		declare @rVal1 varchar(100)
		declare @rValue varchar(120),  @cSession varchar(15), @currentSchoolYear varchar(8),@PerviousSchoolYear varchar(8), @lastSession varchar(10), @PreviousPhase varchar(10)
		declare @SatisfactoryCount int , @Rate varchar(1), @sCount int, @impCount int
		set @currentSchoolYear = [dbo].[EPA_CurrentApprYear](@AppraisalSchool)  --  [dbo].[EPA_CurrentSchoolYear](8,25)
		set @PerviousSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@currentSchoolYear)
		set @PreviousPhase = [dbo].[EPA_getAppraisalPhaseByYear](@EmployeeID,@PerviousSchoolYear)
 	    if @AppraisalCycle in ('NTP','E')
		  begin
		     if @AppraisalCycle <> @PreviousPhase
			    set @PerviousSchoolYear = @currentSchoolYear
		  end
        if @AppraisalCycle = 'LTO'  set @PerviousSchoolYear = @AppraisalYear

 -- Step 1 check those No Evaluable year staff
if @AppraisalCycle   in ('NE0','NE1','NE2','NE3','NE4','UNA')
   set @cSession ='Appraisal1'
-- step 2 check Non Current school year staff
else if @AppraisalYear < @currentSchoolYear
    begin
	    if exists (select * from  [dbo].[EPA_Appr_SignOff] where   school_year = @AppraisalYear and EmployeeID = @EmployeeID and ItemCode = 'SUM95' and Category = @AppraisalType and SignOff_Type = 'Appraisee')
			begin
				set @cSession = (select top 1  SessionID    from   [dbo].[EPA_Appr_SignOff]  
 								where  school_year = @AppraisalYear and EmployeeID = @EmployeeID and Category = @AppraisalType -- and SignOff_Type = 'Appraisee'
								order by  SessionID DESC)	
               -- for Pervious school year, No need change the session, only get last session user working on
				--if right(@cSession,1) < 2 
				--   begin
				--	   if exists (select * from  [dbo].[EPA_Appr_Rating]  where School_Year = @AppraisalYear and EmployeeID = @EmployeeID and ItemCode ='SUM61' and Appraisal_chose !='3')	
				--		 set @cSession = 'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end  	
				--	end
			end								 
        else  
			set @cSession = 'Appraisal1'
   end
else -- Step 3 check current school year 
   begin
        set @rVal1 =  ' step 1' --  @cSession 
        if not exists (select * from   [dbo].[EPA_Appr_SignOff] 
					where  School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID  and ItemCode ='SUM95'  and Category = @AppraisalType and SignOff_Action ='Sign Off') --and SignOff_Type = 'Appraisee' )
     		set @cSession = 'Appraisal1' 
		else
			begin
				 set @cSession =(select top 1 SessionID  from [dbo].[EPA_Appr_SignOff]   
										where  School_Year between    @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID and ItemCode ='SUM95'  and Category = @AppraisalType  and SignOff_Action ='Sign Off' -- and SignOff_Type = 'Appraisee'
										order by School_Year DESC, SessionID DESC)

                 
			     set @sCount =(select count(*) from [dbo].[EPA_Appr_SignOff]  
							   where  School_Year between  @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID  and ItemCode ='SUM95' and Category = @AppraisalType and SessionID =  @cSession and SignOff_Action ='Sign Off'  )

             --  set @rVal1 = ' step 2 -- Session=' + @cSession  + '  sCount=' +   cast(@sCount as varchar(1))
				if @AppraisalCycle ='LTO'   
				     begin  
					     if  exists(select top 1 * from [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @AppraisalYear and Unit_ID = @AppraisalSchool and Employee_ID = @EmployeeID and Appraisal_type ='NTP')
						     begin
								     if @sCount > 1  set   @sCount = 2 -- set @cSession = 'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end
							 end	
						 else if exists( select top 1 * from [dbo].[EPA_Appr_EmployeeList] where  Appraisal_year = @AppraisalYear and Unit_ID != @AppraisalSchool and Employee_ID = @EmployeeID and Appraisal_type ='LTO')
							 begin	
						        set @cSession =(select top 1 SessionID  from [dbo].[EPA_Appr_SignOff]   
										where  School_Year =  @currentSchoolYear  and School_Code = @AppraisalSchool and EmployeeID = @EmployeeID and  ItemCode ='SUM95'  and Category = @AppraisalType  and SignOff_Action ='Sign Off' -- and SignOff_Type = 'Appraisee'
										order by School_Year DESC, SessionID DESC)
							end
						 else
							begin
								if @sCount > 1  set @cSession = 'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end
							end
					 end	
 			    if rtrim(@AppraisalCycle) ='E'
				   begin
				       if @sCount > 1
					      begin
								set @Rate = (select top 1 Appraisal_chose from  [dbo].[EPA_Appr_Rating]  
											  where School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID and SessionID = @cSession and ItemCode ='SUM61' and Category = @AppraisalType)							 		  						
							    if isnull(@Rate,'0') <> '3' 					        
									begin
									     
 										if exists (select * from   [dbo].[EPA_Appr_SignOff]  
												   where  School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID and Category = @AppraisalType  and SignOff_Type = 'Appraisee'  and SignOff_Action ='Sign Off' and ItemCode ='IMP95')
											set @cSession = 'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end 
										--else
										--	 set @cSession  =  @cSession 
									end
						 end
				   end 
			  if @AppraisalCycle ='NTP'  
				  begin
				      
					  if @sCount > 1
					     begin
						   
							declare @Count2S int
							set @Count2S = (select count(*) from [dbo].[EPA_Appr_Rating]   
											 where School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID and ItemCode ='SUM61' and Appraisal_chose ='3' and Category = @AppraisalType)
                            if @Count2S =2
							    set @cSession = (select top 1 SessionID   from [dbo].[EPA_Appr_Rating]   
											 where School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID and ItemCode ='SUM61' and Appraisal_chose ='3' and Category = @AppraisalType
											 order by School_Year DESC, SessionID DESC 
											 )
							else
								begin
								   
									set @Rate = (select top 1 Appraisal_chose from  [dbo].[EPA_Appr_Rating]  
												 where School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID and SessionID = @cSession  and ItemCode ='SUM61' and Category = @AppraisalType  order by SessionID DESC)							 
								  --  set @rVal1 = @rVal1 + ' Step 3 --  Rate= ' +   cast(@Rate as varchar(1))   

									if @Rate = '3'
								   		set @cSession =  'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end  
									else 
										begin
										    set @impCount = (select count(*) from  [dbo].[EPA_Appr_SignOff] where  School_Year between @PerviousSchoolYear and @currentSchoolYear and EmployeeID = @EmployeeID  and SessionID = @cSession and Category = @AppraisalType  and SignOff_Action ='Sign Off'  -- and SignOff_Type = 'Appraisee'
																											 and ItemCode =  case @Rate when '4' then 'ENR95' when '5' then 'IMP95' else 'SUM95' end) 
										   
										    if @impCount >= 2
 												set @cSession =  'Appraisal' + case right(@cSession,1) when '1' then '2' when '2' then '3' else '4' end 
											--else
											--	set  @cSession = @cSession  
										end	
								end

						end
				   end
			end
	end                                                                                                                                                                                                                                 
	set @cSession = isnull(@cSession,'Appraisal1') 
   
   return @cSession --+ @rVal1
End	 

