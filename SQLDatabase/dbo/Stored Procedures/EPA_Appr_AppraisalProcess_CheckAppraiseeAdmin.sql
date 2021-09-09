


     

 
  

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 28, 2017 
-- Description: check appraisal admin match
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_CheckAppraiseeAdmin]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null ,
	@UserRole		varchar(20)= null  
as

set nocount on 

declare @Appraiser varchar(30) ,@Appraisee varchar(30)
 select top 1  @Appraiser =  Appraiser , @Appraisee = UserID  from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 

if @UserRole in ( 'Admin','SO')
    select 'Yes' as rValue
else if @UserRole ='Principal'
   begin
        if @Category ='PPA'
		   begin
				if  lower(@UserID) = lower(@Appraiser)	    
					select 'Yes' as rValue
				else
					select 'No' as rValue
			end	
        else
		    select 'Yes' as rValue 
   end
else if @UserRole = 'VP'
	begin
		 if @Category ='PPA'
		   begin
				if 	lower(@UserID) = lower(@Appraisee)	    
					select 'Yes' as rValue
				else
					select 'No' as rValue
			end	
        else
			begin
				if 	lower(@UserID) = lower(@Appraiser)	    
					select 'Yes' as rValue
				else
					select 'No' as rValue
			end	
	end
else if @UserRole ='Teacher'
    begin
		if 	lower(@UserID) = lower(@Appraisee)	    
			select 'Yes' as rValue
		else
			select 'No' as rValue
	end

else
   select 'No' as rValue
    
 

 






