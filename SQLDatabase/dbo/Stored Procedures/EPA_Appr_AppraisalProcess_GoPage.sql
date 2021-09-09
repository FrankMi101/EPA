











     

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 21, 2017 
-- Description:	get appraisal item page by code
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_GoPage]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null ,
	@Code			varchar(10)= null  
as

set nocount on 
begin
	 if @Operate ='DOCFile'
		select top 1     '../Documents/' + ReportName  
		from   [dbo].[EPA_sys_Appraisal_Definition]  
 		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3) and Appraisal_Code = @Code  and MenuShow ='1'

	 else if @Operate ='PageItem'
		select top 1 Content_Page +'.aspx' -- case Content_Page when 'DOCPage' then  '../Documents/' + ReportName  else  Content_Page +'.aspx' end
		from   [dbo].[EPA_sys_Appraisal_Definition]  
 		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3) and Appraisal_Code = @Code  and MenuShow ='1'

	 else if @Operate ='Next'

		select  top  1 case Appraisal_Code when 'SUM5' then 'SUM51' else Appraisal_Code end
		from   [dbo].[EPA_sys_Appraisal_Definition]  
  		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3)   and Appraisal_Code >  @Code  and MenuShow ='1'
		order by  Appraisal_Code  

	 else if @Operate ='Previous'
 
		select   top  1 case Appraisal_Code when 'SUM5' then 'SUM42' else Appraisal_Code end
		from   [dbo].[EPA_sys_Appraisal_Definition]  
 		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3)   and Appraisal_Code <  @Code  and MenuShow ='1'
 		order by  Appraisal_Code  DESC	 

	else if @Operate ='PageActiveFor'
		select top 1  isnull(Content_For,'Both') as Content_For
		from   [dbo].[EPA_sys_Appraisal_Definition]  
 		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3) and Appraisal_Code = @Code
	else if @Operate ='PageRecover'
		select top 1   rtrim(isnull(Recover,'')) 
		from   [dbo].[EPA_sys_Appraisal_Definition]  
 		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3) and Appraisal_Code = @Code
	else if @Operate ='PageHelp'
		select top 1   rtrim(isnull(Help,'')) 
		from   [dbo].[EPA_sys_Appraisal_Definition]  
 		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3) and Appraisal_Code = @Code

	else if @Operate ='PageEP'
		select top 1  rtrim(isnull(Effective_Practice,''))
		from   [dbo].[EPA_sys_Appraisal_Definition]  
 		where Appraisal_Category = @Category and Appraisal_Area = left(@Area,3) and Appraisal_Code = @Code


	 else if @Operate ='PDFReportName'
		select top 1 rtrim(ltrim(ReportName)) from    [dbo].[EPA_sys_Appraisal_Definition]  
		where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code

	else if @Operate ='ReportName'
		select top 1 rtrim(ltrim(replace(Appraisal_Text,'View ',''))) 
		from    [dbo].[EPA_sys_Appraisal_Definition]  
		where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code
 
 end


