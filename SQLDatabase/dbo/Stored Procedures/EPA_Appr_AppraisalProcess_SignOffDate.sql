






     

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Decmber 09, 2017 
-- Description:   sign off signature
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SignOffDate]  
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

 if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category)
   select SignOff_Date
   from dbo.EPA_Appr_SignOff 
   where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category
else 
   select '' as SignOff_Date
 
  





