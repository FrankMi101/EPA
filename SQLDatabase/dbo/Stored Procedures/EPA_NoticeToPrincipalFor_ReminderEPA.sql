

-- =====================================================================================
-- Author:		Frank Mi
-- Create date: March 27, 2018  
-- Description:	sent out the postion posting email to school principal 
-- =====================================================================================


create proc [dbo].[EPA_NoticeToPrincipalFor_ReminderEPA]
	@Schoolyear varchar(8),
	@Schoolcode varchar(8),
	@EmployeeID varchar(20),
	@NoticeType varchar(10),
	@PostingNum  varchar(10),
	@DateStart	datetime,
	@DateEnd	datetime,
	@NoticeDate	datetime 

as 

declare @EmailModel varchar(10)
set @EmailModel ='TestFalse'
 
declare @UserID varchar(30), @OwnerName varchar(30), @SchoolName varchar(100), @PrincipalName varchar(100) 
declare @mailTo   varchar(100),  @mailCC varchar(100) ,  @mailBCC varchar(100), @FromAdres varchar(50) 
declare @mailSubject varchar(200), @mailBody varchar(4000) , @PrincipalID varchar(10), @OwnerID varchar(10)

 
      begin	  
 	        set @OwnerName = 'mif@tcdsb.org' -- dbo.tcdsb_TPA_UserNameByUserID(@OwnerID,'fNameFirst') 
 	        set @PrincipalName = 'PeincipalID@tcdsb.org' --dbo.tcdsb_TPA_UserNameByUserID(@PrincipalID,'fNameFirst') 
			set @SchoolName = '' --dbo.School( @schoolcode, 'Name')	  


			  
	        set @mailSubject = 'Performance Appraisal Notification'  

			 set @mailBody = '<div> Do Not Reply This Email Please ! </div>  <br /> <br />'
							+'<div> Dear ' +   @PrincipalName  + '</div> <br />'
							+ '<div> We are in receipt of your ' + @NoticeType  + ' Application and have posted the ' +  @OwnerName  +  ' assignment as requested. '
							+ 'This assignment will be posted for 3 days. On day 4, you will receive a list of candidates to be interviewed. '
							+ 'As a gentle reminder, all candidates must be interviewed before a decision is made. Please allow 24 hours for a '
							+ 'candidate to respond to your invitation. If there is no response, you may consider this as a decline and consideration '
							+ 'should be given to the remaining candidates. </div> <br />'
							+ '<div> Please ensure the interview process is completed within a 3-5 days period. '
							+ 'Once you have selected a candidate and the candidate has accepted, please enter the LTO/POP Application and "recommend hire". This will generate the paperwork.'
							+ '</div> <br />'  
							+ '<div> If you have any questions, please contact ' 
							+ case @OwnerName when 'boreanf' then 'Fiorella Borean at ext. 2321'
											when 'krasnor' then 'Rosemarie Krasnovitch at ext. 2370'
											when 'frijiom' then 'Mary Frijio at ext. 2730'
											else 'Margherita Di Fonzo at ext. 2322' end
							+ '</div> <br />' 
							+ '<div>  Thank you. <div> <br />'
							+ '<table border="1" style="width:700px" >' 
							+ '<tr><td style="width:27%">' +  'Posting number: '      + '</td><td style="width:50%">' + @PostingNum							+ '</td><td style="width:8%">BTC</td><td style="width:15%">' + '@BTC'+ '</td></tr>' 
							+ '<tr><td>' +  'Position title: '      + '</td><td colspan="3">' + '@PositionTitle'						+ '</td></tr>' 
							+ '<tr><td>' +  'Position description:' + '</td><td colspan="3">' + '@Description'						+ '</td></tr>' 
 							+ '<tr><td>' +  'Position start date:'  + '</td><td colspan="3">' + dbo.dateF(@DateStart, 'YYYYMMDD')   + '</td></tr>' 
							+ '<tr><td>' +  'Position   end date:'  + '</td><td colspan="3">' + dbo.dateF(@DateEnd, 'YYYYMMDD')		+ '</td></tr>' 
							+ '<tr><td>' +  'Position school:'      + '</td><td colspan="3">' + @SchoolName							+ '</td></tr>'
							+ '<tr><td>' +  'Teacher be replaced:'  + '</td><td colspan="1">' + '@ReplaceTeacher'						+ '</td><td>PID:</td><td>' + '@ReplaceTeacherID'+ '</td></tr>' 
						--	+ '<tr><td>' +  'Reason for replacement:'+'</td><td colspan="3">' + @ReplaceReason						+ '</td></tr>'
							+ '</table> <br/>' 
							+ 'Weekly schedule:' +  ' @TimeTable'
							+  '@MultipleSchool'
							+ ' <br /> <br /> <div> LTO/POP Hiring Process Emailing System. </div>'
							+ ' <br /> <div>' + convert( varchar(20),  getdate(),  20) + '</div>'  
       
	        set @mailTo  =   @PrincipalID +'@TCDSB.ORG'
	        set @mailCC  =   @OwnerID + '@TCDSB.ORG;' -- + dbo.tcdsb_LTO_getPositionMultiplePrincipalID(@SchoolYear , @SchoolCode,@PositionID)  -- get multiple school principal id for multiple school postion by Frank at 2017/02/22
 	        set @mailBCC  =  'mif@TCDSB.ORG'
	    
	
	 end      

	 --if @EmailModel ='Test'
	 --    begin
		--    set @mailBody =   @mailBody  + 'Email TO: ' +  @mailTo + '<br />'    + 'Email CC: ' +  @mailCC  + '<br />'
		--    set @mailTo  =    'mif@TCDSB.ORG'
	 --       set @mailCC  =  ''
 	--        set @mailBCC  =  ''
		-- end
  --   else
		--UPDATE dbo.tcdsb_LTO_Position_Published 
		--set   Date_NoticePrincipalforPosted = getdate()
		--where  Ids =  @PositionID

 
	 EXEC msdb.dbo.sp_send_dbmail 
			@profile_name ='EPA Public Profile',
			@recipients = @mailTo,
			@copy_recipients= @mailCC, 
		    @blind_copy_recipients= @mailBCC,
			@body = @mailBody,
			@subject = @mailSubject,
			@body_format ='HTML',
			@from_address = 'EPA.Admin@tcdsb.org'  --'LTO.Admin@tcdsb.org' 

-- insert into [dbo].[tcdsb_LTO_Position_ConfirmHire_Log]
-- (school_year,school_code,Position_Type,Position_ID,Position_Title,Posting_Num,Date_EmailNotice,User_NoticePrincipal,Email_Type,Email_To,Email_CC,Email_Subject,Email_Body,last_update_date,last_update_function )
--values (@Schoolyear,@Schoolcode,@PositionType,@PositionID,@PositionTitle,@PostingNum,getdate(),@PrincipalID,'Publish',@mailTo,@mailCC,@mailSubject,@mailBody, getdate(),'SQL Mail')
 		
 
