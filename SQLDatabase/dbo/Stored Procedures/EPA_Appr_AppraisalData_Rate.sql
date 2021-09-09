





        


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 20, 2017 
-- Description:	get and  update appraisal samll Text content and list chose content
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_Rate]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
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
  if exists (select * from  [dbo].[EPA_Appr_Rating]  where  School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category )
	select top 1 Appraisal_Rate
	from  [dbo].[EPA_Appr_Rating]  as A
	inner join [dbo].[EPA_sys_appraisalRating] as R on A.Appraisal_Chose = R.IDs  
	where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category = @Category
 else 
   select '' as Appraisal_Rate
   
  




