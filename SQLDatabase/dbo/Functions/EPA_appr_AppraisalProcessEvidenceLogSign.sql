

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: June 15, 2020 
-- Modify	  : May 22, 2020   change the image icon depend on the rate value 
-- Description:	get Appraisal progress status on domain competency
-- ================================================================================== 
 

CREATE FUNCTION [dbo].[EPA_appr_AppraisalProcessEvidenceLogSign]
(   @Type			varchar(10)= null,
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@DomainID		varchar(10) = null,
	@CompetencyID	varchar(10) = null 
)
RETURNS varchar(120)
AS 
  BEGIN
		declare @rValue varchar(120)
 
				if exists (select * from [dbo].[EPA_Appr_LookFors_EvidenceLog_chose] 
							where School_Year = @SchoolYear and School_Code= @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and DomainID = @DomainID and CompetencyID = @CompetencyID and LogCheck ='1' )
					set @rValue = '<img class="EvidenceLog" src="../images/log.jpg" title="Evidence Log exists"  height="18px" width="20px" />'
				else
					set @rValue =  ''  
	
 
	 
		RETURN(@rValue)
 END 





