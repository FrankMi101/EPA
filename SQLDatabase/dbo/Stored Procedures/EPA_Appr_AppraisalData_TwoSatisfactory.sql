
    


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 27, 2020 
-- Description:	get and  update appraisal samll Text content and list chose content
-- ==================================================================================
--  [dbo].[EPA_Appr_AppraisalData_Notes]     'Chose','mif','20172018','0529','00010558','Appraisal1','NTP','SUM','SUM41','110' 
create proc [dbo].[EPA_Appr_AppraisalData_TwoSatisfactory]    
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
	 select  [dbo].[EPA_appr_checkCompleteTwoSatisfactory] (@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,@Category)
 
   



     


