




 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 27, 2017 
-- Description:	get and update observation date and comments
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_ObservationDate2] --   'Date','mif','20172018','0529','00014245','Appraisal1','TPA' ,'','OBS21'
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
 

 if @Operate in('Get','GetDate','GetText')
	begin
		  if exists (select * from  [dbo].[EPA_Appr_Comments_Observation] 
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode)
				 begin
					if @Operate ='GetDate' 
						select top 1[dbo].[DateF]([Observation_Date],'YYYYMMDD') as   Observation_Date
						from  [dbo].[EPA_Appr_Comments_Observation]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
					else
						select top 1  isnull(Observation_Note,'')
						from  [dbo].[EPA_Appr_Comments_Observation] 
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
				 end
		 else
			select '' as 	Observation_Date	 	
	end
else
   begin
		begin try		
		   begin tran
 
				if exists (select * from  [dbo].[EPA_Appr_Comments_Observation]
							where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode )
					  begin
						  if @Operate ='SaveDate'
							  update  [dbo].[EPA_Appr_Comments_Observation]
							  set [Observation_Date]  = @Date,   lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode

						  else
							  update  [dbo].[EPA_Appr_Comments_Observation]
							  set [Observation_Date]  = @Date, Observation_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode
					  end
				else
					insert into   [dbo].[EPA_Appr_Comments_Observation]
					( School_Year,School_Code,EmployeeID,SessionID,ItemCode, Category, [Observation_Date], Observation_Note,lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode,@Category, @Date, @Value, getdate(),@UserID, app_name())
		 
			--  if @ItemCode ='OBS21'  EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResult] @Operate,@Operate,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode

		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
  end



   



