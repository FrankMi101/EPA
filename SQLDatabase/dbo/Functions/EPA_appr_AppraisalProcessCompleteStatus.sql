




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 12, 2017 , correction by Frank @2018/01/05
-- Description:	get Appraisal progress status
-- ================================================================================== 
  
 -- select [dbo].[EPA_appr_AppraisalProcessCompleteStatus]('20172018','0529','00003862','Appraisal1','TPA','ALP','ALP11','Text','1')
CREATE FUNCTION [dbo].[EPA_appr_AppraisalProcessCompleteStatus]
(
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null ,
	@Category		varchar(20)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10) = null,
	@contentType	varchar(20) = null,
	@StepCheck		varchar(1) =null  
	 
)
RETURNS varchar(1)
AS 

  BEGIN
	 declare @rValue varchar(1), @CompetnecyCount int , @dCount int
     if  @contentType ='Report'
	 	 set @rValue = '1' --  '../images/pdfReport.png'
	 else if  @contentType ='Signature'
	     begin
		    if exists (select * from [dbo].[EPA_Appr_SignOff] where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and Category = @Category and SignOff_Action = 'Sign Off' and SignOff_date  is not null)
	 		   set @rValue = '1' --  '../images/Signature.png'
			else 
			   set   @rValue = '0' 
		 end
     else if  @contentType ='Label' and @ItemCode ='SUM5'
	     begin
					 set @CompetnecyCount = ( select count(*) from [dbo].[EPA_Appr_Comments_DomainCompetency]  where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and left(ItemCode,4) = 'SUM5'  and Category = @Category )
	
					 set @rValue = case @Category	when 'NTP' then case @CompetnecyCount when 8  then '1'  when 9 then '1' else '0' end
													when 'LTO' then case @CompetnecyCount when 7  then '1'  when 8 then '1' else '0' end
													when 'TPA' then case @CompetnecyCount when 16 then '1' when 17 then '1' else '0' end
													when 'PPA' then '1' else '0' end	 
		end
     else if  @contentType ='CompetencyList'
	     begin 
			 if  @ItemCode ='SUM5X' 
			      set @CompetnecyCount = ( select  count(*)   from [dbo].[EPA_Appr_Comments_DomainCompetency] --  where school_year ='20172018' and EmployeeID ='00033591'  and  left(ItemCode,4)  = 'SUM5' and category ='NTP'
										  where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and  left(ItemCode,4)  = 'SUM5' and Category = @Category )
			 else
  			      set @CompetnecyCount = ( select count(*) from [dbo].[EPA_Appr_Comments_DomainCompetency]  
										 where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and   ItemCode   = @ItemCode and Category = @Category )

		 
			if  @Category = 'LTO'
			      set @dCount =7
			else if  @Category = 'NTP'  
			     begin
					  if @ItemCode ='SUM5X' 
							set @dCount = 8
					  else	
						   set @dCount  =  (Select count(*)  from  [dbo].[EPA_Appraisal_Competency_NTP] where  DomainID = right(@ItemCode,1) and Evidence_Level ='8')
 				 end
			else
				begin
					 if @ItemCode ='SUM5X' 
						set  @dCount = 16
					 else	
						set @dCount  =   (Select count(*)  from [dbo].[EPA_Appraisal_Competency_TPA]   where DomainID   = right(@ItemCode,1)  )

			 	end

           if @CompetnecyCount >= @dCount
				set @rValue =  '1'
			else
				set @rValue =  '0'  
	    
			 
		 end
      else if  @contentType ='LogList'
	     begin
		      if @Area ='LOG'
			     begin
					if exists (select * from  [dbo].[EPA_Appr_LookFors_EvidenceLog_chose] where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode )
						set @rValue =  '1'
					else
						set @rValue =  '0'  
				 end
			 else
				begin
					 if exists (select * from [dbo].[EPA_Appr_EvidenceLog_DomainCompetency]  where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode)
						set @rValue =  '1'
					 else
						set @rValue =  '0'  
				end
		 end
     else if  @contentType in ('TextS','Date')
	    begin
			 if exists (select * from [dbo].[EPA_Appr_Comments_small]  where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and Category = @Category )
				set @rValue =  '1'
			 else
				set @rValue =  '0'
		end
     else if  @contentType = 'ObsDate'
	    begin
			 if exists (select * from [dbo].[EPA_Appr_Comments_Observation]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and Category = @Category )
				set @rValue =  '1'
			 else
				set @rValue =  '0'
		end
   else if  @contentType = 'ObsDate3'
	    begin
		    declare @ObsDatecount int
			set @ObsDatecount = (select count(*)  from [dbo].[EPA_Appr_Comments_Observation]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and Category = @Category  )
			 if @ObsDatecount = 3
				set @rValue =  '1'
			 else
				set @rValue =  '0'
		end
	else if @contentType in ( 'S-U-RadioList','S-U-D-RadioList')
	    begin
			 if exists (select * from [dbo].[EPA_Appr_Rating]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and Category = @Category )
				set @rValue =  '1'
			 else
				set @rValue =  '0'
		end
	 else if @contentType ='CheckBoxL'
		begin
			 if exists (select * from [dbo].[EPA_Appr_Comments_small]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and Category = @Category )
				set @rValue =  '1'
			 else
				set @rValue =  '0'

		end
	 else if @contentType ='TextAGP'
		begin
			 if exists (select * from [dbo].[EPA_Appr_Comments_AGP]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and len(AreaForGrowth) > 5)
				set @rValue =  '1'
			 else
				set @rValue =  '0'

		end
	 else if @contentType ='TextAPP'
		begin
			 if exists (select * from [dbo].[EPA_Appr_Comments_APP]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and len(Goals) > 5)
				set @rValue =  '1'
			 else
				set @rValue =  '0'

		end
	 else if @contentType ='TextIMP'
		begin
			 if exists (select * from [dbo].[EPA_Appr_Comments_AIP]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode  )
				set @rValue =  '1'
			 else
				set @rValue =  '0'

		end
	 else if @contentType ='TextIMP2'
		begin
			 if exists (select * from [dbo].[EPA_Appr_Comments_AIP2]   where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and ItemCode = @ItemCode and len(Needs) > 5)
				set @rValue =  '1'
			 else
				set @rValue =  '0'

		end
	 else if @contentType ='TextM'
		begin
			 if exists (select * from  [dbo].[EPA_Appr_Strategy]     where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID   and left(ItemCode,5) = @ItemCode) --and SessionID = @SessionID
				set @rValue =  '1'
			 else
				set @rValue =  '0'

		end
	 else if @contentType ='DateText'
		begin
			 if exists (select * from   [dbo].[EPA_Appr_Comments_APM]      where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and left(ItemCode,5) = @ItemCode)
				set @rValue =  '1'
			 else
				set @rValue =  '0'

		end

     else if  @contentType ='Text'
	    begin
		     if  @ItemCode='ALP5'
				 if exists (select * from [dbo].[EPA_Appr_Comments] where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and left(ItemCode,4) =  @ItemCode and Category = @Category )
					set @rValue =  '1'
				 else
					set @rValue =  '0'
             else if @ItemCode in ('ALP11')--,'ENR11','IMP11')
			     begin
				     if exists (select * from [dbo].[EPA_Appr_Comments] where  School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and  ItemCode  = @ItemCode and Category = @Category )
						  set @rValue =  '1'
					 else if exists(select * from [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @SchoolYear and   Unit_ID = @SchoolCode and Employee_ID = @EmployeeID and Assignment !='')
						  set @rValue ='1'
					 else
						set @rValue =  '0' 	 
			     end
			else if @ItemCode in ( 'SUM11')--,'ENR11','IMP11')
			     begin
				    if @Category ='LTO'
						 if exists (select * from [dbo].[EPA_Appr_Assignment] where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and  ItemCode  = @ItemCode )
								set @rValue =  '1'
							 else
								set @rValue =  '0' 
					else
				        if exists (select * from [dbo].[EPA_Appr_Comments] where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and  ItemCode  = @ItemCode and Category = @Category )
							 set @rValue =  '1'
						else if exists(select * from [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @SchoolYear and   Unit_ID = @SchoolCode and Employee_ID = @EmployeeID and Assignment !='')
						     set @rValue ='1'
						else
							set @rValue =  '0' 								
			     end
			 else
			    begin
					 if @ItemCode ='SUM62' set  @ItemCode ='SUM61'
					 if @ItemCode in ('SUM22','SUM33') set @ItemCode = REPLACE(@ItemCode,'SUM','APM')
					 
					 if exists (select * from [dbo].[EPA_Appr_Comments] where   School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and  ItemCode  = @ItemCode and Category = @Category )
						set @rValue =  '1'
					 else
						set @rValue =  '0'
				end
		end
    else 
       set @rValue =  '0'

	RETURN(@rValue )

		 
 END 

   
