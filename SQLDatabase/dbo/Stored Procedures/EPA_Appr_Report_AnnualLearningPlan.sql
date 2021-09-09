




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 05, 2017 
-- Description:	get school appraisal staff list 
-- ================================================================================== 
 
-- drop proc dbo.EPA_Appr_Report_AnnualLearningPlan   'report','mif', '20172018','0529', '00024092','Appraisal1','TPA'
 CREATE proc [dbo].[EPA_Appr_Report_AnnualLearningPlan]  
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
 


declare @ALP_17 Varchar(10) -- Date of next performance appraisal
declare @SUM_11 Varchar(2000) -- areas of professional growth that i am interested in pursing

declare @ALP_11 Varchar(4000) -- areas of professional growth that i am interested in pursing
declare @ALP_21 Varchar(4000) -- rotional

declare @ALP_31 Varchar(3000) -- rotional
declare @ALP_41 Varchar(3000) -- rotional

declare @ALP_51 Varchar(2000) -- rotional
declare @ALP_52 Varchar(2000) -- rotional
declare @ALP_53 Varchar(2000) -- rotional
declare @ALP_54 Varchar(2000) -- rotional
declare @ALP_61 Varchar(2000) -- rotional
declare @ALP_62 Varchar(2000) -- rotional
   

---select * from tcdsb_TPA_Appraisal_dateo
 
--- select * from tcdsb_TPA_Appraisal_Text



 
set @ALP_11 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP11')
set @SUM_11 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM11')
if @SUM_11 ='' set @SUM_11 = @ALP_11
			 
set @ALP_21 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP21')
set @ALP_31 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP31')
set @ALP_41 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP41')

set @ALP_51 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP51')
set @ALP_52 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP52')
set @ALP_53 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP53')
set @ALP_54 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP54')
set @ALP_61 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP61')
set @ALP_62 = dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ALP62')
-- select * from tcdsb_tpa_school_staff where school_year ='20052006'


-- ****************** get Focus Topics  **********************
/*
	declare @Focus varchar(2000)
 if left(@SchoolCode,2) ='05'
	begin
		set @Focus = ''	--     + dbo.tcdsb_TPA_getFocusTopicSummary(@Schoolyear,@SchoolCode,@SessionID,@TeacherID,'Numeracy')
		--set @Focus = @Focus  + dbo.tcdsb_TPA_getFocusTopicSummary(@Schoolyear,@SchoolCode,@SessionID,@TeacherID,'Literacy')
		--set @Focus = @Focus  + dbo.tcdsb_TPA_getFocusTopicSummary(@Schoolyear,@SchoolCode,@SessionID,@TeacherID,'Pathways')
		--set @Focus = @Focus  + dbo.tcdsb_TPA_getFocusTopicSummary(@Schoolyear,@SchoolCode,@SessionID,@TeacherID,'CCCC')
		--set @Focus = @Focus  + dbo.tcdsb_TPA_getFocusTopicSummary(@Schoolyear,@SchoolCode,@SessionID,@TeacherID,'Misc')
		--set @Focus = @Focus  + dbo.tcdsb_TPA_getFocusTopicSummary(@Schoolyear,@SchoolCode,@SessionID,@TeacherID,'Preferred Modality of Learning')
		--set @Focus = @Focus  + dbo.tcdsb_TPA_getFocusTopicSummary(@Schoolyear,@SchoolCode,@SessionID,@TeacherID,'Self Directed')
		set @ALP_52 =  isnull(@ALP_52,'') +  char(13) + char(10) +  char(10) + 'Focus Topics:'+ char(13) + char(10)  + isnull(@Focus,'')
	end
 
-- ****************** get Focus Topics  **********************
 
set @ALP_17=  ( select  top 1 dbo.DateF(Appraisal_Date,'YYYYMMDD')   from [dbo].[EPA_Appr_Comments_small] 
                where ItemCode ='ALP95' and School_year =@Schoolyear and School_code =@SchoolCode 
                      and SessionID = @SessionID and   EmployeeID = @EmployeeID  )
  
*/  

select 	
  	isnull(@SUM_11,'') as SUM_11,
 	isnull(@ALP_21,'') as ALP_11,
	isnull(@ALP_31,'') as ALP_12,
	isnull(@ALP_41,'') as ALP_13,
	isnull(@ALP_41,'') as ALP_14,
	isnull(@ALP_51,'') as ALP_141,
	isnull(@ALP_52,'') as ALP_142,
	isnull(@ALP_53,'') as ALP_143,
	isnull(@ALP_54,'') as ALP_144,
	isnull(@ALP_61,'') as ALP_151,
	isnull(@ALP_62,'') as ALP_152,
	isnull(@ALP_17,'') as ALP_17 
  

 from dbo.EPA_getReportSignature(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'ALP95') 








