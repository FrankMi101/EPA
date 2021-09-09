





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 27, 2018 
-- Description:	remind ALP notification at first or second reminder day
-- ==================================================================================
          
-- Drop proc dbo.EPA_Appr_AppraisalProcess_NotificationReminder 'Save','mif','StrategySignOff','mif@tcdsb.org;frank_ml@hotmail.com'
CREATE Procedure [dbo].[EPA_Appr_AppraisalProcess_NotificationRemindCheck] 
 	(
 	  @SchoolCode		varchar(8) ='0000' ,
	  @SchoolName		varchar(250) =null,
	  @ApprType			varchar(10) =null
  	)
AS
BEGIN 
	declare @currentSchoolyear varchar(8) , @DueDate smalldatetime, @NoticeDate1 smalldatetime, @NoticeDate2 smalldatetime,@NoticeDate3 smalldatetime

-- Step 1  Check ALP need reminder

	if exists (select * from [dbo].[EPA_Appr_AppraisalDueDate] where school_year = @currentSchoolyear and School_code = @SchoolCode and Appraisal_Type = @ApprType)
		select top 1 @DueDate = Due_date, @NoticeDate1 =  Due_date - reminder_1st  ,  @NoticeDate2 = Due_date - reminder_2nd ,  @NoticeDate3 = Due_date - reminder_3rd 
		from [dbo].[EPA_Appr_AppraisalDueDate] where school_year = @currentSchoolyear and School_code = @SchoolCode and Appraisal_Type = @ApprType
	else
		select top 1 @DueDate = Due_date,  @NoticeDate1 =  Due_date - reminder_1st  ,  @NoticeDate2 = Due_date - reminder_2nd ,  @NoticeDate3 = Due_date - reminder_3rd 
		from [dbo].[EPA_Appr_AppraisalDueDate] where school_year = @currentSchoolyear and School_code = '0000' and Appraisal_Type =@ApprType
 
	 Declare @NeedNoticeTeacher as table
	 (
	  Employee_ID	varchar(10),
	  UserID		varchar(30),
	  Appraiser		varchar(30),
	  Result		varchar(50),
	  TeacherName	varchar(50),
	  ToWho			varchar(20),
	  EmailTo		varchar(50),
	  EmailCC		varchar(50)
	 )


 if  (DATEDIFF(day, getdate(), @NoticeDate1)  = 0  or DATEDIFF(day, getdate(), @NoticeDate2)  = 0 or DATEDIFF(day, getdate(), @NoticeDate3)  = 0)
	begin
		if @ApprType ='ALP'
			insert into @NeedNoticeTeacher
			select  Employee_ID, UserID, Appraiser, Appraisal_Process, TeacherName,'Appraisee' as ToWho ,eMail, [dbo].[EPA_getUserEmailbyID](Appraiser) as MailCC 
			from  [dbo].[EPA_Appraisal_StaffListView] 
			where Appraisal_Type = 'TPA' and   School_year = @currentSchoolyear and Appraisal_Role ='Teacher'  and Appraisal_Status='Active'
				 and Appraisal_Process != 'Completed'
		if @ApprType ='AGP'
			insert into @NeedNoticeTeacher
			select  Employee_ID, UserID, Appraiser, Appraisal_Process, TeacherName,'Appraisee' as ToWho ,eMail, [dbo].[EPA_getUserEmailbyID](Appraiser) as MailCC 
			from  [dbo].[EPA_Appraisal_StaffListView] 
			where Appraisal_Type = 'PPA' and   School_year = @currentSchoolyear and Appraisal_Role ='Teacher'  and Appraisal_Status='Active'
				 and Appraisal_Process != 'Completed'
		if @ApprType ='TPA'
			insert into @NeedNoticeTeacher
			select  Employee_ID, UserID, Appraiser, Appraisal_Process, TeacherName,'Appraiser' as ToWho, [dbo].[EPA_getUserEmailbyID](Appraiser) as MailTo  ,eMail
			from  [dbo].[EPA_Appraisal_StaffListView] 
			where  Appraisal_Type = @ApprType and  School_year = @currentSchoolyear  and AppraisalPhase = 'E' and Appraisal_Role ='Teacher'  and Appraisal_Status='Active'
				 and Appraisal_Process != 'Completed'
		if @ApprType ='NTP'
			insert into @NeedNoticeTeacher
			select  Employee_ID, UserID, Appraiser, Appraisal_Process, TeacherName,'Appraiser' as ToWho, [dbo].[EPA_getUserEmailbyID](Appraiser) as MailTo  ,eMail
			from  [dbo].[EPA_Appraisal_StaffListView] 
			where  Appraisal_Type = @ApprType and   School_year = @currentSchoolyear   and Appraisal_Role ='Teacher'  and Appraisal_Status='Active'
				 and Appraisal_Process != 'Completed'
		if @ApprType ='LTO'
			insert into @NeedNoticeTeacher
			select  Employee_ID, UserID, Appraiser, Appraisal_Process, TeacherName,'Appraiser' as ToWho, [dbo].[EPA_getUserEmailbyID](Appraiser) as MailTo  ,eMail
			from  [dbo].[EPA_Appraisal_StaffListView] 
			where   Appraisal_Type = @ApprType and   School_year = @currentSchoolyear  and Appraisal_Role ='Teacher'  and Appraisal_Status='Active'
				 and Appraisal_Process != 'Completed'
		if @ApprType ='PPA'
			insert into @NeedNoticeTeacher
			select  Employee_ID, UserID, Appraiser, Appraisal_Process, TeacherName,'Appraiser' as ToWho, [dbo].[EPA_getUserEmailbyID](Appraiser) as MailTo  ,eMail
			from  [dbo].[EPA_Appraisal_StaffListView]  
			where   Appraisal_Type = @ApprType and  School_year = @currentSchoolyear  and AppraisalPhase = 'E' and Appraisal_Role ='Teacher'  and Appraisal_Status='Active'
				 and Appraisal_Process != 'Completed'

	    declare @EmployeeID varchar(10), @UserID varchar(30), @Appraiser varchar(30),@ALPResult varchar(50),@TeacherName varchar(30), @Towho varchar(10), @EmailTo varchar(50) , @EmailCC varchar(50)

		DECLARE NoticeSet CURSOR 
		FOR select Employee_ID, UserID, Appraiser, Result,TeacherName,ToWho,EMailTo, EMailCC 
			from  @NeedNoticeTeacher 
 
	 
		OPEN NoticeSet
		   FETCH NEXT FROM NoticeSet  INTO   @EmployeeID , @UserID, @Appraiser, @ALPResult, @TeacherName, @Towho, @EmailTo, @EmailCC
			WHILE  @@FETCH_STATUS = 0
				  begin	 
  					 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindEmail
 					 @ApprType,@CurrentSchoolyear,@SchoolCode,@DueDate, @EmployeeID , @UserID, @Appraiser, @ALPResult, @TeacherName, @Towho, @EmailTo, @EmailCC
  
 					 FETCH NEXT FROM NoticeSet  INTO   @EmployeeID , @UserID, @Appraiser, @ALPResult, @TeacherName, @Towho, @EmailTo, @EmailCC
				  end
		CLOSE NoticeSet
		DEALLOCATE NoticeSet

	end
 END  
 
 



