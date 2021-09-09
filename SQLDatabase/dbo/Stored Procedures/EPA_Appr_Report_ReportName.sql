
 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 31, 2017 
-- Description:	get and update observation date and comments
-- ==================================================================================
 
CREATE proc [dbo].[EPA_Appr_Report_ReportName]   --    'Date','mif','20172018','0529','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,  
	@Area			varchar(10)= null,  
	@Code		varchar(10)= null 

as

set nocount on 
 begin 
 if @Operate ='PDFName'
	select top 1 rtrim(ltrim(ReportName)) from    [dbo].[EPA_sys_Appraisal_Definition]  
	where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code

if @Operate ='Name'
	select top 1 rtrim(ltrim(replace(Appraisal_Text,'View ',''))) from    [dbo].[EPA_sys_Appraisal_Definition]  
	where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code
 
 end

-- select * from  [dbo].[EPA_sys_Appraisal_Definition]
