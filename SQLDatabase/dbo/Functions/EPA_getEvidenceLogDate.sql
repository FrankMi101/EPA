

 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 3, 2018
-- Description:	get Appraisal Evidencelog Look Fors chose 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getEvidenceLogDate]
(	 @SchoolYear	varchar(8),
	 @SchoolCode	varchar(8),
	 @EmployeeID	varchar(20),
	 @SessionID		varchar(20),
	 @ActionRole	varchar(20),
	 @DomainID		int,
	 @CompetencyID	int,
	 @LookforID		int 
)
RETURNS varchar(10)
AS 
  BEGIN 
		declare @rValue varchar(10)
		if exists (select *  From [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
					WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID =@LookforID and WorkRole = @ActionRole )
		   select top 1 @rValue = dbo.DateF(LogDate,'YYYYMMDD') 
		   From [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
			WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID =@LookforID and WorkRole = @ActionRole 
	  else
		  set @rValue =''
 
	  RETURN(@rValue)
 END

  


