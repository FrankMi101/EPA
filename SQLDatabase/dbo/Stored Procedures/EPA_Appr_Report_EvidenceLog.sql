




-- drop proc dbo.EPA_Appr_Report_EvidenceLog  'Appraiser', 'mif','20172018','0529','00014245', 'Appraisal1','TPA'

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 2, 2018 Summative
-- Description:	 EvidenceLog
-- ================================================================================== 
 CREATE proc [dbo].[EPA_Appr_Report_EvidenceLog]    
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
 
  declare @Assignment varchar(100)
  set @Assignment =  (select Assignment from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID)
   
if @Category ='NTP'
	select N.*,dbo.EPA_getCompetencyLookForsNote(N.DomainID,N.CompetencyID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Operate) as LookForsNote,
			   dbo.EPA_getCompetencyLookFors(N.DomainID,N.CompetencyID) as LookFors,  B.* , @Operate as ApprRole, @Assignment as Assignment , getdate() as AssignmentDate  
 	from [dbo].[EPA_Appraisal_Competency_NTP] as N
	left join dbo.EPA_getReportSignature(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'ALP95') as B on N.DomainID !='' 
    where N.DomainID !='6'
	order by N.DomainID, N.CompetencyID 
else
	select N.*,dbo.EPA_getCompetencyLookForsNote(N.DomainID,N.CompetencyID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Operate) as LookForsNote,
			  dbo.EPA_getCompetencyLookFors(N.DomainID,N.CompetencyID) as LookFors,  B.*  , @Operate as ApprRole, @Assignment as Assignment, getdate() as AssignmentDate  
 	from [dbo].[EPA_Appraisal_Competency_TPA] as N
	left join dbo.EPA_getReportSignature(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'ALP95') as B on N.DomainID !='' 
	where N.DomainID !='6'
	order by N.DomainID, N.CompetencyID 	

--  select * from [dbo].[EPA_Appr_EvidenceLog_DomainCompetency]

--select * from [dbo].[EPA_Appr_LookFors_DomainCompetency]

