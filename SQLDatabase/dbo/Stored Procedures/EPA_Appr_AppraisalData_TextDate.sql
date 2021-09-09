




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Febrary 6, 2018 
-- Description:	get and update principal performance meeting 
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextDate]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@Value			varchar(800) = null,
	@vDate			varchar(10) = null  

	 
as

set nocount on 
  
 if @Value is null
    begin
	 
			 if exists (select * from [dbo].[EPA_Appr_Comments_APMeeting]  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode)
				 select top 1  Appraisal_Note as MeetingContent, [dbo].[DateF](Appraisal_date,'YYYYMMDD') as MeetingDate
				 from  [dbo].[EPA_Appr_Comments_APMeeting]
				 where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
			 else
				select '' as MeetingContent, '' as MeetingDate
	end
else
   begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_APMeeting]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode )
				  begin
 
					  update [dbo].[EPA_Appr_Comments_APMeeting]
					  set Appraisal_Note = @Value, appraisal_date = @vDate,  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
					  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
				  end
			else
				insert into  [dbo].[EPA_Appr_Comments_APMeeting]
				( School_Year,School_Code,EmployeeID,SessionID,ItemCode,Appraisal_Note, Appraisal_date,  lu_date,lu_user,lu_function)
				values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Value,@vDate, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end







