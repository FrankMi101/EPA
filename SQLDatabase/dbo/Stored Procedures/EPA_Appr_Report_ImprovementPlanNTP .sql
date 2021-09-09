





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 02, 2018 
-- Description:	get experience teacher Improvement plan report
-- ================================================================================== 
 
-- drop proc dbo.EPA_Appr_Report_ImprovementPlanTPA   'report','mif', '20172018','0529', '00014245','Appraisal1','TPA'
 create proc [dbo].[EPA_Appr_Report_ImprovementPlanNTP ]  
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
 
declare @SUM11 varchar(2000) -- SUM11  Description of Teacher’s Assignment (grade(s), subject(s), full-time/part-time, elementary/secondary, etc.)
declare @IMP11 varchar(4000) --IMP11 -  competencies requiring improvement  
declare @IMP21 varchar(4000) --IMP21 - Expectation on Improvement  
declare @IMP31 varchar(4000) --IMP31 -  Steps and Actions for improvement
declare @IMP41 varchar(4000) --IMP41   Support from the Principal and Board
declare @IMP42 varchar(4000) --IMP42   sample Indicators of Success  
declare @IMP52 varchar(4000) --IMP52  - Teacher's comments on the Improvement Plan
 
  set @SUM11 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM11') 
  set @IMP11 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP11') 
  set @IMP21 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP21') 
  set @IMP31 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP31') 
  set @IMP41 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP41') 
  set @IMP42 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP42') 
  set @IMP52 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP52') 
    
  declare @DateNext  varchar(10) -- Date of Next Performance Appraisal    
 set @DateNext =  dbo.EPA_getAppraisalCommentSmall(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP95','Date') 
select 
	@DateNext as DateNext,	
  	isnull(@SUM11,'') as SUM11,
  	isnull(@IMP11,'') as IMP11,
 	isnull(@IMP21,'') as IMP21,
	isnull(@IMP31,'') as IMP31,
	isnull(@IMP41,'') as IMP41,
	isnull(@IMP42,'') as IMP42,
	isnull(@IMP52,'') as IMP52 , *
  

 from dbo.EPA_getReportSignature(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'IMP95') 


 
-- select * from EPA_Appr_Comments where EmployeeID='00014245'  and SessionID ='Appraisal1' 
--   select * from [dbo].[EPA_Appr_Comments_small] where EmployeeID='00014245'  and SessionID ='Appraisal1' 






