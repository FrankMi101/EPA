






 
 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 18, 2017 
-- Description:	get appraisal left menu items based on the category, area and employee ID
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_CompetencyList] --   'ListCount44' , 'mif','20192020','0529','00003862','Appraisal1','TPA' ,'6'
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
if @Operate = 'ListCount'
	begin	
		if exists(select * from [dbo].[EPA_sys_appraisalDomainCompetency] where Appraisal_Code = 'EPA' and Appraisal_Domain =   @DomainID )
			begin
				if @Category ='NTP'
     					 select   sum( [dbo].[EPA_getSetenceShowCount](Appraisal_CompetencyName, 120)  )    --  cast( count(*) as varchar(10)) as rValue
						 from  [dbo].[EPA_sys_appraisalDomainCompetency]
						 where Appraisal_Code = 'EPA' and Appraisal_Domain =   @DomainID and Evidence_Level =   '8'  
				else
    					 select    sum( [dbo].[EPA_getSetenceShowCount](Appraisal_CompetencyName, 120)  )   --   cast( count(*) as varchar(10)) as rValue
						 from  [dbo].[EPA_sys_appraisalDomainCompetency]
						 where Appraisal_Code = 'EPA' and Appraisal_Domain =   @DomainID  
			end
		else
				select 0 as rvalue
	end
else
	begin
		 if  @Category ='TPA'
			 select  
			 [dbo].[EPA_appr_AppraisalProcessCompetencySign]('SUM',@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID,Appraisal_Competency) as ContentSign,
			 Appraisal_Competency  as Competency, 
			 Appraisal_CompetencyName  + ' ' +  dbo.EPA_appr_AppraisalProcessEvidenceLogSign('LOG',@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID,Appraisal_Competency)   as CompetencyName
			 from  [dbo].[EPA_sys_appraisalDomainCompetency]
			 where Appraisal_Code = 'EPA' and Appraisal_Domain = @DomainID
			 order by Appraisal_Competency
		else
			 select  
			 [dbo].[EPA_appr_AppraisalProcessCompetencySign]('SUM',@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID, Appraisal_Competency) as ContentSign,
			 Appraisal_Competency   as Competency, 
			 Appraisal_CompetencyName   + ' ' +  dbo.EPA_appr_AppraisalProcessEvidenceLogSign('LOG',@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID,Appraisal_Competency)  as CompetencyName
			 from  [dbo].[EPA_sys_appraisalDomainCompetency]
			 where Appraisal_Code = 'EPA' and Appraisal_Domain = @DomainID and Evidence_Level ='8'
			 order by Appraisal_Competency
	 end  

 
-- select * from [EPA_sys_appraisalDomainCompetency]


 

