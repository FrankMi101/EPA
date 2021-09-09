 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 31, 2018
-- Description:	get Appraisal competency Commets 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getCompetencyComments]
(	@DomainID		int,
	@CompetencyID	int,
	@SchoolYear		varchar(8),
	@SchoolCode		varchar(8),
	@EmployeeID		varchar(20),
	@SessionID		varchar(10)
)
RETURNS varchar(2000)
AS 
  BEGIN
	  declare @rValue varchar(2000)

      if exists (select * from dbo.EPA_Appr_Comments_DomainCompetency  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and DomainID =@DomainID and CompetencyID =@CompetencyID) 
         set @rValue = (select top 1 Appraisal_Note from dbo.EPA_Appr_Comments_DomainCompetency  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and DomainID =@DomainID and CompetencyID =@CompetencyID)	
	  else
		 set @rValue =''
 
	  RETURN(@rValue)
 END

  
