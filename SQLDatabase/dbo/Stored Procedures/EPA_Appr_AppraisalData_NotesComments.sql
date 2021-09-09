




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 13, 2018 
-- Description:	get and update Appraisal Notes comment
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_NotesComments]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,  -- Appraisal role
	@Value			varchar(2000) = null   

	 
as

set nocount on 
  if @Value is null
    begin
 
			 if exists (select * from  [dbo].[EPA_Appr_Notes]    where School_Year =   @SchoolYear and School_Code = @SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID  and Appraisal_Role = @Category)
				 select top 1  Appraisal_Note
				 from  [dbo].[EPA_Appr_Notes]
				 where School_Year =@SchoolYear and School_Code = @SchoolCode  and EmployeeID =@EmployeeID and SessionID = @SessionID  and Appraisal_Role = @Category
			 else
				select '' as Appraisal_Note
	end
else
   begin
		begin try
		   begin tran
				 
				if exists (select * from  [dbo].[EPA_Appr_Notes]
							where School_Year =@SchoolYear and School_Code = @SchoolCode  and EmployeeID =@EmployeeID and SessionID = @SessionID  and Appraisal_Role = @Category )
					 
						  update  [dbo].[EPA_Appr_Notes]
						  set Appraisal_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						 where School_Year =@SchoolYear and School_Code = @SchoolCode  and EmployeeID =@EmployeeID and SessionID = @SessionID  and Appraisal_Role = @Category
					  
				else
					insert into   [dbo].[EPA_Appr_Notes]
					( School_Year,School_Code,EmployeeID,SessionID,Appraisal_Role,Appraisal_Note,lu_date,lu_user,lu_function)
					values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@Category, @Value, getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
  end
   





