
       


 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 19, 2017 
-- Description:	get Domain Content appraisal Text history
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextDomainHistory]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
 	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@ItemCode		varchar(10)= null,  
	@DomainID		varchar(10)= null,  
	@CompetencyID	varchar(10)= null 

as

set nocount on 
 
   declare @imgAction varchar(200)
     set @imgAction = '<img title="Recovery selected comments to working content" src="../images/Recover2.bmp" border="0" width="25" height="25" />'

	select 
	     @imgAction							as [Action],   
       [dbo].[DateF](action_date,'YYYYMMDD') as action_date,
		 Appraisal_Note,
	 	  ROW_NUMBER() OVER(ORDER BY  action_date DESC ) AS RowNo 
	from  [dbo].[EPA_Appr_Comments_DomainCompetency_Bak]
	where School_Year = @SchoolYear and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID
	order by action_date DESC
  
   

   -- dbo.EPA_Appr_AppraisalData_TextDomainHistory @SchoolYear,@EmployeeID,@ItemCode,@DomainID,@CompetencyID
