








-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 28, 2017 
-- Description:	get observation selected 
-- ================================================================================== 
 

CREATE FUNCTION [dbo].[EPA_appr_AppraisalObservationSelected]
(	
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@ItemCode		varchar(10) = null,
	@DomainID		varchar(10) = null,
	@CompetencyID	varchar(10) = null 
)
RETURNS varchar(1)
AS 
  BEGIN
		declare @rValue varchar(1)
		set @ItemCode ='OBS21'
		if exists ( select * from [dbo].[EPA_Appr_Comments_ObservationOnCompetency]
					where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and  ItemCode  =  @ItemCode  and DomainID = @DomainID and CompetencyID = @CompetencyID )
 		   set @rValue =(select top 1 Observation_check from [dbo].[EPA_Appr_Comments_ObservationOnCompetency]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and  ItemCode = @ItemCode  and DomainID = @DomainID and CompetencyID = @CompetencyID )
 		else
		   set   @rValue='0'
		 
		RETURN(@rValue)
 END

  






