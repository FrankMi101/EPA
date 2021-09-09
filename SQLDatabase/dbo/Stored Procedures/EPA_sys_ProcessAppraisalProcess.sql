

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 14, 2018
-- Description:	get and update Appraisal Process
-- ==================================================================================


 -- Drop proc dbo.EPA_sys_ProcessAppraisalProcess 'Retrieve','','UPA','2'
CREATE Procedure [dbo].[EPA_sys_ProcessAppraisalProcess]
 	(	@Oprate		varchar(30) = 'List',
		@UserID		varchar(30) ='upaUser',
		@Type		varchar(30) ='UPA',
		@IDs		varchar(10) =null,
		@Step		varchar(20) = null, 
		@Name		varchar(50) = null, 
		@Code		varchar(10) = null,
		@Comment	varchar(100) = null ,
		@Sign		varchar(20) = null ,
		@Active	   bit  = null 
	)
AS
BEGIN   

	set nocount on
if @Oprate ='List'
   select IDs, 
	'<a title="Edit ' + [Appraisal_ProcessName] + ' Process" href="javascript:OpenDetail(''' + cast(IDs as  varchar(5)) +  ''')" > ' 
	+ dbo.EPA_getImageIcon('Edit') + '</a>' as iEdit   
   ,[Appraisal_ProcessStep], [Appraisal_ProcessName],[Appraisal_Process],[Comments], [Appraisal_ProcessSign],isnull([Active_sign],0) as [Active_sign]  
   from dbo.EPA_sys_appraisalProcess  as A 
	where Appraisal_Code = @Type
    order by A.IDs

if @Oprate ='Retrieve' 
	select IDs, [Appraisal_ProcessStep], [Appraisal_ProcessName],[Appraisal_Process],[Comments], [Appraisal_ProcessSign],isnull([Active_sign],0) as [Active_sign]
    from dbo.EPA_sys_appraisalProcess 
	where IDs = @IDs
if @Oprate in ('Update', 'Insert')
	if exists (select * from dbo.EPA_sys_appraisalProcess     where IDs = @IDs)
		update dbo.EPA_sys_appraisalProcess
		set [Appraisal_ProcessStep] = @Step, [Appraisal_ProcessName] = @Name, [Appraisal_Process] = @Code,[Comments] =@Comment, [Appraisal_ProcessSign]= @Sign,[Active_sign] = @Active
		  ,lu_Date =getdate(), lu_User =  @UserID
		where IDs = @IDs
    else
		insert into dbo.EPA_sys_appraisalProcess
			( [Appraisal_Code],[Appraisal_ProcessStep], [Appraisal_ProcessName],[Appraisal_Process],[Comments],[Appraisal_ProcessSign],[Active_sign], lu_function,lu_date, lu_user)
		values(	@Type,@Step,@Name,@Code, @Comment, @Sign,@Active, app_name(),getdate(),@UserID)
 
if @Oprate ='Delete'
    delete  dbo.EPA_sys_appraisalProcess  
	where IDs = @IDs
 
 END
  

