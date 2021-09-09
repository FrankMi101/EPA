






-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 8, 2018
-- Description:	check the select appraisee appraisal progress steps
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_CheckSteps]   -- 'CheckList','mif','20172018','0529','00014245', 'Appraisal1', 'TPA','SUM','SUM51'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null, -- could be user role
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@Category		varchar(10) = null,
	@Area			varchar(10) = null,
	@ItemCode		varchar(10) = null 
as

set nocount on

if @ItemCode ='Summary'
	select   Appraisal_Area								as AppraisalArea,  
	[dbo].[EPA_getAppraisalAreaOrder](Appraisal_Area)	as OrderBy,
	Appraisal_Code										as AppraisalCode, 
	Appraisal_Text										as AppraisalText,
	case TreeLevel when '0' then '1' else TreeLevel end  as TreeLevel,
	 dbo.EPA_appr_AppraisalProcessCompleteStatus(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area, Appraisal_Code, Content_Type,Stepcheck) as AppraisalStatus
	-- cast( as bit)  as AppraisalStatus
	from [dbo].[EPA_sys_Appraisal_Definition]
	where Appraisal_Category =  @Category  and TreeLevel !='9'  and checkShow ='1'
	order by OrderBy,Appraisal_Code
else
	select   Appraisal_Area								as AppraisalArea,  
	[dbo].[EPA_getAppraisalAreaOrder](Appraisal_Area)	as OrderBy,
	Appraisal_Code										as AppraisalCode, 
	Appraisal_Text										as AppraisalText,
	Content_type										as ContentType,
	Stepcheck,
	case TreeLevel when '0' then '1' else TreeLevel end  as TreeLevel,
	 dbo.EPA_appr_AppraisalProcessCompleteStatus(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area, Appraisal_Code, Content_type,Stepcheck) as AppraisalStatus 
 		-- cast( as bit)  as AppraisalStatus
		from [dbo].[EPA_sys_Appraisal_Definition]
		where Appraisal_Category =  @Category  and TreeLevel !='9'  and checkShow ='1' and Appraisal_Area = @Area
	   order by OrderBy,Appraisal_Code	
 

