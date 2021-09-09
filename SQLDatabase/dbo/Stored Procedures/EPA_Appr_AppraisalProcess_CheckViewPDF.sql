




 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 8, 2018 
-- Description: check PDF view Permission
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_CheckViewPDF] -- 'get','mif','20172018','0529','00010452','Appraisal1','NTP','STR','STR22'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null,
	@ItemCode		varchar(10) = null,
	@UserRole		varchar(10)= null  
as

set nocount on  
begin
	
	declare @signOff varchar(10)
	set  @signOff = [dbo].[EPA_Appr_CheckSignOffComplete]( @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,@UserRole )
	if @signOff ='Complete'
	   select 'Pass' as rValue
    else
		begin
			if @Area in ('ALP','LOG','AGP')
				select 'Pass' as rValue
			else
				if exists(select * from  [dbo].[EPA_Appr_Comments_ViewPermission] where School_year = @SchoolYear and school_code =@SchoolCode and employeeID =@EmployeeID  and SessionID = @SessionID and ItemArea = @Area and Permission in ('SignOff','Allow'))
					select 'Pass' as rValue 
 				else
					select 'NotPass' as rValue
		end
		 
end






