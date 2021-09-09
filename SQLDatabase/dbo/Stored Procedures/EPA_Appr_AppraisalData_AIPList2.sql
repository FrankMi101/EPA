




       


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Febrary 10, 2018 
-- Description:	get and update PPA Imptovement  Plan
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_AIPList2]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@SeqNo			varchar(10)= null,
	@ActionItem		varchar(20)= null,
	@Value			varchar(2500) = null   

	 
as

set nocount on
if @Operate in ('AddNewGoal','AddNew')
    begin
		declare @GoalCount int
		set @GoalCount = (select top 1 SequenceNo from [dbo].[EPA_Appr_Comments_AIP2] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID  and ItemCode = @ItemCode
						  order by SequenceNo DESC)
        insert into  [dbo].[EPA_Appr_Comments_AIP2] 
			([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[Needs],[Strategies] )
			values (@SchoolYear,@SchoolCode,@SessionID,@EmployeeID,@ItemCode,@GoalCount + 1 ,'','' )

		select   SequenceNo as SeqNo, [Needs],[Strategies]
		from  [dbo].[EPA_Appr_Comments_AIP2] 
		where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  
		order by SequenceNo
	end
 
else if  @Operate ='Delete'
    begin
	  	begin try
			if exists (select *  from  [dbo].[EPA_Appr_Comments_AIP2] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and SequenceNo = @SeqNo)	
				begin
				   --insert into dbo.EPA_Appr_Comments_AIP2_Bak
					--([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[AreaForGrowth],[GrowthStrategy],[TimeLine],[FutureGrowth],action_User,action_Date,lu_user,lu_function,lu_date)
					--select [School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[AreaForGrowth],[GrowthStrategy],[TimeLine],[FutureGrowth],@UserID,getdate(),lu_user,lu_function,lu_date
					--from dbo.EPA_Appr_Comments_AIP2
					--where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and SequenceNo = @SeqNo


				 	delete [dbo].[EPA_Appr_Comments_AIP2]
 				    where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and SequenceNo = @SeqNo   and ItemCode = @ItemCode
				    declare @cInt int ,@seq int
					set @cInt =1
					  DECLARE AGPList CURSOR 
					  FOR  select Distinct SequenceNo 
						   from  [dbo].[EPA_Appr_Comments_AIP2] 
						   where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID  and ItemCode = @ItemCode 
 						   order by SequenceNo
					  OPEN AGPList
					  FETCH NEXT FROM AGPList  INTO  @Seq 
					  WHILE  @@FETCH_STATUS = 0
						  begin
							 if @Seq != @cInt
							    update [dbo].[EPA_Appr_Comments_AIP2]  set SequenceNo = @cInt
								where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID  and  SequenceNo = @Seq   and ItemCode = @ItemCode 
							 set @cInt = @cInt +1

							  FETCH NEXT FROM AGPList  INTO  @Seq  
						   end
					  CLOSE AGPList
					  DEALLOCATE AGPList
					 
 		  		end
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
	end
 else if @Value is null
    begin
		if not exists (select * from  [dbo].[EPA_Appr_Comments_AIP2] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  )
			insert into  [dbo].[EPA_Appr_Comments_AIP2] 
			([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[Needs],[Strategies])
			values (@SchoolYear,@SchoolCode,@SessionID,@EmployeeID,@ItemCode,1,'','')

		select   SequenceNo as SeqNo,[Needs],[Strategies]
		from  [dbo].[EPA_Appr_Comments_AIP2] 
		where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  
		order by SequenceNo
	end
else
   begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_AIP2] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and SequenceNo = @SeqNo)	
				begin
				 --   insert into dbo.EPA_Appr_Comments_AIP2_Bak
					--([School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[AreaForGrowth],[GrowthStrategy],[TimeLine],[FutureGrowth],action_User,action_Date,lu_user,lu_function,lu_date)
					--select [School_Year],[School_Code],[SessionID],[EmployeeID],[ItemCode],[SequenceNo],[AreaForGrowth],[GrowthStrategy],[TimeLine],[FutureGrowth],@UserID,getdate(),lu_user,lu_function,lu_date
					--from dbo.EPA_Appr_Comments_AIP2
					--where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and SequenceNo = @SeqNo

					if 	@ActionItem ='Needs'	     
						  update  [dbo].[EPA_Appr_Comments_AIP2]
						  set Needs = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID   and ItemCode = @ItemCode and SequenceNo = @SeqNo  
 		 
					if 	@ActionItem ='Strategies'	     
						  update  [dbo].[EPA_Appr_Comments_AIP2]
						  set Strategies = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID   and ItemCode = @ItemCode and SequenceNo = @SeqNo    and ItemCode = @ItemCode
	 				end
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end








   

					 





