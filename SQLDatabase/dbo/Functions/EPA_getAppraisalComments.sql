
 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 31, 2018
-- Description:	get Appraisal big Text Commets 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalComments]
(
	@SchoolYear		varchar(8),
	@SchoolCode		varchar(8),
	@EmployeeID		varchar(20),
	@SessionID		varchar(10),
	@ItemCode		varchar(10)
)
RETURNS varchar(4000)
AS 
  BEGIN
	  declare @rValue varchar(4000)
 
      if exists (select * from dbo.EPA_Appr_Comments  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and ItemCode = @ItemCode) 
         set @rValue = (select top 1 Appraisal_Note from dbo.EPA_Appr_Comments  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and ItemCode = @ItemCode)	
	  else
		 set @rValue =''
 
	  RETURN(@rValue)
 END

  

