


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 14, 2017 
-- Description:	get LTO Competency List 
-- ==================================================================================
 ---[dbo].[EPA_Appr_AppraisalData_LookForsbyCompetencyLTO] 'get','mif','LTO','SUM','SUM51','20192020'
 
CREATE procedure  [dbo].[EPA_Appr_AppraisalData_LookForsbyCompetencyLTO]
	@Operate		varchar(30) = null,
	@UserID			varchar(30) = null,
	@Category		varchar(10) = null,
	@Area			varchar(20) = null,
	@Code			varchar(10) = null, 
	@Competency 	Varchar(10) = null
as
set nocount on

if @Competency is null
   
	 select * from  [dbo].[EPA_Appr_CompetencyLookForsLTO]
	 where   DomainID  =  '1'  and CompetencyID <>0 and LookingForID ='0'
	order by CompetencyID,LookingForID
else
  
	select * from [dbo].[EPA_Appr_CompetencyLookForsLTO]
	 where   DomainID  =  '1'  and CompetencyID = @Competency and LookingForID <>'0'
	order by CompetencyID,LookingForID

	 

