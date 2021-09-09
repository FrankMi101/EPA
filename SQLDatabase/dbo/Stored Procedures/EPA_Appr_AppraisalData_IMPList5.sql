








        


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 5, 2018 
-- Description:	get and update PPA Annual Performance Plan
-- ==================================================================================
 
 
create proc [dbo].[EPA_Appr_AppraisalData_IMPList5]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null,
	@Area			varchar(20)= null,
	@ItemCode		varchar(10)= null,  
	@SeqNo			varchar(10)= null,
	@GoalItem		varchar(20)= null,
	@Value			varchar(500) = null   

	 
as

set nocount on
 
 
if @Value is null
    begin
		if not exists (select * from  [dbo].[EPA_Appr_Comments_AIP] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  )
			insert into  [dbo].[EPA_Appr_Comments_AIP] 
			([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[Criteria],[Concern],[Practices],[Steps],[Indicators],[Completed])
			select @SchoolYear,@SchoolCode,@SessionID,@EmployeeID,@ItemCode, IDs, [Criteria], '','','','','' 
			from [dbo].[EPA_Appr_IMPComments_Default]


		select   [SequenceNo] as SeqNo,[Criteria],[Concern],[Practices],[Steps],[Indicators],[Completed]
		from  [dbo].[EPA_Appr_Comments_AIP] 
		where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  
		order by SequenceNo
	end
else
   begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_AIP] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and SequenceNo = @SeqNo)	
				begin
					-- insert into dbo.EPA_Appr_Comments_AIP_Bak
					--([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[Goals],[StrategyAction],[Practices],[Indicators],[Results],action_User,action_Date,lu_user,lu_function,lu_date)
					--select [School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[Goals],[StrategyAction],[Practices],[Indicators],[Results],@UserID,getdate(),lu_user,lu_function,lu_date
					--from dbo.EPA_Appr_Comments_AIP
					--where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and SequenceNo = @SeqNo

					if 	@GoalItem ='Concern'	     
						  update  [dbo].[EPA_Appr_Comments_AIP]
						  set Concern = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and SequenceNo = @SeqNo    and ItemCode = @ItemCode
 		 
					else if @GoalItem ='Steps'	     
						  update  [dbo].[EPA_Appr_Comments_AIP]
						  set Steps = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and SequenceNo = @SeqNo    and ItemCode = @ItemCode
					else if @GoalItem ='Practices'	     
						  update  [dbo].[EPA_Appr_Comments_AIP]
						  set Practices = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and SequenceNo = @SeqNo    and ItemCode = @ItemCode
					else if @GoalItem ='Indicators'	     
						  update  [EPA_Appr_Comments_AIP]
						  set Indicators = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and SequenceNo = @SeqNo    and ItemCode = @ItemCode
 					else if @GoalItem ='Completed'	     
						  update  [EPA_Appr_Comments_AIP]
						  set Completed = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and SequenceNo = @SeqNo    and ItemCode = @ItemCode
				end
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end














