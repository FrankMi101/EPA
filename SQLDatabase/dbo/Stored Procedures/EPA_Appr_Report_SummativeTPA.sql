
 
 
 -- drop proc dbo.EPA_Appr_Report_SummativeTPA  'Report', 'mif','20172018','0529','00014245', 'Appraisal2','NTP'
CREATE proc [dbo].[EPA_Appr_Report_SummativeTPA] 
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
 declare @Name varchar(50)
 set @Name  = (select top 1 rtrim(FullName)  from EPA_Org_EmployeeList where Employee_ID = @EmployeeID)
 
  declare @SUM11 varchar(250)    -- Assignment 
  declare @SUM31  varchar(4000)  --  Other Appraisal Input Relevant to the Principal's Appraisal of the Teacher's Performance
  declare @SUM41  varchar(4000)     -- NTIP participation check list 
  declare @SUM61  varchar(4000)  --  Growth Strategies
  declare @SUM71  varchar(4000)  --  Professional Growth and Stratigies for Teacher (for Satisfactory)
  declare @SUM72  varchar(4000)  --  Principal's summary comments on the evalution
  declare @SUM73  varchar(4000)  --  teacher's comment on the evaluation

  set @SUM11 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM11') 
  set @SUM31 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM31') 
  set @SUM41 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM41') 
  set @SUM61 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM61') 
  set @SUM71 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM71') 
  set @SUM72 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM72') 
  set @SUM73 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM73') 
   

select N.*,dbo.EPA_getDomainComments(N.DomainID,N.CompetencyID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID, @Name) as LookFors,
B.*,
@SUM11 as SUM11,  @SUM31 as SUM31, @SUM41 as SUM41, @SUM61 as SUM61, @SUM71 as SUM71, @SUM72 as SUM72, @SUM73 as SUM73 
 
from [dbo].[EPA_Appraisal_Competency_TPA] as N
left join dbo.EPA_getReportSignatureRate(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'SUM95') as B on N.DomainID !='' 
 
order by N.DomainID, N.CompetencyID 


