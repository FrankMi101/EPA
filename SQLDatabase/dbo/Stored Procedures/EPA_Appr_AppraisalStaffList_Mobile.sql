


 
-- ==================================================================================
-- Author		: Frank Mi
-- Create date	: October 28, 2020 ; enhanced by Frank at 2018/03/15  get image icon by function
-- Modify		: Enhance for Mobile from dbo.EPA_Appr_AppraisalStaffList  
-- Description	: get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc  dbo.EPA_Appr_AppraisalStaffList 'SO','mif','20192020','0529','Teacher','','TPA' 
CREATE Procedure [dbo].[EPA_Appr_AppraisalStaffList_Mobile]
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser',
		@UserRole		varchar(30) = 'Principal',
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
   Category		  varchar(10)	)

  if @Operate ='Teacher'
     insert into @StaffList
	 select Employee_ID,School_Year,School_code,IDs,Appraisal_Type
	 from  dbo.EPA_Appraisal_StaffListView
	 where UserID =  @UserID
  else -- @Operate in ('Superintendent','Principal','Vice Principal')
     begin
	    if @SearchBy ='Teacher'
			 insert into @StaffList
			 select  Employee_ID,School_Year,School_code,IDs, Appraisal_Type
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year =   @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and TeacherName like @SearchValue +'%'
		else if @SearchBy ='ALP'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  ALP_Result = @SearchValue
		else if @SearchBy ='AppraisalPhase'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  AppraisalPhase = @SearchValue
		else if @SearchBy ='Phase'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code ,IDs , Appraisal_Type
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  AppraisalPhase = @SearchValue
		else if @SearchBy ='Process'
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList)  and  Appraisal_Process = @SearchValue    
        else
			 insert into @StaffList
			 select Employee_ID,School_Year,School_code,IDs, Appraisal_Type
			 from dbo.EPA_Appraisal_StaffListView
			 where school_year = @SchoolYear and School_code in (select SchoolCode from @SchoolList) 

	    if @WorkingON ='PPA'
		    delete @StaffList where  Category != 'PPA'
        else
			delete @StaffList where Category = 'PPA'
 
	 end

 
 	select  'ID' + School_Year  + School_code + A.Employee_ID + A.TeacherName as myKey, School_Year as SchoolYear ,School_code as SchoolCode, A.Employee_ID					as EmployeeID,
			[dbo].[EPA_Appr_ListAction]('ApprAction',A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.Appraisaloutcome, TeacherName,A.IDs)	as [Action],
			[dbo].[EPA_Appr_ListAction]('ApprALP'   ,A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.ALP_Result,       TeacherName,A.IDs)	as ALP,
 			[dbo].[EPA_Appr_ListAction]('ApprEPA'   ,A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.Appraisal_Process,TeacherName,A.IDs)	as EPA,
 			[dbo].[EPA_Appr_ListAction]('ApprName'  ,A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.Appraisal_Process,TeacherName,A.IDs)	as TeacherNameL,	 
			Appraisal_Status  as AppraisalStatus,
			'<a title="Start Date:' + dbo.DateF(StartDate,'YYYYMMDD') + ' End Date:' +   dbo.DateF(EndDate,'YYYYMMDD') + '" href="#">' + 	isnull(A.Appraisal_Type,'') + '</a>'  as AppraisalType,

			dbo.EPA_getAppraisalPhase(A.AppraisalPhase) as AppraisalPhase,
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
     
	   

