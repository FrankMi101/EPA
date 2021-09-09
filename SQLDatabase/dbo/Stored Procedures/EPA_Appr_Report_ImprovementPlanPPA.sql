

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 1, 2018
-- Description:	get PPA Annual Growth Plan Working Template
-- ================================================================================== 
--dbo.EPA_Appr_Report_ImprovementPlanPPA  'Report', 'mif','20172018','0529','00010524', 'Appraisal1','PPA','5Column'
CREATE procedure [dbo].[EPA_Appr_Report_ImprovementPlanPPA] 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null,
	@Item			varchar(10)=null
as
set nocount on
-- select * from  dbo.tcdsb_TPA_Appraisal_Text
--set @Domain = dbo.tcdsb_Login(@UserID,'Domain')
 declare @Gender varchar(1)

if @EmployeeID ='0000' set @SchoolCode ='000X'
if  @Item is null
	begin
		  declare @AppraiseeName varchar(50), @AppraiseeRole varchar(20), @AppraiserRole varchar(20) 
		  declare @IMP31 varchar(2000) -- IMP31 -- Strategies and Supports to be Provided on Annual Growth Goals 
		  set @AppraiseeName  = (select top 1 rtrim(FullName)  from EPA_Org_EmployeeList where Employee_ID = @EmployeeID)
 
		  set @AppraiseeRole = (select top 1 Appraisal_Role												from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Unit_ID =@SchoolCode and Employee_ID =@EmployeeID )
		  set @AppraiserRole = (select top 1 dbo.EPA_getAppraisalRoleByYear(Appraisal_year,Appraiser)	from EPA_Appr_EmployeeList where Appraisal_year = @SchoolYear and Unit_ID =@SchoolCode and Employee_ID =@EmployeeID )
		  set @IMP31 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'IMP31')  

		  select  @SchoolYear as AppraisalYear, @IMP31 as IMP31, @AppraiseeName as AppraiseeName, @AppraiseeRole as AppraiseeRole,  @AppraiserRole as AppraiserRole, *
		  from     dbo.EPA_getReportSignatureRate(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'IMP95')    
	end
else if @Item ='5Column'
     select  Criteria,Concern,Practices, Steps,Indicators,Completed from [dbo].[EPA_Appr_Comments_AIP]
	 where School_Year = @SchoolYear and School_Code=@SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID and ItemCode ='IMP11'
	 order by SequenceNo
else if @Item ='2Column'
     select Needs, Strategies from [dbo].[EPA_Appr_Comments_AIP2]
	 where School_Year = @SchoolYear and School_Code=@SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID and ItemCode ='IMP21'
	 order by SequenceNo
  --select * from EPA_Appr_Comments where EmployeeID ='00010524'
  --select * from EPA_Appr_Rating where EmployeeID ='00012934'
  --select * from EPA_Appr_SignOff where EmployeeID ='00010524'
 -- select * from [dbo].[EPA_Appr_Comments_APMeeting]

  