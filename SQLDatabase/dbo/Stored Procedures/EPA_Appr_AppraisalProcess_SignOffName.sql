






     

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Auguste 13, 2020 
-- Description:   sign off name
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SignOffName]  
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

   if @SignOffType ='DemandUserRole'
			begin
				if exists(select * from  dbo.EPA_Appr_SignOff_Demand where   school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Respons_UserID is null  and Category = @Category)
					select top 1 isnull(SignOff_Type,'')
					from dbo.EPA_Appr_SignOff_Demand where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Respons_UserID is null  and Category = @Category
				else
					select '' as rValue 
			end
	    else if @SignOffType ='NoticeAction'
			begin
			   if exists (select * from   dbo.EPA_Appr_SignOff_Demand where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Respons_UserID is null  and Category = @Category)
					select top 1 rtrim(isnull(SignOff_action,''))
					from dbo.EPA_Appr_SignOff_Demand                  
					where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode  and   Respons_UserID is null   and Category = @Category -- and SignOff_Type = @UserRole
			   else if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @UserRole   and Category = @Category)
					select top 1 rtrim(isnull(SignOff_action,''))
					from dbo.EPA_Appr_SignOff where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @UserRole  and Category = @Category
				else
					select 'Sign Off' as rVal
			end
		else if @SignOffType ='Appraisal'	
		  	begin
				if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category)
					select top 1 isnull(SignOff_action,'')
					from dbo.EPA_Appr_SignOff where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category
				else
					select 'Sign Off' as rVal

			end			 
		else
			if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType and [Signature] != ''  and Category = @Category)
				select isnull([Signature],'')
				from dbo.EPA_Appr_SignOff 
				where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType and [Signature] != ''  and Category = @Category
			else 
				select '' as [Sginature]
 
  





