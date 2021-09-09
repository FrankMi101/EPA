



-- drop proc dbo.EPA_Appr_Report_SummativeNTP  'Report', 'mif','20172018','0529','00010461', 'Appraisal3','NTP'

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 31, 2018 Summative
-- Description:	 NTIP Summative Report
-- ================================================================================== 
 CREATE proc [dbo].[EPA_Appr_Report_SummativeNTP]    
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
 

  declare @SUM11 varchar(250)    -- Assignment 
  declare @SUM41 varchar(10)     -- NTIP participation check list 
  declare @SUM42  varchar(2000)  --  Other Appraisal Input Relevant to the Principal's Appraisal of the Teacher's Performance
--  declare @SUM59  varchar(2000)  --  Addition Domain competency Comments
  declare @SUM61  varchar(4000)  --  Growth Strategies
  declare @SUM72  varchar(4000)  --  Principal's summary comments on the evalution
  declare @SUM73  varchar(4000)  --  teacher's comment on the evaluation

  set @SUM41 = (select top 1 Appraisal_Chose from [dbo].[EPA_Appr_Comments_small]	where School_year = @Schoolyear and School_code = @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and ItemCode ='SUM41') 
  set @SUM11 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM11') 
  set @SUM42 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM42') 
  set @SUM61 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM61') 
  set @SUM72 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM72') 
  set @SUM73 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM73') 
   

select N.*,dbo.EPA_getCompetencyComments(N.DomainID,N.CompetencyID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID) as LookFors,
B.*,
@SUM11 as SUM11, @SUM41 as SUM41, @SUM42 as SUM42,  @SUM61 as SUM61,@SUM72 as SUM72, @SUM73 as SUM73 
 
from [dbo].[EPA_Appraisal_Competency_NTP] as N
left join dbo.EPA_getReportSignatureRate(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'SUM95') as B on N.DomainID !='' 
 
order by N.DomainID, N.CompetencyID 

 


