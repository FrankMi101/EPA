



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	tracking Login User activities and get user last action information
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_CheckAppraisalProcess] --   'CheckList','mif','20172018','0528','00000', '', 'TPA'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null, -- could be user role
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@Category		varchar(10) = null 
as

set nocount on


select   Appraisal_Area,  
[dbo].[EPA_getAppraisalAreaOrder](Appraisal_Area) as OrderBy,
Appraisal_Code, Appraisal_Text, case TreeLevel when '0' then '1' else TreeLevel end  as TreeLevel,
 dbo.EPA_appr_AppraisalProcessCompleteStatus(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID, Appraisal_Category,Appraisal_Area, Appraisal_Code,Content_Type,StepCheck) as AppraisalStatus
-- cast( as bit)  as AppraisalStatus


from [dbo].[EPA_sys_Appraisal_Definition]
where Appraisal_Category =  @Category  and TreeLevel !='9'  and checkShow ='1'
order by OrderBy,Appraisal_Code

