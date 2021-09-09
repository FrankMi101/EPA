

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 14, 2018
-- Description:	get and update Appraisal Process Detail
-- ==================================================================================


 -- Drop proc dbo.EPA_sys_ProcessAppraisalProcessDetail 'Retrieve','','UPA','2'
CREATE Procedure [dbo].[EPA_sys_ProcessAppraisalProcessDetail]
 	(	@Oprate		varchar(30) = 'List',
		@UserID		varchar(30) ='upaUser',
		@Type		varchar(30) ='UPA',
		@Process	varchar(30) = null, 
		@IDs		varchar(10) =null,
		@Step		varchar(20) = null, 
		@Code		varchar(50) = null,
		@Indicator	varchar(50) = null,
		@Name		varchar(200) = null, 
		@LongName	varchar(500) = null, 
		@Comment	varchar(500) = null ,
		@Sign		varchar(20) = null ,
		@Active	   bit  = null 
	)
AS
BEGIN   

	set nocount on
if @Oprate ='List'
   select IDs, 
	'<a title="Edit ' + [Appraisal_ProcessDetailName] + ' Process Detail" href="javascript:OpenDetail(''' + cast(IDs as  varchar(5)) +  ''')" >'
	+ dbo.EPA_getImageIcon('Edit') + '</a>' as iEdit   
   ,[Appraisal_ProcessStep], [Appraisal_ProcessDetail],[Appraisal_ProcessDetailName],
	 isnull([Appraisal_ProcessDetailIndicator],'') as Appraisal_ProcessDetailIndicator,
	[Comments], [Appraisal_ProcessSign],isnull([Active_sign],0) as [Active_sign]  
   from dbo.EPA_sys_appraisalProcessDetail  as A 
	where Appraisal_Code = @Type and Appraisal_Process = @Process
    order by A.IDs

if @Oprate ='Retrieve' 
	select IDs, [Appraisal_ProcessStep], [Appraisal_ProcessDetail],[Appraisal_ProcessDetailName], [Appraisal_ProcessDetailNameLong],
    isnull([Appraisal_ProcessDetailIndicator],'') as Appraisal_ProcessDetailIndicator, 
	[Comments], [Appraisal_ProcessSign],isnull([Active_sign],0) as [Active_sign]
    from dbo.EPA_sys_appraisalProcessDetail 
	where IDs = @IDs
if @Oprate in ('Update', 'Insert')
	if exists (select * from dbo.EPA_sys_appraisalProcessDetail     where IDs = @IDs)
		update dbo.EPA_sys_appraisalProcessDetail
		set [Appraisal_ProcessStep] = @Step, [Appraisal_ProcessDetail] = @Code, [Appraisal_ProcessDetailName] = @Name, [Appraisal_ProcessDetailNameLong] = @LongName, [Appraisal_ProcessDetailIndicator] = @Indicator,[Comments] =@Comment, [Appraisal_ProcessSign]= @Sign,[Active_sign] = @Active
		  ,lu_Date =getdate(), lu_User =  @UserID
		where IDs = @IDs
    else
		insert into dbo.EPA_sys_appraisalProcessDetail
			( [Appraisal_Code],[Appraisal_Process],[Appraisal_ProcessStep], [Appraisal_ProcessDetail],[Appraisal_ProcessDetailName], [Appraisal_ProcessDetailNameLong],[Appraisal_ProcessDetailIndicator], [Comments], [Appraisal_ProcessSign],[Active_sign], lu_function,lu_date, lu_user)
		values(	@Type,@Process,@Step,@Code,@Name, @LongName, @Indicator,@Comment, @Sign,@Active, app_name(),getdate(),@UserID)
 
if @Oprate ='Delete'
    delete  dbo.EPA_sys_appraisalProcessDetail  
	where IDs = @IDs
 
 END
  

