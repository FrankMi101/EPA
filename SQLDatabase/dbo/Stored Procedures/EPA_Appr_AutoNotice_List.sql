  
 
-- [dbo].[EPA_Appr_AutoNotice_List] 'SIG'
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: JUly 13, 2020 
-- Description:	auto email notification batch control
-- ================================================================================== 
CREATE proc [dbo].[EPA_Appr_AutoNotice_List] 
(@NoticeType varchar(10) = 'ALP')
as 
set nocount on
 
declare @NeedNoticeTeacherList as table
(School_year varchar(8),
 School_Code varchar(8),
 Employee_ID varchar(10),
 Notice_Type varchar(20),
 Template_ID int
 )
 -- Step 1 get need to notice teacher list
    insert into @NeedNoticeTeacherList
	select AR.School_Year, AR.School_code, AR.Employee_ID, AC.NoticeType , AC.NoticeTempletID  
	from  [dbo].[EPA_Appraisal_StaffListView]  as AR
	inner join [dbo].[EPA_Appr_Notification_AutoCheckSetup] as AC on AR.School_Year = AC.School_year and AR.School_Code = AC.School_code   and AC.NoticeType = @NoticeType
	where AC.School_Code != '0000' and AC.school_year = dbo.EPA_CurrentSchoolYear(8,20) and getdate() between AC.StartDate and AC.EndDate
 		  and dbo.EPA_checkNoticedStatus(@NoticeType,AR.AppraisalPhase, AR.Appraisaloutcome, AR.Appraisal_1,AR.ALP_Result ) = 'GoNotice' 
		  and dbo.EPA_checkNoticed(@NoticeType,AR.School_year, AR.school_code, AR.Employee_id) ='GoNotice' 
 

 
 
	declare @SchoolYear varchar(8), @schoolCode varchar(8), @EmployeeID varchar(10) ,@TempleteID  int
	declare  NeedNoticeTeacherList cursor
	for select  School_Year,  School_code, Employee_ID ,Notice_Type 
		from  @NeedNoticeTeacherList
-- Step 2 	loop the teacher list to send email notification


	FETCH NEXT FROM NeedNoticeTeacherList INTO @SchoolYear, @SchoolCode, @EmployeeID, @TempleteID
	While @@FETCH_STATUS = 0
		begin										 
		    EXEC dbo.EPA_Appr_AutoNotice_SendEmail @SchoolYear, @SchoolCode, @EmployeeID,@NoticeType, @TempleteID
			FETCH NEXT FROM  Qualifications INTO  @SchoolYear, @SchoolCode, @EmployeeID, @TempleteID
		end
	CLOSE 	NeedNoticeTeacherList
	DEALLOCATE NeedNoticeTeacherList


 
/*
 if @NoticeType ='ALP'
    insert into @NeedNoticeTeacherList
	select AR.School_Year, AR.School_code, AR.Employee_ID,@NoticeType, AC.NoticeTempletID  
	from  [dbo].[EPA_Appraisal_StaffListView]  as AR
	inner join [dbo].[EPA_Appr_Notification_AutoCheckSetup] as AC on AR.School_Year = AC.School_year and AR.School_Code = AC.School_code and AC.NoticeTYpe = @NoticeType
	where AC.School_Code != '0000' and AC.school_year = dbo.EPA_CurrentSchoolYear(8,20) and getdate() between AC.StartDate and AC.EndDate
		  and AR.ALP_Result ='Not Start'
		  and dbo.EPA_checkNoticed(@NoticeType,AR.School_year, AR.school_code, AR.Employee_id) ='GoNotice' 
if @NoticeType = 'EPA'
    insert into @NeedNoticeTeacherList
	select   AR.School_Year, AR.School_code, AR.Employee_ID,@NoticeType, AC.NoticeTempletID   
	from  [dbo].[EPA_Appraisal_StaffListView]  as AR
	inner join [dbo].[EPA_Appr_Notification_AutoCheckSetup] as AC on AR.School_Year = AC.School_year and AR.School_Code = AC.School_code and AC.NoticeTYpe = @NoticeType
	where AC.School_Code != '0000' and AC.school_year = dbo.EPA_CurrentSchoolYear(8,20) and getdate() between AC.StartDate and AC.EndDate
		  and AR.Appraisal_1 ='Not Start'
		  and dbo.EPA_checkNoticed(@NoticeType,AR.School_year, AR.school_code, AR.Employee_id) ='GoNotice' 

if @NoticeType = 'OBS'
    insert into @NeedNoticeTeacherList
	select AR.School_Year, AR.School_code, AR.Employee_ID,@NoticeType, AC.NoticeTempletID   
	from  [dbo].[EPA_Appraisal_StaffListView]  as AR
	inner join [dbo].[EPA_Appr_Notification_AutoCheckSetup] as AC on AR.School_Year = AC.School_year and AR.School_Code = AC.School_code and AC.NoticeTYpe =@NoticeType
	where AC.School_Code != '0000' and AC.school_year = dbo.EPA_CurrentSchoolYear(8,20) and getdate() between AC.StartDate and AC.EndDate
		  and AR.Appraisal_1 ='Incomplete'
		  and dbo.EPA_checkNoticed(@NoticeType,AR.School_year, AR.school_code, AR.Employee_id) ='GoNotice' 

if @NoticeType ='SIG'  -- Sign off
*/

