








-- Drop proc dbo.EPA_sys_HelpTextContent 'Read','mif','PPA','AGP','AGP61','EP'
CREATE Procedure [dbo].[EPA_sys_HelpTextContent] 
 	( @Operate		varchar(30),
	  @UserID		varchar(30) ='upaUser',
  	  @Category		varchar(10) = 'Sys-Profile', 
	  @Area			varchar(20) = null, 
	  @Code			varchar(10) = null, 
	  @HelpType		varchar(10) = null, 
	  @Value		varchar(2000) = null 
 	)

 
AS
 
 

 EXEC [dbo].[EPA_sys_HelpTitleContentSP]  @Operate,@UserID	,@Category,@Area,@Code,@HelpType,@Value 

--BEGIN 
--	if @Value is null
--		begin
--		   if @Operate ='Read'
--			  begin
--					if exists (select * from [dbo].[EPA_sys_Appraisal_Help]   where Help_Type = @HelpType and Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
--						set @Value = (select top 1 isnull(Help_Text, case Help_Type when 'EP' then 'E.P. Content of ' else 'Help Content of '  end    +   @Category + ' ' +  @Area + ' ' + @Code	)
--									  from  dbo.EPA_sys_Appraisal_Help 
--									  where  Help_Type = @HelpType and Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)	
--					else if exists(select * from [dbo].[EPA_sys_Appraisal_Help]   where Help_Type = @HelpType and Appraisal_Category = 'TPA' and Appraisal_Area = @Area and Appraisal_Code = @Code)
--						set @Value = (select top 1 isnull(Help_Text, case Help_Type when 'EP' then 'E.P. Content of ' else 'Help Content of '  end    +   @Category + ' ' +  @Area + ' ' + @Code	)
--									  from  dbo.EPA_sys_Appraisal_Help 
--									  where  Help_Type = @HelpType and Appraisal_Category = 'TPA' and Appraisal_Area = @Area and Appraisal_Code = @Code)	
								  		
-- 					else
--						set  @Value =  case @HelpType when 'EP' then 'E.P. Content of ' else 'Help Content of '  end  +  @Category + ' ' +  @Area + ' ' + @Code	 
--				    select @Value
--			 end	
 
--		end
--	else
--	  begin
--		  begin try
	    
--				if exists (select * from dbo.EPA_sys_Appraisal_Help where  Help_Type = @HelpType and Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
--					update dbo.EPA_sys_Appraisal_Help  
--					set Help_Text = @Value
--					where  Help_Type = @HelpType and Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code
--				else
--					insert into dbo.EPA_sys_Appraisal_Help
--							( Appraisal_Category,Appraisal_Area, Appraisal_Code, Help_Type, Help_Text,lu_User,lu_Function, lu_Date)
--					values(	@Category,@Area, @Code, @HelpType,	@Value ,@UserID, app_name(),getdate())

--              select 'Successful' as rValue
--		   end try
--		   begin catch
--		       Rollback tran
--		      select 'Failed' as rValue
--		   end catch
--	   end
--END






