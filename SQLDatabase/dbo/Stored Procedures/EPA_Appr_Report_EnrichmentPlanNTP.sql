





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 02, 2018 
-- Description:	get experience teacher Improvement plan report
-- ================================================================================== 
 
-- drop proc dbo.EPA_Appr_Report_EnrichmentPlan    'report','mif', '20172018','0529', '00010461','Appraisal1','NTP'
 create proc [dbo].[EPA_Appr_Report_EnrichmentPlanNTP]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null
as
set nocount on
-- select * from  [dbo].[EPA_Appr_Comments
--set @Domain = dbo.tcdsb_Login(@UserID,'Domain')
 
declare @SUM11 varchar(2000) --SUM11  Description of Teacher’s Assignment (grade(s), subject(s), full-time/part-time, elementary/secondary, etc.)
declare @ENR11 varchar(4000) --ENR11 - Competencies Requiring Development  
declare @ENR21 varchar(4000) --ENP21 - Expectation 
declare @ENR31 varchar(4000) --ENR31 - Element(s) of NTIP to Be Provided to Teacher
declare @ENR32 varchar(4000) --ENR32 - Description of Participation in Element(s)(including topic, strategy,timeline, etc.)
declare @ENR33 varchar(4000) --ENR33 - Release Days (if required)
declare @ENR71 varchar(4000) --ENR71 - Principal's Comments on the Enrichment Plan (Optional)
declare @ENR73 varchar(4000) --ENR73 - Teacher's Comments on the Enrichment Plan (Optional)
  
  set @SUM11 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM11') 
  set @ENR11 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR11') 
  set @ENR21 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR21') 
  set @ENR31 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR31') 
  set @ENR32 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR32') 
  set @ENR33 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR33') 
  set @ENR71 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR71') 
  set @ENR73 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR73') 
    
  declare @DateNext  varchar(10) -- Date of Next Performance Appraisal    
 set @DateNext =  dbo.EPA_getAppraisalCommentSmall(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR95','Date') 
select 
	@DateNext as DateNext,	
  	isnull(@SUM11,'') as SUM11,
  	isnull(@ENR11,'') as ENR11,
 	isnull(@ENR21,'') as ENR21,
	isnull(@ENR31,'') as ENR31,
	isnull(@ENR32,'') as ENR32,
	isnull(@ENR33,'') as ENR33,
	isnull(@ENR71,'') as ENR71 ,
	isnull(@ENR73,'') as ENR73 ,
	 *
 from dbo.EPA_getReportSignature(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'ENR95') 


 
-- select * from EPA_Appr_Comments where EmployeeID='00010461'  and SessionID ='Appraisal1' 
--   select * from [dbo].[EPA_Appr_Comments_small] where EmployeeID='00014245'  and SessionID ='Appraisal1' 






