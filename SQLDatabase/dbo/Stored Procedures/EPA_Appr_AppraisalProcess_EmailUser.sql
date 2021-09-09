










-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 12, 2020 
-- Description:	get and update notification email content
-- ==================================================================================
          
-- Drop proc dbo.EPA_Appr_Notification 'Save','mif','StrategySignOff','mif@tcdsb.org;frank_ml@hotmail.com'
CREATE Procedure [dbo].[EPA_Appr_AppraisalProcess_EmailUser] 
 	( @Operate			varchar(50),
	  @UserID			varchar(30) ='upaUser',
	  @SchoolYear		varchar(8) = null,
	  @SchoolCode		varchar(8) = null,
	  @EmployeeID		varchar(10) = null,
	  @SessionID		varchar(20) = null,
  	  @NoticeType		varchar(30) = null,
	  @NoticeArea		varchar(10)	= null,
	  @NoticeRole		varchar(30) = null,
	  @Category			varchar(10)	= null
 	)
AS
BEGIN 
	if @NoticeArea is not null
	    select [dbo].[EPA_getNotificationUserEmailByArea](@Operate,@UserID, @SchoolYear,@SchoolCode,@EmployeeID,@NoticeType,@NoticeArea, @NoticeRole,@Category)
	else
 	   select [dbo].[EPA_getNotificationUserEmail](@UserID, @SchoolYear,@SchoolCode,@EmployeeID,@NoticeType )

 
END



 









