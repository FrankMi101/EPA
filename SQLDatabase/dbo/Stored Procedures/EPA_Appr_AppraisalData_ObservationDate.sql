
 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 27, 2017 
-- Description:	get and update observation date and comments
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_ObservationDate] --   'Date','mif','20172018','0529','00014245','Appraisal1','TPA' ,'','OBS21'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@Date			varchar(10) = null,   
	@Value			varchar(1000) = null   

	 
as

set nocount on 
 

 if @Date is null
	begin
	   	if @Operate ='dateObservationPre'  select @ItemCode ='OBS21', @Operate ='Date'
		if @Operate ='dateObservation'  select @ItemCode ='OBS22', @Operate ='Date'
		if @Operate ='dateObservationPost' select @ItemCode ='OBS23', @Operate ='Date'

		if @Operate ='Date' 
			begin
				if exists(select * from [dbo].[EPA_Appr_Comments_Observation] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category)
 					select  top 1 [dbo].[DateF]([Observation_Date],'YYYYMMDD') as   ObservationDate
						from  [dbo].[EPA_Appr_Comments_Observation] 
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category
				else
					select '' as ObservationDate
			end
		if @Operate ='Notes'
		    begin 
				if exists(select * from [dbo].[EPA_Appr_Comments_Observation] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category)
 					select top 1  Observation_Note  as ObservationNote
						from  [dbo].[EPA_Appr_Comments_Observation]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category
				else
					select '' as ObservationNote
			end
 
	end
else
   begin
		begin try		
		   begin tran
	   			if @Operate ='dateObservationPre'	select @ItemCode ='OBS21', @Operate ='Date'
				if @Operate ='dateObservation'		select @ItemCode ='OBS22', @Operate ='Date'
				if @Operate ='dateObservationPost'	select @ItemCode ='OBS23', @Operate ='Date'

	   	        if isnull(@Date,'') =''   set @Date = null

				if exists (select * from  [dbo].[EPA_Appr_Comments_Observation]
							where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and Category = @Category)
					  begin
						  if @Operate ='Date'
							  update  [dbo].[EPA_Appr_Comments_Observation]
							  set [Observation_Date]  = @Date,   lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category

						  else
							  update  [dbo].[EPA_Appr_Comments_Observation]
							  set [Observation_Date]  = @Date, Observation_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category
					  end
				else
					insert into   [dbo].[EPA_Appr_Comments_Observation]
					( School_Year,School_Code,EmployeeID,SessionID,ItemCode,[Observation_Date], Observation_Note,Category, lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Date, @Value, @Category, getdate(),@UserID, app_name())
		 
			--  if @ItemCode ='OBS21'  EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResult] @Operate,@Operate,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode

		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
  end
