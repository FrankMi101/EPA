




-- Drop proc dbo.EPA_sys_HelpTextMessage
CREATE Procedure [dbo].[EPA_sys_HelpTextMessage]
 	( @Operate		varchar(30),
	  @UserID		varchar(30) ='upaUser',
  	  @Category		varchar(10) = 'Sys-Profile', 
	  @Area			varchar(20) = null, 
	  @Code			varchar(10) = null, 
	  @Value		varchar(2000) = null 
 	)

 
AS
 

BEGIN 
	if @Value is null
		begin
			if exists (select * from [dbo].[EPA_sys_Appraisal_Message]   where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
				set @Value = (select top 1 isnull(Help_Text, '')
							  from  dbo.EPA_sys_Appraisal_Message 
							  where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)			
 			else
				set @Value = ''	
			select  @Value as rValue
 
			
		end
	else
	  begin
		  begin try
	    
				if exists (select * from dbo.EPA_sys_Appraisal_Message where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
					update dbo.EPA_sys_Appraisal_Message
					set Help_Text = @Value
					where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code
				else
					insert into dbo.EPA_sys_Appraisal_Message
							( Appraisal_Category,Appraisal_Area, Appraisal_Code, Help_Text,lu_User,lu_Function, lu_Date)
					values(	@Category,@Area, @Code,	@Value ,@UserID, app_name(),getdate())

              select 'Successful' as rValue
		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END

 
