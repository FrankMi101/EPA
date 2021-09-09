

       


 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 5, 2018 
-- Description:	get lookfors by Domain competency 
-- ==================================================================================
  
CREATE proc [dbo].[EPA_Appr_AppraisalData_LookForsbyCompetency] --    'ed','mif','20172018','0528','00010452','Session1','TPA','LOG','LOG52' ,'1','2'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@DomainID		varchar(10)= null,  
	@CompetencyID	varchar(10)= null 

as

set nocount on 
 
   declare @imgAction varchar(200)
     set @imgAction = '<img title="Select the Look fors to Evidence Log " src="../images/Edit2_Reposting.jpg" border="0" width="25" height="25" />'

	select 
	     @imgAction   as [Action],   
       [dbo].[DateF](getdate(),'YYYYMMDD') as ActionDate ,
	   Appraisal_LookFors  as LookForsID,
		 Appraisal_LookForsName as LookForsName,
	 	  ROW_NUMBER() OVER(ORDER BY  Appraisal_LookFors ) AS RowNo 
	from  [dbo].[EPA_sys_appraisalDomainCompetencyLookFor]
	where  Appraisal_Domain = @DomainID and Appraisal_Competency = @CompetencyID
	order by ActionDate DESC
  
    
