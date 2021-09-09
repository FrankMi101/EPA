








-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 27, 2017 
-- Description:	get and ipdate appraisal Text content
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_Text]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
 	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@Value			varchar(5000) = null   

	 
as

set nocount on 
  
if @Operate ='CheckALP'
   begin
		if exists (select * from  [dbo].[EPA_Appr_Comments] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @ItemCode  and Category = @Category)
		   select 'View Last ALP'
        else
			select 'RollOver Last ALP'
   end  
else if @Operate = 'RollOver'
   begin
        declare @lastSchoolYear varchar(8) 
		set @lastSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous', @SchoolYear)

		insert into [dbo].[EPA_Appr_Comments]
			([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],Appraisal_Note,Category,lu_user,lu_function,lu_date)
		select @SchoolYear,[School_Code],[SessionID],[EmployeeID],[ItemCode],Appraisal_Note,Category,lu_user,lu_function,lu_date
		from [dbo].[EPA_Appr_Comments]
		where School_Year = @lastSchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @ItemCode   and Category = @Category

		select   Appraisal_Note
		from  [dbo].[EPA_Appr_Comments] 
		where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode    and Category = @Category
    end
else if @Value is null
    begin
	    if @ItemCode in ('SUM22','SUM33') set @ItemCode = REPLACE(@ItemCode,'SUM','APM')
		if @ItemCode in ('ALP11','SUM11')
 		    select  top 1 Assignment 
			from [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @SchoolYear and   Unit_ID = @SchoolCode and Employee_ID = @EmployeeID
		else
			 if exists (select * from [dbo].[EPA_Appr_Comments] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category)
				 select top 1  Appraisal_Note
				 from  [dbo].[EPA_Appr_Comments]
				 where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and Category = @Category
			 else
				select '' as Appraisal_Note
	end
else
   begin
		begin try
		   begin tran
				if @ItemCode in ('SUM22','SUM33') set @ItemCode = REPLACE(@ItemCode,'SUM','APM')
				if exists (select * from  [dbo].[EPA_Appr_Comments]
							where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category )
					  begin
						  insert into  [dbo].[EPA_Appr_Comments_Bak]
								(School_Year,School_Code,EmployeeID,SessionID,ItemCode,Appraisal_Note,lu_date,lu_user,lu_function, action_User,action_date)
						  select School_Year,School_Code,EmployeeID,SessionID,ItemCode,Appraisal_Note,lu_date,lu_user,lu_function, @UserID,getdate()
						  from  [dbo].[EPA_Appr_Comments]
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category

						  update  [dbo].[EPA_Appr_Comments]
						  set Appraisal_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category
					  end
				else
					insert into   [dbo].[EPA_Appr_Comments]
					( School_Year,School_Code,EmployeeID,SessionID,ItemCode,Appraisal_Note,Category,lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Value, @Category, getdate(),@UserID, app_name())
				if left(@ItemCode,3)  ='ALP' EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResultALP] @Operate, @Operate,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area,  @ItemCode
				if left(@ItemCode,3)  ='AGP' EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResultALP] @Operate, @Operate,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area,  @ItemCode
			--	if left(@ItemCode,4)  ='SUM3' EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResult] @Operate,@Operate,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode
 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
  end
   







