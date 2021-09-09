
 
-- ==================================================================================
-- Author		: Frank Mi
-- Create date	: October 28, 2020
--				: Simplefy for Mobile by Frank copy from  dbo.EPA_Appr_AppraisalStaffHistory
-- Description	: get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc      dbo.EPA_Appr_AppraisalStaffHistory 'Get','mif','20182019','0529','Teacher','00014245' 
CREATE Procedure [dbo].[EPA_Appr_AppraisalStaffHistory_Mobile]
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser',
		@UserRole		varchar(30) = 'Teacher',
		@EmployeeID		varchar(30) = null 
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
	 where Employee_ID= @EmployeeID 

 	select  'ID' + School_Year  + School_code + A.Employee_ID + A.TeacherName as myKey, School_Year as SchoolYear ,School_code as SchoolCode,			A.Employee_ID	  as EmployeeID,
	       [dbo].[EPA_Appr_ListAction]('ApprAction',A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.Appraisaloutcome, TeacherName,A.IDs) as [Action],
	       [dbo].[EPA_Appr_ListAction]('ApprALP',	A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.ALP_Result,	   TeacherName,A.IDs) as ALP,
 	       [dbo].[EPA_Appr_ListAction]('ApprEPA',	A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.Appraisal_Process,TeacherName,A.IDs) as EPA,
 	       [dbo].[EPA_Appr_ListAction]('ApprYear',	A.School_year,A.School_code,A.Employee_ID, A.Appraisal_Type, A.AppraisalPhase, A.Appraisal_Process,TeacherName,A.IDs) as AppraisalYear,
 			Appraisal_Status  as AppraisalStatus,
			'<a title="Start Date:' + dbo.DateF(StartDate,'YYYYMMDD') + ' End Date:' +   dbo.DateF(EndDate,'YYYYMMDD') + '" href="#">' + 	isnull(A.Appraisal_Type,'') + '</a>'  as AppraisalType,
			dbo.EPA_getAppraisalPhase(A.AppraisalPhase) as AppraisalPhase,
			dbo.EPA_getUserNamebyID(Appraiser)			as Appraiser, 		 
			A.CurrentSession,  A.Appraisal_Process		as AppraisalProcess,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_1,''))		as	Appraisal1,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_2, ''))		as  Appraisal2 ,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_3,''))		as	Appraisal3,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_4, ''))		as  Appraisal4 ,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisaloutcome,'')) as AppraisalOutcome ,
 			isnull(A.Assignment,'')		as Assignment,
			isnull(A.Comments,'')		as Comments,
			dbo.EPA_getSchoolName(A.School_Code,'Name')  as AppraisalSchool,
  			A.TeacherName ,
			dbo.EPA_getUserNamebyID(Mentor)			as  Mentor,
   			ROW_NUMBER() OVER(ORDER BY School_Year ) as RowNo,
			dbo.DateF(StartDate, 'YYYYMMDD')		as StartDate,
			dbo.DateF(EndDate, 'YYYYMMDD')			as EndDate  
	from  dbo.EPA_Appraisal_StaffListView  as A
	inner join @StaffList as S on A.Employee_ID = S.Employee_ID and A.School_Year =S.Appraisal_Year and A.School_Code =S.Unit_ID and A.IDs =S.IDs
  	order by   School_Year , StartDate
    
 
 END
    











