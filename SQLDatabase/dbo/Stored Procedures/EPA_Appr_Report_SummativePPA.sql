
--  drop proc dbo.EPA_Appr_Report_SummativePPA  'Report', 'mif','20172018','0529','00012934', 'Appraisal1','PPA'
 
CREATE procedure [dbo].[EPA_Appr_Report_SummativePPA] 
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
 declare @AppraiseeName varchar(50), @AppraiseeRole varchar(20), @AppraiserRole varchar(20)
  set @AppraiseeName  = (select top 1 rtrim(FullName)  from EPA_Org_EmployeeList where Employee_ID = @EmployeeID)
 
  set @AppraiseeRole = (select top 1 Appraisal_Role												from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Unit_ID =@SchoolCode and Employee_ID =@EmployeeID )
  set @AppraiserRole = (select top 1 dbo.EPA_getAppraisalRoleByYear(Appraisal_year,Appraiser)	from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Unit_ID =@SchoolCode and Employee_ID =@EmployeeID )

  declare @SUM22  varchar(4000) -- SUM22 - APM22  Leadership practices and competencies from the Performance Plan that have contributed strongly to the principal’s/vice-principal’s overall performance: 
  declare @SUM33  varchar(4000) -- SUM33 - APM33  Leadership practices and competencies from the Performance Plan that could be strengthened for further growth and development:  
  declare @SUM61  varchar(4000) -- SUM61 - Supervisory Officer’s/Principal’s summative comments on the appraisal:  
  declare @SUM72  varchar(4000) -- SUM72 - Appraisee's Principal’s/Vice-Principal’s comments (optional):  

  set @SUM22 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'APM22') 
  set @SUM33 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'APM33') 
  set @SUM61 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM61') 
  set @SUM72 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM72') 
   

select *, @AppraiseeName as AppraiseeName, @SchoolYear as AppraisalYear,
 @AppraiseeRole as AppraiseeRole,
 @AppraiserRole as AppraiserRole,
@SUM22 as SUM22,  @SUM33 as SUM33,   @SUM61 as SUM61,   @SUM72 as SUM72 
 
from  dbo.EPA_getReportSignatureRate(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'SUM95')  
  
  --select * from EPA_Appr_Comments where EmployeeID ='00012934'
  --select * from EPA_Appr_Rating where EmployeeID ='00012934'
  --select * from EPA_Appr_SignOff where EmployeeID ='00012934'