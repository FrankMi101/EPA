

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 14, 2018
-- Description:	get and update Appraisal Domain LookFors
-- ==================================================================================


 -- Drop proc dbo.EPA_sys_ProcessAppraisalDomainCompetencyLookingFors  'Retrieve','','UPA','2'
CREATE Procedure [dbo].[EPA_sys_ProcessAppraisalDomainCompetencyLookingFors]
 	(	@Oprate		varchar(30) = 'List',
		@UserID		varchar(30) ='upaUser',
		@Type		varchar(30) ='UPA',
		@DomainID	varchar(10) = null,
		@CompetencyID	varchar(10) = null,
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
	'<a title="Edit ' + [Appraisal_LookForsName] + ' Process" href="javascript:OpenDetail(''' + cast(IDs as  varchar(5)) +  ''')" >'
	+  dbo.EPA_getImageIcon('Edit') + '</a>' as iEdit   
   ,[Appraisal_LookFors] as Step, [Appraisal_LookForsName] as [Name], [Comments], [LookFors_Sign],isnull([Active],0) as [Active]  
   from dbo.EPA_sys_appraisalDomainCompetencyLookFors 
	where Appraisal_Code = @Type  and Appraisal_Domain =  @DomainID and Appraisal_Competency = @CompetencyID
    order by  IDs

if @Oprate ='Retrieve' 
	select IDs, [Appraisal_LookFors] as Step, [Appraisal_LookForsName] as [Name], [Comments], [LookFors_Sign],isnull([Active],0) as [Active] 
    from dbo.EPA_sys_appraisalDomainCompetencyLookFors 
	where IDs = @IDs
if @Oprate ='Update' 
    begin
		if exists (select * from  dbo.EPA_sys_appraisalDomainCompetencyLookFors  where IDs = @IDs)
			UPDATE dbo.EPA_sys_appraisalDomainCompetencyLookFors
			set [Appraisal_LookFors] = @Step, [Appraisal_LookForsName] = @Name,  [Comments] =@Comment, [LookFors_Sign]= @Sign,[Active] = @Active
			  ,lu_Date =getdate(), lu_User =  @UserID
			where IDs = @IDs
	end
if @Oprate ='Insert' 
		insert into dbo.EPA_sys_appraisalDomainCompetencyLookFors
			( [Appraisal_Code], [Appraisal_Domain], [Appraisal_Competency], [Appraisal_LookFors],[Appraisal_LookForsName], [Comments], [LookFors_Sign] ,[Active],lu_function,lu_date, lu_user)
		values(	@Type, @DomainID,@CompetencyID, @Step, @Name,  @Comment, @Sign,@Active, app_name(),getdate(),@UserID)
 
if @Oprate ='Delete'
    delete  dbo.EPA_sys_appraisalDomainCompetencyLookFors  
	where IDs = @IDs
 
 END
 

