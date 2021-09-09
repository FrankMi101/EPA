



CREATE view [dbo].[EPA_Appraisal_StaffListView]
as 
select A.IDs,
A.Appraisal_year as School_Year, A.Unit_ID as School_Code,
A.Appraisal_Type,
A.Employee_ID,O.UserID, O.FullName as TeacherName, O.Employee_Position, O.eMail, A.Appraisal_Status,
A.Appraisal_Cycle as AppraisalPhase, A.Appraisal_Role,A.Assignment, A.Comments,
A.Appraiser, A.Mentor, A.EvidenceLevel,
A.ALP_Result, 
--A.Appraisal_1,A.Appraisal_2,A.Appraisal_3,A.Appraisal_4,
A.Appraisal_Result as Appraisaloutcome,
---A.Appraisal_Result,A.Appraisal_Process,
--	 dbo.EPA_Appr_Result(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,'OutCome')	as  Appraisaloutcome,  
 --		 dbo.EPA_Appr_Result(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,'Process_Step', A.Appraisal_Type) as Appraisal_Process,  
		
 --			 dbo.EPA_Appr_Result(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,'Complete_Year') as Complete_Year    
 
 
--			 dbo.EPA_Appr_Result_ALP(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,'Appraisal1') as ALP_Result,
			 dbo.EPA_appr_CurrentAppraisalSession(A.Appraisal_year,A.Employee_ID,A.Unit_ID,Appraisal_Cycle,A.Appraisal_Type) as CurrentSession,
    	     dbo.EPA_Appr_Result_BySession_New(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,A.Appraisal_Type,'Appraisal1','Outside') as Appraisal_1,
       		 dbo.EPA_Appr_Result_BySession_New(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,A.Appraisal_Type,'Appraisal2','Outside') as Appraisal_2,
        	 dbo.EPA_Appr_Result_BySession_New(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,A.Appraisal_Type,'Appraisal3','Outside') as Appraisal_3, 
       		 dbo.EPA_Appr_Result_BySession_New(A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,A.Appraisal_Type,'Appraisal4','Outside') as Appraisal_4,
			 dbo.EPA_Appr_Result_ProcessStep  (A.Appraisal_year,A.Unit_ID,A.Employee_ID,Appraisal_Cycle,A.Appraisal_Type,'AppraisalX') as Appraisal_Process,
A.TimeType,
StartDate, EndDate			  

from [dbo].[EPA_Appr_EmployeeList] as A
inner join  [dbo].[EPA_Org_EmployeeList] as O on A.Employee_ID = O.Employee_ID
--where A.Appraisal_year = @SchoolYear  and A.A.Unit_ID = @SchoolCode 
  
