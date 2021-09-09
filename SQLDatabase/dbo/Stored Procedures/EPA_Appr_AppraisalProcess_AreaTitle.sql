











     

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: May 08, 2018 
-- Description:	get area title and page title 
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_AreaTitle]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null ,
	@Code			varchar(10)= null  
as

set nocount on 
 if @Code is null


	select top 1 Appraisal_Text 
    from   [dbo].[EPA_sys_Appraisal_Definition]  
 	where Appraisal_Category = @Category and Appraisal_Area =  @Area  and   Appraisal_Code  = @Area
else
	select top 1 Appraisal_Text 
    from   [dbo].[EPA_sys_Appraisal_Definition]  
 	where Appraisal_Category = @Category and Appraisal_Area =  @Area  and  Appraisal_Code = @Code
 






