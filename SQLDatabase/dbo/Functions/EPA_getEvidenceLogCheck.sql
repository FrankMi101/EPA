


 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 3, 2018
-- Description:	get Appraisal Evidencelog Look Fors chose 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getEvidenceLogCheck]
(	 @SchoolYear	varchar(8),
	 @SchoolCode	varchar(8),
	 @EmployeeID	varchar(20),
	 @SessionID		varchar(20),
	 @ActionRole	varchar(20),
	 @DomainID		int,
	 @CompetencyID	int,
	 @LookforID		int 
)
RETURNS bit
AS 
  BEGIN 
		declare @rValue bit
		if exists (select *  From [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
					WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID =@LookforID and WorkRole = @ActionRole )
		   select top 1 @rValue =  Logcheck
		   From [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
			WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID =@LookforID and WorkRole = @ActionRole 
	  else
		  set @rValue =0
 
	  RETURN(@rValue)
 END

  



