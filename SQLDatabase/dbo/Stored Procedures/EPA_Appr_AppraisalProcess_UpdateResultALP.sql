


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 24, 2018
-- Description:	update staff appraisal progress ALP status
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_UpdateResultALP]   -- 'CheckList','mif','20172018','0529','00014245', 'Appraisal1', 'TPA','SUM','SUM51'
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
declare @Ratelevel int, @sCount int, @AppraisalX varchar(50)
set @sCount =(select count(*) from [dbo].[EPA_Appr_SignOff] where  School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and  Category = @Category and ItemCode in ('ALP95','AGP95') and SignOff_Action = 'Sign Off')

if @sCount ='2'
	set @AppraisalX = 'Completed'
else if @sCount ='1'  
 		set @AppraisalX = case  @Action when 'Undo Sign Off' then  'Need ' + @Operate + ' Sign Off' 
								 		else case @Operate  when 'Appraiser' then  'Need Appraisee Sign Off' 
															when 'Appraisee' then  'Need Appraiser Sign Off' 
															else '' end
										end
	 
else
   set @AppraisalX = 'Incompleted'

update [dbo].[EPA_Appr_EmployeeList] 
	set ALP_Result = @AppraisalX
where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and Employee_ID = @EmployeeID and Appraisal_type = @Category
 


