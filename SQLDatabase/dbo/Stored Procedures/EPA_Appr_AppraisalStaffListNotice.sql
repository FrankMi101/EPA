


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 05, 2017 
-- Description:	get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc  dbo.EPA_Appr_AppraisalStaffListNotice 'Admin','mif','20192020','0529','All','','AppraisalStart','ALP' 
CREATE Procedure [dbo].[EPA_Appr_AppraisalStaffListNotice]
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser',
		@SchoolYear		varchar(8) = null,
		@SchoolCode		varchar(8) = null,
		@SearchBy		varchar(30) = null,
		@SearchValue	varchar(30) = null,
		@NoticeType		varchar(15) =null,
		@NoticeArea		varchar(10)= null 
	)
AS
BEGIN   
  set nocount on
  declare @StaffList as table
  (Employee_ID  varchar(20),
   Appraisal_Year varchar(8),
   Unit_ID		  varchar(8))

 if @SearchBy ='Teacher'
	begin
			 set @SearchValue = @SearchValue +'%'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code = @SchoolCode  and TeacherName like @SearchValue
	end
 else if @SearchBy ='Phase'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code = @SchoolCode  and  AppraisalPhase = @SearchValue
else
    begin
		if @NoticeArea ='ALP'
			insert into @StaffList
			select Employee_ID,School_Year,School_code  
			from dbo.EPA_Appraisal_StaffListView
			where school_year = @SchoolYear and School_code = @SchoolCode  and  AppraisalPhase in ('E','NE1','NE2','NE3','NE4') -- and isnull(ALP_Result,'Not Start')  = 'Not Start'  
		if @NoticeArea in ('EPA','OBS')
			insert into @StaffList
			select  Employee_ID,School_Year,School_code
			from dbo.EPA_Appraisal_StaffListView
			where school_year = @SchoolYear and School_code = @SchoolCode  and  AppraisalPhase in ('E','NTP') and  Appraisal_Process ='Not Start'
	end

    declare @PS     varchar(7)
    declare @imgNote varchar(200)
    declare @imgAction varchar(200)
    declare @imgALP varchar(200)
    declare @imgEPA varchar(200)
    set @imgNote = ''')" > <img src="../images/edit.png" border="0" width="24" height="24" /> </a>'
    set @imgAction = ''')" > <img src="../images/action.png" border="0" width="25" height="25" /> </a>'
    set @imgALP = ''')" > <img src="../images/chinaz9.ico" border="0" width="25" height="25" /> </a>'
    set @imgEPA = ''')" > <img src="../images/chinaz13.ico" border="0" width="25" height="25" /> </a>'
    set @PS = ''','''


 	select  'ID' +'-' + rtrim(A.School_Year) +'-' + rtrim(A.School_code) +'-' + rtrim(A.Employee_ID) +'-' + rtrim(A.TeacherName )
			+ '-' + dbo.EPA_getNotificationUserEmail(@UserID, A.School_Year, A.School_code, A.Employee_ID,'OperateUser' )
			+ '-' + dbo.EPA_getNotificationUserEmail(@UserID, A.School_Year, A.School_code, A.Employee_ID,'NoticeUser' )
			+ '-' + dbo.EPA_getNotificationUserEmail(@UserID, A.School_Year, A.School_code, A.Employee_ID,'CCUser' )
			+ '-' + dbo.EPA_getUserNamebyID(Appraiser) 
			+ '-' + Appraisal_Type as myKey,
	A.School_Year as SchoolYear ,A.School_code as SchoolCode, A.Employee_ID as EmployeeID,

	'<a title="More Appraisal Action on '+ TeacherName + ' " href="javascript:OpenMenu(''' 
	 
		  + cast(A.IDs as  varchar(10)) + @PS + cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS + 'Appraisal1' + @PS  + A.TeacherName +  ''')" >' 
 	     + dbo.EPA_Appr_Status_Img('Notice',@NoticeType,A.Employee_ID,A.School_year,A.Appraisal_Type)  + '</a>'																					 as [Action],   



		case A.ALP_Result when  '' then A.ALP_Result else '<a title="Open ' + TeacherName + '`s ALP " href="javascript:OpenALP(''' 
		+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
		+ dbo.EPA_Appr_Result_Img('ALP', A.ALP_Result,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>' end as ALP,
		case  A.Appraisal_Process  when '' then  A.Appraisal_Process else
		'<a title="Open ' + TeacherName + '`s Appraisal Process " href="javascript:OpenAppraisal(''' 
		+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code    + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
		+ dbo.EPA_Appr_Result_Img('PPX', A.Appraisal_Process,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>' end as EPA,
    
		'<a title="View ' + TeacherName + ' Process Detail" href="javascript:OpenHistory(''' 
		+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code +   @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')">' + A.TeacherName + '</a>' as TeacherNameL,   
		 
		A.CurrentSession, 
		isnull(A.Appraisal_Type,'') as AppraisalType,
		dbo.EPA_getAppraisalPhase(A.AppraisalPhase) as AppraisalPhase,
 --		isnull(A.Appraisal_Role,'') as AppraisalRole,
		dbo.EPA_getUserNamebyID(Appraiser) as Appraiser, 
	--	case isnull(N.AppraisalArea,'') when @NoticeArea then  cast('1' as bit)  else   cast('0' as bit) end 	as SelectedC,
			cast('0' as bit)  as SelectedC,
	--	'false'	as EPANotice , 
		dbo.EPA_getNotificationDate(A.School_Year ,A.School_code, A.Employee_ID,A.CurrentSession, @NoticeType,@NoticeArea,'Appraiser','NoticeDate')  as NoticeDate,
		dbo.EPA_getNotificationDate(A.School_Year ,A.School_code, A.Employee_ID,A.CurrentSession, @NoticeType,@NoticeArea,'Appraiser','DueDate')  as DueDate,
		isnull(A.Assignment,'')		as Assignment,
		isnull(A.Comments,'')		as Comments,
		dbo.EPA_getSchoolName(A.School_Code,'Name')  as School,
  		A.TeacherName ,
	    dbo.EPA_getUserNamebyID(Mentor) as  Mentor,
   	  ROW_NUMBER() OVER(ORDER BY A.Appraisal_Type,   A.TeacherName ) AS RowNo 
        from  dbo.EPA_Appraisal_StaffListView  as A
		inner join @StaffList as S on A.Employee_ID = S.Employee_ID and A.School_Year =S.Appraisal_Year and A.School_Code =S.Unit_ID
		left join  [dbo].[EPA_Appr_Notification]  as N on A.School_Year =N.School_Year and A.School_Code  = N.School_Code and A.Employee_ID = N.EmployeeID and NoticeType = @NoticeType
  		order by  A.School_code, TeacherName
      
 END
 --  select * from dbo.EPA_Appr_Notification
   
/*
  if @Operate ='Teacher'
     insert into @StaffList
	 select Employee_ID,School_Year,School_code
	 from  dbo.EPA_Appraisal_StaffListView
	 where UserID =  @UserID
  else -- @Operate in ('Superintendent','Principal','Vice Principal')
     begin
	    if @SearchBy ='Teacher'
			 set @SearchValue = @SearchValue +'%'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code = @SchoolCode  and TeacherName like @SearchValue
		if @SearchBy ='ALP'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code = @SchoolCode  and  ALP_Result = @SearchValue
		if @SearchBy ='AppraisalPhase'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code = @SchoolCode  and  AppraisalPhase = @SearchValue
		if @SearchBy ='Process'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code = @SchoolCode  and  Appraisal_Process = @SearchValue    
	 end

*/	  











