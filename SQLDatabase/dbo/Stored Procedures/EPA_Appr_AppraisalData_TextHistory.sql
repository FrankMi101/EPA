







 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 29, 2017 
-- Description:	get appraisal Text content update history
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextHistory]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
 	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
 	@ItemCode		varchar(10)= null 
as

set nocount on 
     declare @imgAction varchar(200)
     set @imgAction = '<img title="recovery selected comments to working content" src="../images/Recover2.bmp" border="0" width="25" height="25" />'

	select 
	     @imgAction										as [Action],   
		 [dbo].[DateF](action_date,'YYYYMMDD')			as ActionDate,
		 Appraisal_Note									as Notes,
	 	  ROW_NUMBER() OVER(ORDER BY  action_date DESC ) as RowNo 
	from  [dbo].[EPA_Appr_Comments_Bak]
	where School_Year = @SchoolYear and EmployeeID =@EmployeeID and ItemCode = @ItemCode
	order by action_date DESC
  
  

