





-- drop proc dbo.EPA_Appr_Report_EvidenceLog  'Appraiser', 'mif','20172018','0529','00014245', 'Appraisal1','TPA'

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 2, 2018 Summative
-- Description:	 EvidenceLog
-- ================================================================================== 
 CREATE proc [dbo].[EPA_Appr_Report_EvidenceLogInput]    
 	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@DomainID		varchar(10)= null, 
	@CompetencyID	varchar(10)= null,
	@obJRole		varchar(10) = null 
	
as
set nocount on

select 	dbo.DateF(LogDate,'YYYYMMDD') as LogDate , 
		case   when LookForsID > 200 then  isnull(Comments,'') 
		else   dbo.EPA_getLookFors(DomainID,CompetencyID,LookForsID)  end as LookForsNotes,
		  ROW_NUMBER() OVER(ORDER BY   DomainID, CompetencyID, LookForsID ) AS RowNo  
 from  [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]  
 where  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and DomainID = @DomainID and CompetencyID = @CompetencyID  and WorkRole = @ObjRole  and LogCheck= 1 and AllowView  = 1
 order by RowNo

 

	 

--  select * from [dbo].[EPA_Appr_EvidenceLog_DomainCompetency]

--select * from [dbo].[EPA_Appr_LookFors_DomainCompetency]


