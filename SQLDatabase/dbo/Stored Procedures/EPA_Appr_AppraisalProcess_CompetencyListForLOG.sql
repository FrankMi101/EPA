



 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 4, 2018 
-- Description:	get appraisal compegtency list for Evidence log 
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_CompetencyListForLOG] --   'admin','mif','20172018','0528','00010452','Session1','NIP' ,'3'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@DomainID		varchar(10)= null  
as

set nocount on

 if  @Category ='TPA'
     select  
	  [dbo].[EPA_appr_AppraisalProcessCompetencySign]('LOG',@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID,Appraisal_Competency) as ContentSign,
	 
	 Appraisal_Competency  as Competency, Appraisal_CompetencyName as CompetencyName
	 from  [dbo].[EPA_sys_appraisalDomainCompetency]
	 where Appraisal_Code = 'EPA' and Appraisal_Domain = @DomainID
	 order by Appraisal_Competency
else
	 select  
 	 [dbo].[EPA_appr_AppraisalProcessCompetencySign]('LOG',@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID, Appraisal_Competency) as ContentSign,
	 
	  Appraisal_Competency  as Competency, Appraisal_CompetencyName as CompetencyName
	 from  [dbo].[EPA_sys_appraisalDomainCompetency]
	 where Appraisal_Code = 'EPA' and Appraisal_Domain = @DomainID and Evidence_Level ='8'
	 order by Appraisal_Competency
	   

 
-- select * from [EPA_sys_appraisalDomainCompetency]




