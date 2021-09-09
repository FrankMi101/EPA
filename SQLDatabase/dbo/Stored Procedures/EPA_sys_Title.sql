

-- Drop proc dbo.EPA_sys_Title
CREATE Procedure [dbo].[EPA_sys_Title]
 	(	@UserID		varchar(50) ='upaUser',
		@ApplID		varchar(30) ='UPA',
		@CategoryID	varchar(30) = 'Sys-Profile', 
		@PageID		varchar(30) = null, 
		@ItemID		varchar(30) = null, 
		@Value		varchar(200) = null 
	)

     

AS
BEGIN 
	set nocount on
--	declare @strHref varchar(100)
-- 	declare @Para varchar(100)
-- 	set @Para   = '('''  + @Title_IDs + ''',''' + @Title_Type + ''')">'
--
--	set @strHref = case @Model when 'Design' then	'<A title ="Entry Title" href="javascript:openTitleEditPage'
--							   when 'DDLEdit' then	'<A title ="Edit DropDown List" href="javascript:openDDLEditPage'
--							   when 'UpLoad'  then	'<A title ="Upload file" href="javascript:openUpLoadPage'
--							   else '' End   
	if @Value is null
		begin
			if exists (select * from dbo.EPA_sys_appraisalTitleHelp  where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID)
				set @Value = (select top 1 isnull(Title, 'Title of '  +  @PageID + ' ' + @ItemID )  from  dbo.EPA_sys_appraisalTitleHelp 
							  where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID)			
 			else
				set @Value = 'Title of '  +  @PageID + ' ' + @ItemID	
			select  @Value as rValue
 
			
		end
	else
		if exists (select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID)
			update dbo.EPA_sys_appraisalTitleHelp
			set Title = @Value
			where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID
		else
			insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID, PageID, ItemID, Title,lu_User,lu_Function, lu_Date)
			values(	@ApplID,@CategoryID, @PageID, @ItemID,	  @Value    ,@UserID, app_name(),getdate())
END

