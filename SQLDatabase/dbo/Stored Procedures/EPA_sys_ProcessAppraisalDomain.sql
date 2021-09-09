
 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 14, 2018
-- Description:	get and update Appraisal Domain
-- ==================================================================================


 -- Drop proc dbo.EPA_sys_ProcessAppraisalDomain 'Retrieve','','UPA','2'
CREATE Procedure [dbo].[EPA_sys_ProcessAppraisalDomain]
 	(	@Oprate		varchar(30) = 'List',
		@UserID		varchar(30) ='upaUser',
		@Type		varchar(30) ='UPA',
		@IDs		varchar(10) =null,
		@Step		varchar(20) = null, 
		@Name		varchar(50) = null, 
		@Code		varchar(10) = null,
		@Comment	varchar(100) = null ,
		@Sign		varchar(20) = null, 
		@Active	   bit  = null 
	)
AS
BEGIN   

	set nocount on
if @Oprate ='List'
   select IDs, 
	'<a title="Edit ' + [Appraisal_DomainName] + ' Process" href="javascript:OpenDetail(''' + cast(IDs as  varchar(5)) +  ''')" > 
	+  <img src="../images/edit.png" border="0" width="24" height="24" >' + '</a>' as iEdit   
   ,[Appraisal_Domain] as Step, [Appraisal_DomainName] as [Name],[Domain_Code],[Comments], [Domain_Sign],isnull([Active],0) as [Active]  
   from dbo.EPA_sys_appraisalDomain  as A 
	where Appraisal_Code = @Type
    order by A.IDs

if @Oprate ='Retrieve' 
	select IDs, [Appraisal_Domain] as Step, [Appraisal_DomainName] as [Name],[Domain_Code],[Comments], [Domain_Sign],isnull([Active],0) as [Active] 
    from dbo.EPA_sys_appraisalDomain 
	where IDs = @IDs
if @Oprate in ('Update', 'Insert')
	if exists (select * from  dbo.EPA_sys_appraisalDomain     where IDs = @IDs)
		update dbo.EPA_sys_appraisalDomain
		set [Appraisal_Domain] = @Step, [Appraisal_DomainName] = @Name, [Domain_Code] = @Code,[Comments] =@Comment, [Domain_Sign]= @Sign,[Active] = @Active
		  ,lu_Date =getdate(), lu_User =  @UserID
		where IDs = @IDs
    else
		insert into dbo.EPA_sys_appraisalDomain
			( [Appraisal_Code], [Appraisal_Domain] , [Appraisal_DomainName] ,[Domain_Code], [Comments], [Domain_Sign], [Active],lu_function,lu_date, lu_user)
		values(	@Type,@Step,@Name,@Code, @Comment, @Sign,@Active, app_name(),getdate(),@UserID)
 
if @Oprate ='Delete'
    delete  dbo.EPA_sys_appraisalDomain  
	where IDs = @IDs
 
 END
  

