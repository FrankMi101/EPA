






 
	    

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: May 23, 2020
-- Description:	get lookfors by Domain competency for Summative report
-- ==================================================================================
--  [dbo].[EPA_Appr_AppraisalData_LookForsList]    'Get','mif','20172018','0529','00010558','Appraisal1','TPA','SUM','SUM51','1','2', '0','Appraiser' ,'Appraiser' ,'0','2018/4/3','1','0'
CREATE proc [dbo].[EPA_Appr_AppraisalData_LookForsListForSUM]    
	@Operate		varchar(30),  -- GetForSUM
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@DomainID		varchar(10)= null,  
	@CompetencyID	varchar(10)= null,
	@ObjRole		varchar(10) =null 

  
as

set nocount on 
  
	begin
			    declare @imgAction varchar(200)
				set @imgAction = '<img title="click to add this Log comments to working content" src="../images/Recover2.bmp" border="0" width="25" height="25" />'
				select   @imgAction   as [Action], 
						dbo.DateF(LogDate,'YYYYMMDD') as LogDate , 
						case   when LookForsID > 200 then  isnull(Comments,'') 
							 else   dbo.EPA_getLookFors(DomainID,CompetencyID,LookForsID)  end as LookFors,
						 ROW_NUMBER() OVER(ORDER BY  LookForsID ) AS RowNo 
				from  [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]  
				where  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID  and DomainID =@DomainID and CompetencyID = @CompetencyID  and WorkRole = @ObjRole  and LogCheck= 1 and AllowView  = 1
				order by RowNo

 	end
 


