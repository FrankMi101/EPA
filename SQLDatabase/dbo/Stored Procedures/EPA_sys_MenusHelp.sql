

-- Drop proc dbo.EPA_sys_MenusHelp
CREATE Procedure [dbo].[EPA_sys_MenusHelp]
 	(	@UserID		varchar(50) ='upaUser',
		@AppCode	varchar(20) ='UPA',
		@Model		varchar(10) = 'Run', 
		@CategoryID  varchar(30) = null, 
		@GroupID  varchar(30) = null, 
		@ItemID  varchar(30) = null, 
		@TitleID  varchar(30) = null, 
 		@Value		varchar(500) = null 
	)

 
AS
BEGIN 
	set nocount on
 	if @Value is null
 		    if exists (select * from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID  and Appraisal_Code = @appCode)
				select top 1  Help_Text
				from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID   and Appraisal_Code = @appCode
			else
				select @TitleID 
	else
		if exists (select * from dbo.EPA_sys_FunctionMenus 	where TitleID = @TitleID and Appraisal_Code = @appCode)
				--	where CategotyID = @CategoryID and GroupID = @GroupID and ItemID = @ItemID and Appraisal_Code = @appCode)
			update dbo.EPA_sys_FunctionMenus 
			set Help_Text = @Value
			where TitleID = @TitleID and Appraisal_Code = @appCode 
		else
			insert into   dbo.EPA_sys_FunctionMenus
					(CategoryID, GroupID,ItemID,TitleID,Appraisal_Code,Help_Text,lu_User,lu_Function, lu_Date)
			values(	@CategoryID, @GroupID,@ItemID, @TitleID,@appCode,   @Value    ,@UserID, app_name(),getdate())
END

