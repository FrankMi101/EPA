

CREATE view [dbo].[EPA_Appraisal_StaffList]
as 
select 
A.Appraisal_year as School_Year, O.Unit_ID as School_Code,
A.Appraisal_Type,
A.Employee_ID,O.UserID, O.FullName as TeacherName, O.Employee_Position,Employee_Status,
A.Appraisal_Cycle as AppraisalPhase,A.Assignment, A.Comments,
A.Appraiser, A.Mentor, 
A.ALP_Result,
A.Appraisal_Process,
A.Appraisal_Result as Appraisaloutcome,
A.Appraisal_1,
A.Appraisal_2,
A.Appraisal_3,
A.Appraisal_4 
from [dbo].[EPA_Appr_EmployeeList] as A
inner join  [dbo].[EPA_Org_EmployeeList] as O on A.Employee_ID = O.Employee_ID
--where A.Appraisal_year = @SchoolYear  and A.Unit_ID = @SchoolCode 
