
 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 31, 2018
-- Description:	get Appraisal domain Commets 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getDomainComments]
(	@DomainID		int,
	@CompetencyID	int,
	@SchoolYear		varchar(8),
	@SchoolCode		varchar(8),
	@EmployeeID		varchar(20),
	@SessionID		varchar(10),
	@Name			varchar(30)
)
RETURNS varchar(5000)
AS 
  BEGIN
	  declare @rValue varchar(5000), @Notes varchar(2000)
	    
      if exists (select * from dbo.EPA_Appr_Comments_DomainCompetency  where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and DomainID = @DomainID ) 
			begin
				declare LookFors CURSOR 
				For select DomainID,CompetencyID, rtrim(isnull(Appraisal_Note,'')) from dbo.EPA_Appr_Comments_DomainCompetency
				    where  School_year = @SchoolYear  and School_code  =  @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID and DomainID = @DomainID 
					order by CompetencyID
				Open LookFors
				FETCH NEXT FROM LookFors INTO @DomainID, @CompetencyID, @Notes
				While @@FETCH_STATUS = 0
					begin
					    if @CompetencyID not in ('1','5','9','14','16')
						  begin
								set @Notes = replace(@Notes, @Name,'')
								set @Notes = replace(@Notes, 'Look Fors:','')
						  end							
  						set @rValue = isnull(@rValue,'')  + @Notes + '; ' +  CHAR(13) + CHAR(10)  
 			 
						FETCH NEXT FROM LookFors INTO  @DomainID, @CompetencyID, @Notes 
					end
				CLOSE 	LookFors
				DEALLOCATE LookFors
 
			end
	  else
		 set @rValue =''
 
	  RETURN(@rValue)
 END

  

