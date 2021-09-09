

 -- Drop proc dbo.EPA_sys_ProfileAppraisalRole 'Retrieve','','UPA','2'
CREATE Procedure [dbo].[EPA_sys_ProfileAppraisalRole]
 	(	@Oprate		varchar(30) = 'List',
		@UserID		varchar(30) ='upaUser',
		@Type		varchar(30) ='UPA',
		@IDs		varchar(10) =null,
		@Role		varchar(20) = null, 
		@Name		varchar(50) = null, 
		@Code		varchar(10) = null,
		@Comment	varchar(100) = null ,
		@Active	   bit  = null 
	)
AS
BEGIN   

	set nocount on
if @Oprate ='List'
   select IDs, [Role], [Full_Name],[Role_Code],[Comments],   [Active_sign],
	'<a title="Edit ' + [Role] + ' Role" href="javascript:OpenDetail(''' + cast(IDs as  varchar(5)) +  ''')" > <img src="../images/edit.png" border="0" width="24" height="24" >' + '</a>' as iEdit   
   from dbo.EPA_sys_appraisalRole as A 
	where Appraisal_code = @Type
    order by A.IDs

if @Oprate ='Retrieve' 
	select IDs, [Role], [Full_Name],[Role_Code],[Comments],[Active_sign] 
    from dbo.EPA_sys_appraisalRole  
	where IDs = @IDs
if @Oprate in ('Update', 'Insert')
	if exists (select * from dbo.EPA_sys_appraisalRole     where IDs = @IDs)
		update dbo.EPA_sys_appraisalRole
		set [Role] = @Role, [Full_Name] = @Name, [Role_Code] = @Code,[Comments] =@Comment ,[Active_sign] = @Active
		  ,lu_Date =getdate(), lu_User =  @UserID
		where IDs = @IDs
    else
		insert into dbo.EPA_sys_appraisalRole
			( Appraisal_Code,[Role], [Full_Name],[Role_Code],[Comments],[Active_sign], lu_function,lu_date, lu_user)
		values(	@Type,@Role,@Name,@Code, @Comment, @Active, app_name(),getdate(),@UserID)
 
if @Oprate ='Delete'
    delete  dbo.EPA_sys_appraisalRole  
	 where IDs = @IDs
 
 END
 

