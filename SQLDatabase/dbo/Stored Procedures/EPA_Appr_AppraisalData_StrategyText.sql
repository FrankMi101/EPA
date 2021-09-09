



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 2, 2018 
-- Description:	get NTIP strategy item label
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_StrategyText]  -- '0','mif','20172018','0528','00010452','Session1','NTP','STR','STR111' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,
	@Column			varchar(10) = null,
	@Value			 varchar(500) = null 

	 
as

set nocount on 
if @Value is null
   begin
		if exists(select top 1   Strategy from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and ItemCode = @ItemCode)
			select top 1  case @Column when 'G' then Goal when 'S' then Strategy else '' end as rValue
			from [dbo].[EPA_Appr_Strategy]  
			where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and ItemCode = @ItemCode --and SessionID = @SessionID 
		else
			select ''
	end
else
 begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Strategy]  
						where School_Year =@SchoolYear and School_Code = @SchoolCode  and EmployeeID =@EmployeeID and ItemCode = @ItemCode )--and SessionID = @SessionID
				  begin
				      insert into  [dbo].[EPA_Appr_Strategy_Bak]  
							(School_Year,School_Code,EmployeeID,SessionID,ItemCode,Goal,strategy,lu_date,lu_user,lu_function, action_User,action_date)
					  select School_Year,School_Code,EmployeeID,SessionID,ItemCode,Goal,Strategy,lu_date,lu_user,lu_function, @UserID,getdate()
					  from  [dbo].[EPA_Appr_Strategy]  
					  where School_Year =@SchoolYear and School_Code = @SchoolCode and EmployeeID =@EmployeeID and ItemCode = @ItemCode -- and SessionID = @SessionID
					   if @Column ='G'
						  update  [dbo].[EPA_Appr_Strategy]  
						  set Goal = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and  EmployeeID =@EmployeeID and ItemCode = @ItemCode -- and SessionID = @SessionID 
						else
					  update  [dbo].[EPA_Appr_Strategy]  
						  set strategy = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode  and EmployeeID =@EmployeeID and ItemCode = @ItemCode -- and SessionID = @SessionID


				  end
			else
			   if @Column ='G'
					insert into   [dbo].[EPA_Appr_Strategy]  
					( School_Year,School_Code,EmployeeID,SessionID,ItemCode,Goal, lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Value, getdate(),@UserID, app_name())
				else
					insert into   [dbo].[EPA_Appr_Strategy]  
					( School_Year,School_Code,EmployeeID,SessionID,ItemCode,strategy, lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @Value, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end  


