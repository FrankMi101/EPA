
 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 2, 2018
-- Description:	get Appraisal Evidence Log look fors commens 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getCompetencyLookForsNote]
(	@DomainID		int,
	@CompetencyID	int,
	@SchoolYear		varchar(8),
	@SchoolCode		varchar(8),
	@EmployeeID		varchar(20),
	@SessionID		varchar(10),
	@ActionRole		varchar(10)
)
RETURNS varchar(1000)
AS 
  BEGIN
	  declare @rValue varchar(1000)

      if exists (select * from dbo.EPA_Appr_EvidenceLog_DomainCompetency  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and DomainID =@DomainID and CompetencyID =@CompetencyID and ActionRole = @ActionRole) 
         set @rValue = (select top 1 Appraisal_Note from dbo.EPA_Appr_EvidenceLog_DomainCompetency  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and DomainID =@DomainID and CompetencyID =@CompetencyID and ActionRole = @ActionRole)	
	  else
		 set @rValue =''
 
	  RETURN(@rValue)
 END

  

