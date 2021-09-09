










 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 8, 2018 
-- Description: check Appraisal steps progress
-- ==================================================================================
 
-- [dbo].[EPA_Appr_AppraisalProcess_CheckViewStepsGo]     'get','mif','20172018','0529','00010558','Appraisal1','TPA','SUM','SUM51'
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_CheckViewStepsGo]     
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null,
	@ItemCode		varchar(10) = null  
as

set nocount on  
begin

	declare @ContentType varchar(30), @checkCode varchar(10) , @completeImg   varchar(50), @rValue varchar(10), @StepCheck varchar(1)

	-- Step 1 get previous step 
	 if @ItemCode in ('ALP11','LOG11','STR11')--,'SUM11','IMP11','ENR11','OBS11','AGP11','APP11','AIP11','AMP11') --  Section Start Page nno need to check steps
	      set  @rValue ='Pass'
	 else
		 begin	    
				if (@Category ='LTO' and @ItemCode in ('STR95','STR99')) set @Category ='NTP'
	
				select  @checkCode = checkCode,  @ContentType =  Content_Type, @StepCheck = StepCheck
				from   [dbo].[EPA_sys_Appraisal_Definition]  
	 			where  Appraisal_Category =  @Category     and Appraisal_Area = left(@Area,3)   and Appraisal_Code =   @ItemCode 

				 

				if (@StepCheck ='0' or len(rtrim(isnull(@checkCode,''))) = 0)
					set  @rValue ='Pass'
				else
					begin
					   --  if @checkCode in ('SUM5X') 
						set  @ContentType = ( select  top 1   Content_Type from   [dbo].[EPA_sys_Appraisal_Definition]  
												where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3)   
												and Appraisal_Code =  case @checkCode when 'SUM5X' then 'SUM51' else @checkCode end )
 					
		  			   set  @rValue =  dbo.EPA_appr_AppraisalProcessCompleteStatus(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area, @checkCode, @ContentType, @StepCheck)  
 						
						if @rValue = '0'
							 set @rValue ='NotPass'
						else
							 set  @rValue ='Pass'
 				   end
		end		 	
	select @rValue
end



/*
 if @ItemCode in ('ALP11','LOG11','STR11','SUM11','IMP11','ENR11','OBS11','AGP11','APP11','AIP11','AMP11') --  Section Start Page nno need to check steps
	      set  @rValue ='Pass'
     else if @ItemCode ='SUM61'
		begin
	        set  @rValue =  dbo.EPA_appr_AppraisalProcessCompleteStatus(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area, 'SUM5', 'FullCompetencyList', '1')  
			if @rValue = '0'
				 set @rValue ='NotPass'
			else
				 set  @rValue ='Pass'
		end
	 else
		 begin	    

				if @StepCheck ='1'
					select    top  1     @checkCode =  Appraisal_Code, @ContentType =  Content_Type, @StepCheck = StepCheck
					from   [dbo].[EPA_sys_Appraisal_Definition]  
	 				where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3)   and Appraisal_Code <  @ItemCode   and StepCheck ='1'
  					order by  Appraisal_Code  DESC 

			   if len(isnull(@checkCode,'')) < 5 
				   set @rValue = 'Pass' 
			   else
				  begin
					 if @StepCheck ='0'
						set  @rValue ='Pass'
					 else
						begin
		  					  set  @rValue =  dbo.EPA_appr_AppraisalProcessCompleteStatus(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area, @checkCode, @ContentType, @StepCheck)  
 							  if @rValue = '0'
								 set @rValue ='NotPass'
							  else
								 set  @rValue ='Pass'
						 End
				 end
*/





