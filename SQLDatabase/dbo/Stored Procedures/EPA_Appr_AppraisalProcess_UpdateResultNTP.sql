




 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 25, 2018
-- Description:	update staff appraisal progress status
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_UpdateResultNTP]   -- 'CheckList','mif','20172018','0529','00014245', 'Appraisal1', 'TPA','SUM','SUM51'
	@Operate		varchar(30),
	@Action			varchar(20) =null,
	@UserID			varchar(30)=null,
	@SchoolYear		varchar(8) = null, -- could be user role
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@Category		varchar(10) = null,
	@Area			varchar(10) = null,
	@ItemCode		varchar(10) = null 
as

set nocount on
declare @Ratelevel int, @gCount int, @sCount int, @AppraisalX varchar(50) 
declare  @currentSchoolYear varchar(8),@PerviousSchoolYear varchar(8), @PreCategory varchar(10)
set @currentSchoolYear =[dbo].[EPA_CurrentSchoolYear](8,25)
set @PerviousSchoolYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@currentSchoolYear) 
--set @PreCategory =[dbo].[EPA_getAppraisalCategory](@PerviousSchoolYear,@SchoolCode,@EmployeeID)
--if @PreCategory != 'NTP'  set @PerviousSchoolYear  = @SchoolYear


set @gCount =(select count(*) from [dbo].[EPA_Appr_SignOff] where  School_Year between @PerviousSchoolYear and @SchoolYear  and EmployeeID = @EmployeeID  and Category = @Category and ItemCode ='STR95' and SignOff_Action = 'Sign Off'  and SignOff_Type != 'Supervisory')
set @sCount =(select count(*) from [dbo].[EPA_Appr_Rating]  where  School_Year between @PerviousSchoolYear and @SchoolYear  and EmployeeID = @EmployeeID  and Category = @Category and ItemCode ='SUM61' and Appraisal_chose = '3')
if @Action ='Undo Sign Off'
   set @AppraisalX = 'SignOff Strategy Required'
else
	begin
		if @sCount = 2
			if @gCount = 2 
				set @AppraisalX = 'Successful Completion of NTIP'
			else
				set @AppraisalX = 'SignOff Strategy Required'
		else
			set @AppraisalX = 'Two Satisfactory Appraisals Need'
	end
update [dbo].[EPA_Appr_EmployeeList] 
set Appraisal_Result = @AppraisalX
where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and Employee_ID = @EmployeeID  and Appraisal_type = @Category
 



