





 

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 15, 2017 
-- Modify date: 2020/05/09  add level 0 menu addiitonal function icon 
-- Description:	get appraisal left menu items based on the category, area and employee ID
-- ==================================================================================
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_StepMenu]    --  '0','mif','20172018','0528','00010452','Session1','TPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null,  
 	@ItemCode		varchar(10)= null,
	@AppraisalRole	varchar(20) = null  
as

set nocount on 
if @Operate = '0'
    select IDs,
	 Appraisal_Area										as AppraisalArea,  
 	Appraisal_Code										as AppraisalCode, 
	dbo.EPA_menu_additionIcon(@AppraisalRole,Appraisal_Area,Appraisal_Text) as AppraisalText,	                              
	--Appraisal_Text										as AppraisalText,
	Content_type										as ContentType,
	Content_Page										as ContentPage,
	Area_Step											as AreaStep,
     TreeLevel, 
	'' as AppraisalImage  
    from   [dbo].[EPA_sys_Appraisal_Definition]  
 	where Appraisal_Category = @Category    and MenuShow ='1'  and TreeLevel  = @Operate
	order by Area_Step

else if @Operate = '2'
	select 
	 IDs,
	 Appraisal_Area										as AppraisalArea,  
 	 Appraisal_Code										as AppraisalCode, 
	 Appraisal_Text										as AppraisalText,
	 Content_type										as ContentType,
	 Content_Page										as ContentPage,
	 Area_Step											as AreaStep ,
     TreeLevel ,
	 dbo.EPA_getAppraisalStatusImg(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,@Category,@Area,Appraisal_Code, Content_Type,StepCheck) as AppraisalImage
	from   [dbo].[EPA_sys_Appraisal_Definition]  
	where Appraisal_Category = @Category and Appraisal_Area = @Area  and MenuShow ='1'  and TreeLevel  = @Operate
	order by Appraisal_Code
else
	select 
	IDs,
	 Appraisal_Area										as AppraisalArea,  
 	 Appraisal_Code										as AppraisalCode, 
	 Replace(Appraisal_Text,'Domain:','')				as AppraisalText,
	 Content_type										as ContentType,
	 Content_Page										as ContentPage,
	 Area_Step											as AreaStep,
     TreeLevel, 
	dbo.EPA_getAppraisalStatusImg(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,@Category,@Area,Appraisal_Code, Content_Type ,StepCheck) as AppraisalImage
	from   [dbo].[EPA_sys_Appraisal_Definition]  
	where Appraisal_Category = @Category and Appraisal_Area = @Area  and MenuShow ='1'  and TreeLevel  = '3' and left(Appraisal_code , len(@Operate)) = @Operate
	order by Appraisal_Code
	 
 







