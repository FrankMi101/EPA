























 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 05, 2017 
--            : Modify by FRank @2020/07/10 chnage Appraisal Type to have start date and end date link
-- Description:	get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc      dbo.EPA_Appr_AppraisalStaffHistory 'Get','mif','20182019','0529','Teacher','00014245' 
CREATE Procedure [dbo].[EPA_Appr_AppraisalStaffHistory]
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser',
		@SchoolYear		varchar(8) = null,
		@SchoolCode		varchar(8) = null,
		@SearchBy		varchar(30) = null,
		@SearchValue	varchar(30) = null 
	)
AS
BEGIN   
  set nocount on
  declare @StaffList as table
  (Employee_ID  varchar(20),
   Appraisal_Year varchar(8),
   Unit_ID		  varchar(8),
   IDs           int)
    
     insert into @StaffList
	 select Employee_ID,School_Year,School_code,IDs
	 from  dbo.EPA_Appraisal_StaffListView
	 where Employee_ID= @SearchValue 
  

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


 	select  'ID' + School_Year  + School_code + A.Employee_ID + A.TeacherName as myKey, School_Year as SchoolYear ,School_code as SchoolCode, A.Employee_ID as EmployeeID,

			'<a title="More Appraisal Action on '+ TeacherName + ' " href="javascript:OpenMenu(''' 
		 + cast(A.IDs as  varchar(10)) + @PS  + cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS + 'Appraisal1' + @PS  + A.TeacherName +  ''')" >' 
 	     + dbo.EPA_Appr_Status_Img('Notes','',A.Employee_ID,A.School_year,A.Appraisal_Type)  + '</a>'  as [Action],   
 
		--case A.ALP_Result when  '' then A.ALP_Result else '<a title="Open ' + TeacherName + '`s ALP " href="javascript:OpenALP(''' 
		--+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
		--+ dbo.EPA_Appr_Result_Img('ALP', A.ALP_Result,A.Employee_ID,A.School_year ) + '</a>' end as ALP,
		case A.Appraisal_Type  when 'LTO' then '' when 'NTP' then '' else
		 '<a title="Open ' + TeacherName + '`s ALP " href="javascript:OpenALP(''' + cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
		 +  case  A.ALP_Result when  '' then  dbo.EPA_Appr_Result_Img('ALP','Not Start' ,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>'
		                                else  dbo.EPA_Appr_Result_Img('ALP',A.ALP_Result ,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>' end end		as ALP,
		  

		case left(A.AppraisalPhase,2) when 'NE' then  '' else 
		case A.Appraisal_Process  when '' then  A.Appraisal_Process else
		'<a title="Open ' + TeacherName + '`s Appraisal Process " href="javascript:OpenAppraisal(''' 
		+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code    + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
		+ dbo.EPA_Appr_Result_Img('PPX', A.Appraisal_Process,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>' end end as EPA,
    
    
		'<a title="View ' + TeacherName + '`s ' + A.School_year + ' appraisal Process Detail" href="javascript:OpenAppraisal(''' 
		+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code +   @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')">' +  A.School_year + '</a>' as AppraisalYear,   
 		Appraisal_Status  as AppraisalStatus,
--		isnull(A.Appraisal_Type,'') as AppraisalType,
		'<a title="Start Date:' + dbo.DateF(StartDate,'YYYYMMDD') + ' End Date:' +   dbo.DateF(EndDate,'YYYYMMDD') + '" href="#">' + 	isnull(A.Appraisal_Type,'') + '</a>'  as AppraisalType,


		dbo.EPA_getAppraisalPhase(A.AppraisalPhase) as AppraisalPhase,
 --		isnull(A.Appraisal_Role,'') as AppraisalRole,
		dbo.EPA_getUserNamebyID(Appraiser) as Appraiser, 		 
		A.CurrentSession,  A.Appraisal_Process as AppraisalProcess,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_1,''))	as	Appraisal1,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_2, ''))	as  Appraisal2 ,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_3,''))	as	Appraisal3,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_4, ''))	as  Appraisal4 ,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisaloutcome,'')) as AppraisalOutcome ,
 		isnull(A.Assignment,'')		as Assignment,
		isnull(A.Comments,'')		as Comments,
		dbo.EPA_getSchoolName(A.School_Code,'Name')  as AppraisalSchool,
  		A.TeacherName ,
	    dbo.EPA_getUserNamebyID(Mentor) as  Mentor,
   	    ROW_NUMBER() OVER(ORDER BY School_Year ) AS RowNo,
	    dbo.DateF(StartDate, 'YYYYMMDD') as StartDate,
	    dbo.DateF(EndDate, 'YYYYMMDD') as EndDate  
	from  dbo.EPA_Appraisal_StaffListView  as A
	inner join @StaffList as S on A.Employee_ID = S.Employee_ID and A.School_Year =S.Appraisal_Year and A.School_Code =S.Unit_ID and A.IDs =S.IDs
  	order by   School_Year , StartDate
    
 
 END
    











