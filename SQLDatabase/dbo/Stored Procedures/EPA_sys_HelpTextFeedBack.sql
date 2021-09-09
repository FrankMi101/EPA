


          



-- Drop proc dbo.EPA_sys_HelpTextContent 'Read','mif','PPA','AGP','AGP61','EP'
CREATE Procedure [dbo].[EPA_sys_HelpTextFeedBack] 
 	( @Operate		varchar(30),
	  @UserID		varchar(30) ='upaUser',
  	  @Category		varchar(10) = 'Sys-Profile', 
	  @Area			varchar(20) = null, 
	  @Code			varchar(10) = null, 
	  @UserRole		varchar(10) = null, 
	  @SchoolYear	varchar(8) = null, 
	  @Subject		varchar(100) = null, 
	  @Feedback		varchar(2000) = null 
 	)
AS
 
BEGIN 
 
	if @Feedback is null
		begin
 						select 	IDs, Appraisal_Category, Appraisal_Area, Appraisal_Code, [Subject],FeedBack
						from  [dbo].[EPA_sys_Appraisal_FeedBack]
						where  School_year = @SchoolYear and Appraisal_Category = @Category 		
		end
	else
	  begin
		  begin try
			  begin tran
					insert into dbo.EPA_sys_Appraisal_FeedBack
							(School_Year, Appraisal_Category,Appraisal_Area, Appraisal_Code,FeedBack_User,User_Role,[Subject],FeedBack,lu_User,lu_Function, lu_Date)
					values(	@SchoolYear, @Category,@Area, @Code, @UserID,@UserRole, @Subject,@FeedBack,@UserID, app_name(),getdate())
				 

			  commit tran	
				 select 'Successful' as rValue 
 		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END








