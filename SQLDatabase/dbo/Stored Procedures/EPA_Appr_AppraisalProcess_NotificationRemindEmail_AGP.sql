




-- =====================================================================================
-- Author:		Frank Mi
-- Create date: March 27, 2018  
-- Description:	sent out the postion posting email to school principal 
-- =====================================================================================
  

CREATE proc [dbo].[EPA_Appr_AppraisalProcess_NotificationRemindEmail_AGP]
	@Schoolyear	varchar(8),
	@Schoolcode varchar(8),
	@DueDate	smalldatetime,
	@EmployeeID varchar(20),
	@UserID		varchar(30),
	@Appraiser  varchar(30),
	@ALPResult  varchar(50),
	@TeacherName	varchar(50),
	@ToWho		varchar(10), 
	@EmailTo		varchar(50),
	@EmailCC		varchar(50)

as 
begin
	set nocount on
	declare @EmailModel varchar(10) ,@testUserMail varchar(30)
	select  @EmailModel ='TestFalse' , @testUserMail ='mif@tcdsb.org'

	declare   @mailBCC varchar(100), @FromAdres varchar(50) ,@header varchar(100), @footer varchar(20)
	declare @mailSubject varchar(200), @mailBody varchar(4000) , @PrincipalID varchar(10), @OwnerID varchar(10)

	select   top 1 @mailSubject = [Subject], @mailBody = Template
	from [dbo].[EPA_sys_EmailNotificationTemplate]
	where category ='EPA' and NoticeType ='GAP' and NoticeGo = @ToWho and NoticeFrom ='AppAdmin' and Active ='X' and NoticeFor ='Remind'
  
	  set @mailBody =  replace(@mailBody,'{{AppraisalYearSTR}}', @Schoolyear)
	  set @mailBody =  replace(@mailBody,'{{DeadLineDateSTR}}', @DueDate)
	  set @mailBody =  replace(@mailBody,'{{SendNameSTR}}', 'EPA Application Administrator')
	  set @mailBody =  replace(@mailBody,'{{SendDateSTR}}', getdate())
	  set @mailBody =  replace(@mailBody,'{{TestEmailToSTR}}', case @EmailModel when 'Test' then @EmailTo else ''end)
	  set @mailBody =  replace(@mailBody,'{{TestEmailCCSTR}}', case @EmailModel when 'Test' then @EmailCC else ''end)
	  set @header ='< !DOCTYPE html > < html > < head > < style > body {width: 800px;} </ style > </ head > < body > < div > '
	  set @footer ='</div> </ body > </ html >'
	  if @EmailModel ='Test'
			select  @EmailTo = @testUserMail , @EmailCC =''

	  set @mailBody   = @header +  @mailBody + @footer
  
	insert into [dbo].[EPA_Appr_Notification]
	(NoticeAction, School_Year, School_Code, EmployeeID,NoticeType,AppraisalArea,NoticeRole, NoticeDate, DeadlineDate, NoticeSubject,Comments,lu_User,lu_Function, lu_Date)
	values('Reminder', @SchoolYear,@SchoolCode,@EmployeeID, @ALPResult, 'ALP','Appraiser', getdate(), @DueDate,  @mailSubject,@mailBody,@UserID, app_name(),getdate())
	  

	 EXEC msdb.dbo.sp_send_dbmail 
			@profile_name ='EPA Public Profile',
			@recipients = @EmailTo,
			@copy_recipients= @EmailCC, 
		    @blind_copy_recipients= @mailBCC,
			@body = @mailBody,
			@subject = @mailSubject,
			@body_format ='HTML',
			@from_address = 'EPA.Admin@tcdsb.org'  --'LTO.Admin@tcdsb.org' 

  end		
 



