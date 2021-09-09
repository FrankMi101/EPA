

-- Drop proc dbo.EPA_sys_ProfileAppraisal
CREATE Procedure [dbo].[EPA_sys_ProfileAppraisal]
 	(	@Oprate		varchar(30) = null,
		@UserID		varchar(30) ='upaUser',
		@IDs		varchar(10) =null,
		@Code		varchar(50) = null,
		@Name		varchar(200) = null, 
		@LogoSign   varchar(50) = null, 
		@Industry   varchar(50) = null, 
		@Comments	varchar(500) = null, 
		@Method		varchar(20) = null, 
		@Cycle		varchar(20) = null 
	)
AS
BEGIN   

	set nocount on
if @oprate ='List'
   select A.IDs,A.Appraisal_Code,Appraisal_Name, Appraisal_Method, Appraisal_Cycle, '~\' + isnull(F.[File_Name],'') as Appraisal_Sign,Industry_Code  
   from dbo.EPA_sys_appraisalType as A 
   left join  dbo.EPA_sys_FileDocument as F on A.Appraisal_sign = F.[File_ID]	
 	order by A.IDs

if @oprate ='Retrieve'
	select IDs,Industry_Code,Appraisal_Code,Appraisal_Name,Appraisal_Sign,Appraisal_Method,Appraisal_cycle,comments
	from 	dbo.EPA_sys_appraisalType
	where IDs = IDs
if @oprate ='Update'
	if exists (select * from dbo.EPA_sys_appraisalType where IDs = @IDs)
		update dbo.EPA_sys_appraisalType
		set Appraisal_Code = @Code, Appraisal_Name = @Name, Appraisal_Sign = @LogoSign,Appraisal_Method  = @Method, Appraisal_Cycle = @cycle, lu_Date =getdate(), lu_User =  @UserID
		where IDs = @IDs
    else
		insert into dbo.EPA_sys_appraisalType
			(Industry_Code,Appraisal_Code,Appraisal_Name,Appraisal_Sign,Appraisal_Method,Appraisal_cycle,comments,lu_function,lu_date, lu_user)
		values(	@Industry,@Code,@Name,@LogoSign,@Method,@Cycle,@Comments, app_name(),getdate(),@UserID)
if  @oprate ='Insert'
		insert into dbo.EPA_sys_appraisalType
			(Industry_Code,Appraisal_Code,Appraisal_Name,Appraisal_Sign,Appraisal_Method,Appraisal_cycle,comments,lu_function,lu_date, lu_user)
		values(	@Industry,@Code,@Name,@LogoSign,@Method,@Cycle,@Comments, app_name(),getdate(),@UserID)

if @oprate ='Delete'
    delete  dbo.EPA_sys_appraisalType
	 where IDs = @IDs
 
 END
 

