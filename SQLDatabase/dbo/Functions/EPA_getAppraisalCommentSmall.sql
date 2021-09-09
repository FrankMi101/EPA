

 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 02, 2018
-- Description:	get Appraisal samll Text Commets , Date, multiple chose 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalCommentSmall]
(
	@SchoolYear		varchar(8),
	@SchoolCode		varchar(8),
	@EmployeeID		varchar(20),
	@SessionID		varchar(10),
	@ItemCode		varchar(10),
	@ItemType		varchar(10)
)
RETURNS varchar(250)
AS 
  BEGIN
	  declare @rValue varchar(250)
 
      if exists (select * from dbo.EPA_Appr_Comments_small  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and ItemCode = @ItemCode) 
         set @rValue = (select top 1 case @ItemType when 'Date' then dbo.DateF(Appraisal_Date,'YYYYMMDD')
													when 'Chose' then Appraisal_chose
													else Appraisal_Note end 
						from dbo.EPA_Appr_Comments_small  
						where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and ItemCode = @ItemCode)	
	  else
		 set @rValue =''
 
	  RETURN(@rValue)
 END

  


