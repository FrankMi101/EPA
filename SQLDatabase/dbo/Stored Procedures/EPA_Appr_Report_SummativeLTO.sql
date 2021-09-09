



 
  
 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 30, 2018 
-- Description:	 LTO Appraisal Report Date 
-- ==================================================================================

-- drop proc dbo.EPA_Appr_Report_SummativeLTO 'report', 'mif','20172018','0529','00040314','Appraisal1','LTO'

 CREATE proc [dbo].[EPA_Appr_Report_SummativeLTO]    
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null
as
set nocount on
-- select * from  dbo.tcdsb_TPA_Appraisal_Text where school_year ='20102011'
--set @Domain = dbo.tcdsb_Login(@UserID,'Domain')
 declare @Gender varchar(1)

if @EmployeeID ='0000' set @SchoolCode ='000X'
 

declare @Assignment Varchar(100),  @DateAssignment Varchar(100), @DateStart varchar(20),  @DateEnd varchar(20), @LengthMonth Varchar(50) ,  @SAPNo varchar(50) 
 
declare @PreObservation varchar(10), @Observation varchar(10), @PostObservation varchar(10)   
declare @Recommendation Varchar(2000),  @PrincipalComments Varchar(1000) , @TeacherComments varchar(1000)
declare @Rate int, @Rate1 int,  @Rate2 int,@Rate3 int,@Rate4 int,@Rate5 int,@Rate6 int,@Rate7 int
declare @Comm1 varchar(250), @Comm2 varchar(250),@Comm3 varchar(250),@Comm4 varchar(250),@Comm5 varchar(250),@Comm6 varchar(250),@Comm7 varchar(250),@Comm8 varchar(500)
  
   					
 
 select top 1  @Assignment = Assignment, @LengthMonth = LengthMonth,  @DateAssignment = 'Start Date:' + dbo.DateF(Start_Date,'YYYYMMDD') + '; ' + 'End Date:' + dbo.DateF(End_Date,'YYYYMMDD') , @DateStart = Start_Date , @DateEnd = End_Date , @SAPNo = EmployeeID
 from  [dbo].[EPA_Appr_Assignment] 
 where  School_year =@Schoolyear  and school_code = @SchoolCode and  SessionID = @SessionID and   EmployeeID = @EmployeeID and ItemCode = 'SUM11'

set   @Recommendation    =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM61')
set   @PrincipalComments =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM72')
set   @TeacherComments   =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM73')

  
 select top 1 @Rate1 = isnull(Rate,0), @Comm1 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='1'    
 select top 1 @Rate2 = isnull(Rate,0), @Comm2 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='2'    
 select top 1 @Rate3 = isnull(Rate,0), @Comm3 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='3'    
 select top 1 @Rate4 = isnull(Rate,0), @Comm4 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='4'   
 select top 1 @Rate5 = isnull(Rate,0), @Comm5 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='5'    
 select top 1 @Rate6 = isnull(Rate,0), @Comm6 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='6'    
 select top 1 @Rate7 = isnull(Rate,0), @Comm7 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='7'  
 select top 1						   @Comm8 = isnull(Appraisal_Note,'') from [dbo].[EPA_Appr_Comments_DomainCompetency] where School_year =@Schoolyear and SessionID = @SessionID and EmployeeID = @EmployeeID and CompetencyID ='8'   
 
  
/*	 
--set @PreObservation  = ( select top 1 dbo.DateF(Observation_Date,'YYYYMMDD') from dbo.EPA_Appr_Comments_Observation where  School_year =  @Schoolyear and SessionID = @SessionID and  EmployeeID = @EmployeeID and ItemCode ='OBS21'  )
--set @Observation     = ( select top 1 dbo.DateF(Observation_Date,'YYYYMMDD') from dbo.EPA_Appr_Comments_Observation where  School_year =  @Schoolyear and SessionID = @SessionID and   EmployeeID = @EmployeeID and ItemCode ='OBS22'  )
--set @PostObservation = ( select top 1 dbo.DateF(Observation_Date,'YYYYMMDD') from dbo.EPA_Appr_Comments_Observation where  School_year =  @Schoolyear and SessionID = @SessionID and   EmployeeID = @EmployeeID and ItemCode ='OBS23'  )
 
declare @SignNameP varchar(50)
declare @SignNameT  varchar(50)
declare @SignDateP varchar(30)
declare @SignDateT  varchar(30)

select  top 1 @SignNameP = [Signature], @SignDateP = dbo.DateF(SignOff_date,'YYYYMMDD')  
from [dbo].[EPA_Appr_SignOff] 
where SignOff_Type ='Appraiser' and ItemCode = 'SUM95' 
		and	School_year = @Schoolyear and School_code = @SchoolCode 
        and SessionID = @SessionID   and EmployeeID = @EmployeeID  

select top 1  @SignNameT = Signature, @SignDateT= dbo.DateF(SignOff_date,'YYYYMMDD')  
from [dbo].[EPA_Appr_SignOff] 
where SignOff_Type ='Appraisee' and ItemCode = 'SUM95' 
		and	School_year = @Schoolyear and School_code =@SchoolCode 
        and SessionID = @SessionID   and EmployeeID = @EmployeeID  
  
*/
select 	*,
 
    isnull(@Assignment , '')		as Assignment,
	isnull(@LengthMonth , '')		as LengthTerm,
	isnull(@DateAssignment , '')	as DateAssignment,
	isnull(@DateEnd , '')			as DateEnd,
 	isnull(@SAPNo	, '')			as SAPNo,
	isnull(@Recommendation , '')	as Recommendation,
	isnull(@PrincipalComments	, '') as  PrincipalComments,
	isnull(@TeacherComments	, '')	as  TeacherComments,

	isnull(@Rate1, 0) as Rate1,
	isnull(@Rate2, 0) as Rate2,
	isnull(@Rate3, 0) as Rate3,
	isnull(@Rate4, 0) as Rate4,
	isnull(@Rate5, 0) as Rate5,
	isnull(@Rate6, 0) as Rate6,
	isnull(@Rate7, 0) as Rate7, 
 	isnull(@Comm1, '') as Comm1,
	isnull(@Comm2, '') as Comm2,
	isnull(@Comm3, '') as Comm3,
	isnull(@Comm4, '') as Comm4,
	isnull(@Comm5, '') as Comm5,
	isnull(@Comm6, '') as Comm6,
	isnull(@Comm7, '') as Comm7, 
	isnull(@Comm8, '') as Comm8 
 from  dbo.EPA_getReportSignatureRate(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'SUM95') 


