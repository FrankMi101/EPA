

-- Drop proc dbo.EPA_sys_TitleHelp
CREATE Procedure [dbo].[EPA_sys_TitleHelp]
 	(	@UserID		varchar(50) ='upaUser',
		@ApplID		varchar(30) ='UPA',
		@CategoryID	varchar(30) = 'Sys-Profile', 
		@PageID		varchar(30) = null, 
		@ItemID		varchar(30) = null, 
		@Value		varchar(2000) = null 
 	)

 
AS
 

BEGIN 
	if @Value is null
		begin
			if exists (select * from dbo.EPA_sys_appraisalTitleHelp  where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID)
				set @Value = (select top 1 isnull(Help_Text, 'Help Content of '  +  @PageID + ' ' + @ItemID	)
							  from  dbo.EPA_sys_appraisalTitleHelp 
							  where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID)			
 			else
				set @Value = 'Help Content of '  +  @PageID + ' ' + @ItemID	
			select  @Value as rValue
 
			
		end
	else
		if exists (select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID)
			update dbo.EPA_sys_appraisalTitleHelp
			set Help_Text = @Value
			where ApplicationID = @ApplID and CategoryID = @CategoryID and PageID = @PageID and ItemID =@ItemID
		else
			insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID, PageID, ItemID, Help_Text,lu_User,lu_Function, lu_Date)
			values(	@ApplID,@CategoryID, @PageID, @ItemID,	  @Value    ,@UserID, app_name(),getdate())
END

