










-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 18, 2017 
-- Modify	  : May 22, 2020   change the image icon depend on the rate value 
-- Description:	get Appraisal progress status on domain competency
-- ================================================================================== 
 

CREATE FUNCTION [dbo].[EPA_appr_AppraisalProcessCompetencySign]
(   @Type			varchar(10)= null,
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@DomainID		varchar(10) = null,
	@CompetencyID	varchar(10) = null 
)
RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50)
		if @Type ='LOG'
		   begin
				if exists (select * from [dbo].[EPA_Appr_EvidenceLog_DomainCompetency]
							where School_Year = @SchoolYear and School_Code= @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and DomainID = @DomainID and CompetencyID = @CompetencyID and len(appraisal_Note) > 1 )
					set @rValue = '../images/Edit2_Hired.jpg' 
				else
					set @rValue =  '../images/Edit2_Reposting.jpg'  
	
		   end
		else
			begin
				if exists (select * from [dbo].[EPA_Appr_Comments_DomainCompetency] 
							where School_Year = @SchoolYear and School_Code= @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and DomainID = @DomainID and CompetencyID = @CompetencyID and len(appraisal_Note) > 1 )
				
					select top 1 @rValue =  case Rate when '3' then  '../images/Edit2_Hired.jpg'
													  when '4' then  '../images/Edit2_confirm.jpg'
													  when '5' then '../images/Edit2_New.jpg'
													  else '../images/Edit2_Reposting.jpg' end
					from  [dbo].[EPA_Appr_Comments_DomainCompetency] 
							where School_Year = @SchoolYear and School_Code= @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and DomainID = @DomainID and CompetencyID = @CompetencyID and len(appraisal_Note) > 1
				else
					set @rValue =  '../images/Edit2_Reposting.jpg'  
			end
	 
		RETURN(@rValue)
 END

  






