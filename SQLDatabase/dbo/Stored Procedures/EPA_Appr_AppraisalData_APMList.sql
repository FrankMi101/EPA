 
        


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 30, 2020 
-- Description:	get and update PPA Annual Growth Plan
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_APMList]   
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,
	@vDate			varchar(10) = null,   
	@Value			varchar(800)= null

	 
as

set nocount on

if @Value is null
    begin
		if exists(select top 1 * from [dbo].[EPA_Appr_Comments_APM]  where  School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @ItemCode)
			select Appraisal_Date  as MeetingDate, Appraisal_Note as MeetingContent
			from [dbo].[EPA_Appr_Comments_APM]  where  School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @ItemCode
		else
			select ''  as MeetingDate, '' as MeetingContent
    end
else
	 begin
			begin try
			   begin tran
					if exists(select top 1 * from [dbo].[EPA_Appr_Comments_APM]  where  School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @ItemCode)
						begin
							insert into dbo.EPA_Appr_Comments_APM_Bak
										([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],Appraisal_Date,Appraisal_Note,lu_user,lu_function,lu_date)
							select [School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],Appraisal_Date,Appraisal_Note,lu_user,lu_function,lu_date
							from dbo.EPA_Appr_Comments_APM
							where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  
  
							update  [dbo].[EPA_Appr_Comments_APM]
							set  Appraisal_Date = @vDate, Appraisal_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and  ItemCode = @ItemCode
						end
					else
						insert into [dbo].[EPA_Appr_Comments_APM]
								([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],Appraisal_Date,Appraisal_Note,lu_user,lu_function,lu_date) 
						Values (@SchoolYear,@SchoolCode,@SessionID,@EmployeeID,@ItemCode,@vDate,@Value, @UserID,app_name(),getdate())
	
					EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResult] @Operate, @Operate,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area,  @ItemCode

		 
			   commit tran	
					Select 'Successfully' as rValue
		   end try
		   begin catch
			   Rollback tran
			   Select 'Failed' as rValue		
		   end catch
	  end









   

					 


