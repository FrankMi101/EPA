


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: May 19, 2018 
-- Description:   get user last sign off action 
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SignOffAction]  -- 'Supervisory','mif','20182019','0529','00042640','Appraisal1','NTP','SUM95','SO','Frank Mi','2018/05/05','Sign Off','1'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10) = null,
	@ItemCode		varchar(10)= null, 
	@UserRole		varchar(20)= null 
	 
as

set nocount on 
 
	if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @UserRole  and Category = @Category)
			select top 1 SignOff_Action from dbo.EPA_Appr_SignOff 
			where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @UserRole and [Signature] != ''  and Category = @Category
			order by lu_date DESC
	else 
			select 'Sign Off' as rVal
 

