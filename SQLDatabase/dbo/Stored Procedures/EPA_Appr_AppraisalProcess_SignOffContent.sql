







     

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Auguste 18, 2020 
-- Description:   sign off name
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SignOffContent]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null,
	@ItemCode		varchar(10)= null, 
	@UserRole		varchar(20)= null,
	@SignOffType	varchar(20)= null  
as

set nocount on 
 
	if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType and [Signature] != ''  and Category = @Category)
				select isnull([Signature],'') as SignOffName,
				       isnull(SignOff_Date,'') as SignOffDate,
					   isnull(SignOff_Action,'') as SignOffAction,
				  [dbo].[EPA_Appr_CheckSignOffComplete](@SignOffType,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,@UserRole, @Category ) as SignOffComplete

				from dbo.EPA_Appr_SignOff 
				where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType and [Signature] != ''  and Category = @Category
	else 
				select '' as SignOffName,
				       '' as SignOffDate,
					   'Sign Off' as SignOffAction,
					   'Incomplete' as SignOffComplete
 
  





