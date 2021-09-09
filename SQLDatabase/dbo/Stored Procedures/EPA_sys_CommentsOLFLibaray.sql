﻿





 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 1, 2017 
-- Description:	get appraisal strategies 
-- ==================================================================================
  
  
CREATE proc [dbo].[EPA_sys_CommentsOLFLibaray]  --   'get','mif','1'
	@Operate	varchar(30)= null,
	@UserID		varchar(30) = null,  
    @Panel		Varchar(10) = null, -- 'Root', 'Node','Comments' 
	@Level2		varchar(10) = null,  -- Type
	@Level3		varchar(10) = null, -- Shared
    @Level4		varchar(10) = null, 
	@Notes		varchar(500) = null 
as
set nocount on
if @Operate ='OLFCategory'
	select Level1, Notes  from [dbo].[EPA_sys_OLF_Library] where Level2 is null
else if  @Notes is null
    select TreeLevel, isnull(Level2,0) as Level2, isnull(Level3,0) as Level3, isnull(Level4,0) as Level4 , ltrim(Notes) as Notes, 
		right('0000' + cast( ROW_NUMBER() OVER(ORDER BY  Level2, Level3, Level4, Notes ) as varchar(3)),4) AS RowNo 
	 from [dbo].[EPA_sys_OLF_Library]
		where  Level1 =  @Panel
		order by RowNo
  
   /*
   begin
		if @Panel ='A'
		   select '9' as myValue, 'Please Click on Plus' as myText  
		else if @Panel is null
		   select Panel as myValue, ltrim(Notes )  as myText -- ,'P-'+ Panel as myKey
		   from dbo.EPA_sys_AppraisalDomainTipsLib
		   where DomainID is null
		   order by Panel
		else if @DomainID is null
		   --select Appraisal_Domain as myValue, Appraisal_DomainName as myText
		   --from    [dbo].[EPA_sys_appraisalDomain]   where Appraisal_Code ='EPA'
		   --order by myValue
		   select DomainID as myValue, ltrim(Notes )  as myText --, 'D-' + panel +'-'+ DomainID as myKey
		   from dbo.EPA_sys_AppraisalDomainTipsLib
		   where  Competency is null  and DomainID is not null and Panel =   @Panel
		   order by DomainID
		else if @Competency is null
		   --select   Appraisal_competency as  myValue, Appraisal_CompetencyName as myText
		   
		   --from    [dbo].[EPA_sys_appraisalDomainCompetency] 
		   --where    Appraisal_Code ='UPA'  and Appraisal_Domain = @DomainID

		   select Competency as myValue, ltrim(Notes )  as myText --, 'C-'+  panel +'-'+ DomainID + '-' + Competency as myKey
		   from dbo.EPA_sys_AppraisalDomainTipsLib
		   where  Look_Fors is null  and Competency is not null and Panel =  @Panel and DomainID = @DomainID
		   order by Competency
		else if @LookFors is null
		   select Look_Fors as myValue, ltrim(Notes )  as myText --, 'L-'+  panel +'-'+ DomainID + '-' + Competency  +'-' + Look_Fors as myKey
		   from dbo.EPA_sys_AppraisalDomainTipsLib
		   where  TipsID is null  and Look_Fors is not null and Panel =  @Panel and DomainID = @DomainID and Competency = @Competency
		   order by Look_Fors
		else
		   select TipsID as myValue,   ltrim(Notes ) as myText  --- char(149)+ '     ' + ltrim(Notes ) as myText
		  -- 'T-'+  panel +'-'+ DomainID + '-' + Competency  +'-' + Look_Fors + '-' + TipsID as myKey
		   from dbo.EPA_sys_AppraisalDomainTipsLib
		   where  TipsID is not null and Panel =  @Panel and DomainID = @DomainID and Competency = @Competency and Look_Fors =@LookFors
		   order by TipsID
	end
 */
else
    update [dbo].[EPA_sys_OLF_Library]
	set Notes = @Notes
	where Level1 =@Panel and Level2 =@Level2 and Level3 = @Level3 and Level4 =@Level4
	  


