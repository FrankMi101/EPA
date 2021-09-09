



 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 ; enhanced by Frank at 2018/03/15  get image icon by function
-- Description:	get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc  dbo.EPA_Appr_AppraisalStaffList 'TPA','mif', 'Admin', '20192020','0529','Teacher','','TPA' 
CREATE Procedure [dbo].[EPA_Appr_AppraisalStaffList]
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser',
		@UserRole		varchar(30) = 'Teacher',
		@SchoolYear		varchar(8) = null,
		@SchoolCode		varchar(8) = null,
		@SearchBy		varchar(30) = null,
		@SearchValue	varchar(30) = null,
		@WorkingON		varchar(10) ='TPA'
	)
AS
BEGIN   
  set nocount on


  declare @SchoolList as table
  (SchoolCode	  varchar(8))
  if (left(@SchoolCode,4) ='Area' and @WorkingON ='PPA')
     insert into @SchoolList
	 select UnitCode from EPA_Org_Schools where Area = @SchoolCode
  else
     insert into @SchoolList
	 Values(@SchoolCode) 

  declare @StaffList as table
  (Employee_ID  varchar(20),
   Appraisal_Year varchar(8),
   Unit_ID		  varchar(8),
   IDs            int,
   Category		  varchar(10),
   Phase		  varchar(10)	)

  if @UserRole ='Teacher'
     insert into @StaffList
	 select Employee_ID,School_Year,School_code,IDs,Appraisal_Type, AppraisalPhase
	 from  dbo.EPA_Appraisal_StaffListView
	 where UserID =  @UserID
  else -- @Operate in ('Superintendent','Principal','Vice Principal')
     begin
	    if @SearchBy ='Teacher'
			 insert into @StaffList
			 select  Employee_ID,School_Year,School_code,IDs, Appraisal_Type , AppraisalPhase
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year =   @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and TeacherName like @SearchValue +'%'
		else if @SearchBy ='ALP'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type, AppraisalPhase
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  ALP_Result = @SearchValue
		else if @SearchBy ='AppraisalPhase'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type, AppraisalPhase
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  AppraisalPhase = @SearchValue
		else if @SearchBy ='Phase'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code ,IDs , Appraisal_Type, AppraisalPhase
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  AppraisalPhase = @SearchValue
		else if @SearchBy ='Process'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type, AppraisalPhase
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  Appraisal_Process = @SearchValue    
        else
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type, AppraisalPhase
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList) 

	    if @WorkingON ='PPA'
			delete @StaffList where  Category != 'PPA'		
        else
			begin
				delete @StaffList where Category = 'PPA'
				if @Operate ='Evaluation' delete @StaffList where  Phase != 'E'
				if @Operate ='TPA' delete @StaffList where  Phase not in ('NE1','NE2','NE3','NE4') 
				if @Operate ='NTP' delete @StaffList where Category != 'NTP' 
				if @Operate ='LTO' delete @StaffList where Category != 'LTO' 
				if @Operate ='RET' delete @StaffList where  Phase not in ('E','NTP','LTO') 
			end
 
	 end

---select * from @StaffList

    declare @PS     varchar(7)
    set @PS = ''','''

 	select  'ID' + School_Year  + School_code + A.Employee_ID + A.TeacherName as myKey, School_Year as SchoolYear ,School_code as SchoolCode, A.Employee_ID as EmployeeID,

		'<a title="More Appraisal Action on '+ TeacherName + ' " href="javascript:OpenMenu(''' 
		 + cast(A.IDs as  varchar(10)) + @PS + cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS + 'Appraisal1' + @PS  + A.TeacherName +  ''')" >' 
 	     + dbo.EPA_Appr_Status_Img('Notes','',A.Employee_ID,A.School_year,A.Appraisal_Type)  + '</a>'																					 as [Action], 
		 
		 case A.Appraisal_Type when 'LTO' then '' when 'NTP' then '' else
		 '<a title="Open ' + TeacherName + '`s ALP " href="javascript:OpenALP(''' + cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
		 +  case  A.ALP_Result when  '' then  dbo.EPA_Appr_Result_Img('ALP', 'Not Start', A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>'
		                                else  dbo.EPA_Appr_Result_Img('ALP', A.ALP_Result,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>' end end		as ALP,

		case left(A.AppraisalPhase,2) when 'NE' then  '' else  																		
		case  A.Appraisal_Process  when '' then  A.Appraisal_Process else
		'<a title="Open ' + TeacherName + '`s Appraisal Process " href="javascript:OpenAppraisal(''' 
		+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code    + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
		+ dbo.EPA_Appr_Result_Img('PPX', A.Appraisal_Process,A.Employee_ID,A.School_year,A.Appraisal_Type  ) + '</a>' end	end as EPA,
    
		'<a title="View ' + TeacherName + '(' +  A.Employee_ID + ') Process Detail" ' + 'href="javascript:OpenHistory(''' 
		+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code +   @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')">' + A.TeacherName + '</a>' as TeacherNameL,   
		 
		Appraisal_Status  as AppraisalStatus,
		'<a title="Start Date:' + dbo.DateF(StartDate,'YYYYMMDD') + ' End Date:' +   dbo.DateF(EndDate,'YYYYMMDD') + '" href="#">' + 	isnull(A.Appraisal_Type,'') + '</a>'  as AppraisalType,

		dbo.EPA_getAppraisalPhase(A.AppraisalPhase) as AppraisalPhase,
 --		isnull(A.Appraisal_Role,'') as AppraisalRole,
		dbo.EPA_getUserNamebyID(Appraiser) as Appraiser, 		 
		A.CurrentSession,  A.Appraisal_Process as AppraisalProcess,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_1,''))	as Appraisal1,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_2, ''))	as  Appraisal2 ,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_3,''))	as Appraisal3,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_4, ''))	as  Appraisal4 ,
		[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisaloutcome,'')) as AppraisalOutcome ,
		case @WorkingON when 'PPA' then Employee_Position
						else isnull(A.Assignment,'')	end	as Assignment,
		Case @WorkingON when 'PPA' then dbo.EPA_getSchoolName(A.School_Code,'Name')
						else isnull(A.Comments,'')	end	as Comments,
		dbo.EPA_getSchoolName(A.School_Code,'Name')  as School,
  		A.TeacherName ,
	    dbo.EPA_getUserNamebyID(isnull(Mentor,'')) as  Mentor,
		Employee_Position as EmployeePosition,
   	  ROW_NUMBER() OVER(ORDER BY case Appraisal_role when 'Principal' then '1' when 'VP' then '2' else '3' end,  A.TeacherName, A.Appraisal_Type,  A.AppraisalPhase ) AS RowNo ,
	  A.IDs
        from  dbo.EPA_Appraisal_StaffListView  as A
		inner join @StaffList as S on A.Employee_ID = S.Employee_ID and A.School_Year =S.Appraisal_Year and A.School_Code =S.Unit_ID and A.IDs = S.IDs
  		order by  RowNo
    
	-- select * from   dbo.EPA_Appraisal_StaffListView  where school_year ='20192020' and School_Code ='0529'
 
 END
     
	  
	   

