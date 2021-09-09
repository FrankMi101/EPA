

-- Drop proc dbo.EPA_sys_Menus'','UPA','Run','Name','','','','MenuItem12'
CREATE Procedure [dbo].[EPA_sys_Menus]
 	(	@UserID		varchar(50) ='upaUser',
		@AppCode	varchar(20) ='UPA',
 		@Model		varchar(10) = 'Run', 
		@Type		varchar(10) = 'Name', 
		@CategoryID  varchar(30) = null, 
		@GroupID  varchar(30) = null, 
		@ItemID  varchar(30) = null, 
		@TitleID  varchar(30) = null, 
 		@Value		varchar(500) = null 
	)

 
AS

set nocount on
BEGIN 
  if @Value is null
     begin
 		if @Type ='Menu'  select  dbo.EPA_getMenusLink(@AppCode,@Model,@CategoryID,@GroupID,@ItemID,@TitleID) 
		if @Type ='Page'  select top 1  PageID	  from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID   and Appraisal_Code = @appCode
		if @Type ='Targ'  select top 1  TargetID  from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID   and Appraisal_Code = @appCode
		if @Type ='Name'  select top 1  Title	  from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID   and Appraisal_Code = @appCode
		if @Type ='NameL' select top 1  Title2	  from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID   and Appraisal_Code = @appCode
		if @Type ='Help'  select top 1  Help_Text from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID   and Appraisal_Code = @appCode
     end 
 else
     begin
		if not exists(select * from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID  and Appraisal_Code = @appCode)
			insert into dbo.EPA_sys_FunctionMenus
				(CategoryID, GroupID, ItemID,  TitleID, Appraisal_Code,lu_User,lu_Function, lu_Date)
			values  (@CategoryID,@GroupID,@ItemID, @TitleID,@appCode,		@UserID, app_name(),getdate())

		if @Type ='Page'  update dbo.EPA_sys_FunctionMenus set PageID = @Value		where TitleID = @TitleID and Appraisal_Code = @appCode 
		if @Type ='Targ'  update dbo.EPA_sys_FunctionMenus set TargetID = @Value	where TitleID = @TitleID and Appraisal_Code = @appCode 
		if @Type ='Name'  update dbo.EPA_sys_FunctionMenus set Title = @Value		where TitleID = @TitleID and Appraisal_Code = @appCode 
		if @Type ='NameL' update dbo.EPA_sys_FunctionMenus set Title2 = @Value		where TitleID = @TitleID and Appraisal_Code = @appCode 
		if @Type ='Help'  update dbo.EPA_sys_FunctionMenus set Help_Text = @Value	where TitleID = @TitleID and Appraisal_Code = @appCode 
	end

        
End

