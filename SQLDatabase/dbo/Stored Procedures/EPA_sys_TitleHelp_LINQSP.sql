


-- Drop proc dbo.EPA_sys_TitleHelp_LINQSP
CREATE Procedure [dbo].[EPA_sys_TitleHelp_LINQSP]
 	(
		@ApplID		varchar(30) ='UPA' 
	
 	)

AS
 
		 select ApplicationID, PageID, ItemID, Title, Help_Text as Help, ShowHelp
		  from dbo.EPA_sys_appraisalTitleHelp 
		   where ApplicationID = @ApplID  
		   order by  PageID


