
     

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 15, 2017 
-- Description:	get appraisal left menu items based on the category, area and employee ID
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcessLeftMenu]  --  'admin','mif','20172018','0528','00010452','Session1','TPA','ALP','NE2'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null ,
	@Phase			varchar(20)= null  
as

set nocount on
 set @Category ='TPA'

if @Operate = '2'
	select 
	IDs, Appraisal_Code, Appraisal_Text, TreeLevel, Content_Page,
	dbo.EPA_getAppraisalStatusImg(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,@Category,@Area,@Phase,Appraisal_Code, Content_Type) as Appraisal_img
	from   [dbo].[EPA_sys_Appraisal_Definition]  
	where Appraisal_Category = @Category and Appraisal_Area = @Area  and MenuShow ='1'  and TreeLevel  = @Operate
	order by Appraisal_Code
else
	select 
	IDs, Appraisal_Code, Appraisal_Text, TreeLevel, Content_Page,
	dbo.EPA_getAppraisalStatusImg(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,@Category,@Area,@Phase,Appraisal_Code, Content_Type) as Appraisal_img
	from   [dbo].[EPA_sys_Appraisal_Definition]  
	where Appraisal_Category = @Category and Appraisal_Area = @Area  and MenuShow ='1'  and TreeLevel  = '3' and left(Appraisal_code , len(@Operate)) = @Operate
	order by Appraisal_Code

 

 

