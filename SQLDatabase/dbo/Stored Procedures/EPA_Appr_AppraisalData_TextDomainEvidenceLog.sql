
       
	    
 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 5, 2018 
-- Description:	get Evidence Log by Domain competency
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextDomainEvidenceLog] --   -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@DomainID		varchar(10)= null,  
	@CompetencyID	varchar(10)= null,  
	@ActionRole		varchar(20) = null   

	 
as

set nocount on 
    set @ItemCode = replace(@ItemCode,'SUM','LOG')
	select   top 1  Appraisal_Note  
	from  [dbo].[EPA_Appr_LookFors_DomainCompetency] 
	where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID and ActionRole = @ActionRole




