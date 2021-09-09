

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 2, 2018 
-- Description:	get NTIP strategy item label
-- ==================================================================================
 
 
Create proc [dbo].[EPA_Appr_AppraisalData_StrategyLabel]  -- '0','mif','20172018','0528','00010452','Session1','NTP','STR','STR111' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null 

	 
as

set nocount on 
  
	select top 1  Title
	from  [dbo].[EPA_Appr_StrategyLabel] 
	where  appraisal_Category= @Category and Appraisal_Area = @Area  and appraisal_Code = @ItemCode
  


