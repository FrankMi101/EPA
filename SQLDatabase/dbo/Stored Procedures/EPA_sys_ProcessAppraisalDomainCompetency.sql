

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 14, 2018
-- Description:	get and update Appraisal Domain competnecy
-- ==================================================================================


 -- Drop proc dbo.EPA_sys_ProcessAppraisalDomainCompetency  'Retrieve','','UPA','2'
CREATE Procedure [dbo].[EPA_sys_ProcessAppraisalDomainCompetency]
 	(	@Oprate		varchar(30) = 'List',
		@UserID		varchar(30) ='upaUser',
		@Type		varchar(30) ='UPA',
		@DomainID	varchar(10) = null,
		@IDs		varchar(10) =null,
		@Step		varchar(20) = null, -- Appraisal_Competency  
		@Name		varchar(500) = null,  -- Appraisal_CompetencyName  
		@Comment	varchar(100) = null ,
		@Sign		varchar(20) = null,  -- Competency_Sign
		@Active	   bit  = null 
	)
AS
BEGIN   

	set nocount on
if @Oprate ='List'
   select IDs, 
	'<a title="Edit ' + [Appraisal_CompetencyName] + ' Process" href="javascript:OpenDetail(''' + cast(IDs as  varchar(5)) +  ''')" >'
	+  dbo.EPA_getImageIcon('Edit') + '</a>' as iEdit   
   ,[Appraisal_Competency] as Step, [Appraisal_CompetencyName] as [Name], [Comments], [Competency_Sign],isnull([Active],0) as [Active]  
   from dbo.EPA_sys_appraisalDomainCompetency  as A 
	where Appraisal_Code = @Type  and Appraisal_Domain =  @DomainID
    order by A.IDs

if @Oprate ='Retrieve' 
	select IDs, [Appraisal_Competency] as Step, [Appraisal_CompetencyName] as [Name], [Comments], [Competency_Sign],isnull([Active],0) as [Active] 
    from dbo.EPA_sys_appraisalDomainCompetency 
	where IDs = @IDs
if @Oprate ='Update' 
    begin
		if exists (select * from  dbo.EPA_sys_appraisalDomainCompetency     where IDs = @IDs)
			update dbo.EPA_sys_appraisalDomainCompetency
			set [Appraisal_Competency] = @Step, [Appraisal_CompetencyName] = @Name,  [Comments] =@Comment, [Competency_Sign]= @Sign,[Active] = @Active
			  ,lu_Date =getdate(), lu_User =  @UserID
			where IDs = @IDs
	end
if @Oprate ='Insert' 
		insert into dbo.EPA_sys_appraisalDomainCompetency
			( [Appraisal_Code], [Appraisal_Domain], [Appraisal_Competency], [Appraisal_CompetencyName], [Comments], [Competency_Sign] ,[Active],lu_function,lu_date, lu_user)
		values(	@Type, @DomainID, @Step, @Name,  @Comment, @Sign,@Active, app_name(),getdate(),@UserID)
 
if @Oprate ='Delete'
    delete  dbo.EPA_sys_appraisalDomainCompetency  
	where IDs = @IDs
 
 END
  

