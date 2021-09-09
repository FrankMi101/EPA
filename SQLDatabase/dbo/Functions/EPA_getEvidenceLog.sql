


 
 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 30, 2018 
-- Description:	 get Evidence Log Date
-- ==================================================================================
CREATE FUNCTION [dbo].[EPA_getEvidenceLog]
	( 
	 @SchoolYear	varchar(8),
	 @SchoolCode	varchar(8),
	 @EmployeeID	varchar(20),
	 @SessionID		varchar(20),
	 @DomainID		varchar(10),
	 @CompetencyID	varchar(10),
	 @LookforID		varchar(10),
	 @ActionRole	varchar(20)
	 )

RETURNS   table   
 
AS 
  return
        select top 1 School_Year, School_Code,EmployeeID,DomainID,CompetencyID,LookForsID, LogDate,LogCheck 	 
			From [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
			WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID =@LookforID and WorkRole = @ActionRole 
  
 
  


