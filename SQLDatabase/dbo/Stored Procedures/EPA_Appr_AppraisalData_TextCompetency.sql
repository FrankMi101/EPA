




 
 
--- select * from dbo.EPA_Appr_Comments_DomainCompetency  where  EmployeeID='00011169'

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 19, 2017 
-- Description:	get and update competency Text content
-- ==================================================================================
 
-- [dbo].[EPA_Appr_AppraisalData_TextCompetency]  'save','mif','20172018','0529','00011169','Appraisal2','TPA' ,'SUM','SUM56','6','20', '3',' additional '
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextCompetency]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@DomainID		varchar(10)= null,  
	@CompetencyID	varchar(10)= null,  
	@Rate			varchar(10)= null,  
	@Value			varchar(2000) = null   
 
as

set nocount on 
 
 if @Operate ='NotesRate' -- @Value is null
    begin
		if exists (select * from  [dbo].[EPA_Appr_Comments_DomainCompetency]
							where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID  and Category = @Category  )
 			select top 1   rtrim(Rate) + '-' + Appraisal_Note as Appraisal_Note   --  Appraisal_Note ,Rate
					from  [dbo].[EPA_Appr_Comments_DomainCompetency] 
					where  School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID	  and Category = @Category  
		else
  		    -- select '' as  Appraisal_Note, '0' +  as Rate
		    select '0- ' as  Appraisal_Note 
  	end
 else if @Operate in ('Get','Rate') -- @Value is null
    if exists (select * from  [dbo].[EPA_Appr_Comments_DomainCompetency]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID  and Category = @Category  )
       begin
		   if @Operate ='Rate'
				select top 1   Rate
				from  [dbo].[EPA_Appr_Comments_DomainCompetency] 
				where  School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID  and Category = @Category  
			else
				select top 1  Appraisal_Note 
				from  [dbo].[EPA_Appr_Comments_DomainCompetency] 
				where  School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID  and Category = @Category  
	   end
	else
	   begin
			   if @Operate ='Rate'
			       select '-1' as Rate
			   else
				   select '' as  Appraisal_Note
	   end    	
else
   begin
		begin try
			begin tran
				if exists (select * from  [dbo].[EPA_Appr_Comments_DomainCompetency]
							where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID  and Category = @Category  )
					  begin
						  insert into [dbo].[EPA_Appr_Comments_DomainCompetency_Bak]  
								(School_Year,School_Code,EmployeeID,SessionID,ItemCode,DomainID,CompetencyID,Rate,Appraisal_Note,Category,lu_date,lu_user,lu_function, action_User,action_date)
						  select School_Year,School_Code,EmployeeID,SessionID,ItemCode,DomainID,CompetencyID,Rate,Appraisal_Note,Category,lu_date,lu_user,lu_function, @UserID,getdate()
						  from  [dbo].[EPA_Appr_Comments_DomainCompetency]
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @ItemCode  and DomainID=@DomainID and CompetencyID= @CompetencyID  and Category = @Category
						  if @Operate ='SaveComments'
							  update  [dbo].[EPA_Appr_Comments_DomainCompetency]
							  set  Appraisal_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID  and Category = @Category

						  else
							  update  [dbo].[EPA_Appr_Comments_DomainCompetency]
							  set Rate = @Rate, Appraisal_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID  and Category = @Category
					  end
				else
					insert into   [dbo].[EPA_Appr_Comments_DomainCompetency]
					( School_Year,School_Code,EmployeeID,SessionID,ItemCode,DomainID,CompetencyID,Rate,Appraisal_Note,Category,lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @DomainID, @CompetencyID, @Rate,@Value,@Category, getdate(),@UserID, app_name())

			--	EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResult] @Operate,'DoaminRate',@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode

			commit tran
				Select 'Successfully' as rValue
       end try
	   begin catch
			 Rollback tran
			 Select 'Failed' as rValue		
	   end catch
  end




/*
	  begin try
		   begin tran
				{} 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

	 
*/








