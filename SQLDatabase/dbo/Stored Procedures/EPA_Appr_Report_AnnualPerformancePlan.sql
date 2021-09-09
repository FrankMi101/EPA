

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 1, 2018
-- Description:	get PPA Annual Growth Plan Working Template
-- ================================================================================== 
--dbo.EPA_Appr_Report_AnnualPerformancePlan  'Report', 'mif','20172018','0529','00012934', 'Appraisal1','PPA'
CREATE procedure [dbo].[EPA_Appr_Report_AnnualPerformancePlan] 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null
as
set nocount on
-- select * from  dbo.tcdsb_TPA_Appraisal_Text
--set @Domain = dbo.tcdsb_Login(@UserID,'Domain')
 declare @Gender varchar(1)

if @EmployeeID ='0000' set @SchoolCode ='000X'
--declare @eLevel varchar(2)
-- select top 1 @Gender = isnull(Gender,'N'),  @eLevel = isnull(EvidenceLevel,'16')
-- from tcdsb_TPA_School_Staff where UserID = @TeacherID and school_year = @SchoolYear
  declare @AppraiseeName varchar(50), @AppraiseeRole varchar(20), @AppraiserRole varchar(20) ,@Characteristics varchar(2000)
  set @AppraiseeName  = (select top 1 rtrim(FullName)  from EPA_Org_EmployeeList where Employee_ID = @EmployeeID)
 
  set @AppraiseeRole = (select top 1 Appraisal_Role												from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Unit_ID =@SchoolCode and Employee_ID =@EmployeeID )
  set @AppraiserRole = (select top 1 dbo.EPA_getAppraisalRoleByYear(Appraisal_year,Appraiser)	from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Unit_ID =@SchoolCode and Employee_ID =@EmployeeID )
  set @Characteristics =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'APP21')  
    
   

select Goals, StrategyAction, Practices, indicators, Results , @Characteristics as Characteristics,
 @AppraiseeName as AppraiseeName, @SchoolYear as AppraisalYear,  
 @AppraiseeRole as AppraiseeRole,  @AppraiserRole as AppraiserRole , B.*
 
from  [dbo].[EPA_Appr_Comments_APP] as A
left join  dbo.EPA_getReportSignatureRate(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'APP95')   as B on A.EmployeeID != ''
where A.School_Year =@SchoolYear and A.School_Code =@SchoolCode and A.EmployeeID =  @EmployeeID and SessionID =@SessionID  and ItemCode ='APP11'
order by SequenceNo 
  --select * from EPA_Appr_Comments where EmployeeID ='00012934'
  --select * from EPA_Appr_Rating where EmployeeID ='00012934'
  --select * from EPA_Appr_SignOff where EmployeeID ='00012934'