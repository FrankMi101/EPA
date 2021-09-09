

-- Drop proc dbo.EPA_sys_UploadFile
CREATE Procedure [dbo].[EPA_sys_UploadFile]
 	(	@UserID		varchar(30) ='upaUser',
		@FileID		varchar(50) = null,
		@Category	varchar(50) = null, 
		@appCode    varchar(20) = null, 
		@FileType	varchar(20) = null, 
		@FileSize	int = null, 
		@FileName	varchar(100) = null, 
 		@Content  image = null 
	)
AS
BEGIN 
	set nocount on
 
	if @Category  is null
		if @UserID ='FileContent'
			select File_Content 
			from [dbo].[EPA_sys_FileDocument]
			where [File_ID] = @FileID
		else
			select [File_ID],File_Type,File_Size,[File_Name], File_Content,Category 
			from [dbo].[EPA_sys_FileDocument]
			where [File_ID] = @FileID
	else
	   if exists (select * from [dbo].[EPA_sys_FileDocument]where [File_ID] = @FileID )
			update [dbo].[EPA_sys_FileDocument]
			set		File_Type = @FileType, 	File_Size = @FileSize, [File_Name] = @FileName,File_Content = @Content , Category = @Category,
					lu_function = app_name() , lu_date = getdate() ,lu_user = @UserID
			where [File_ID] = @FileID 
		else
			insert into [dbo].[EPA_sys_FileDocument]
				([File_ID],File_Type,File_Size,[File_Name], File_Content,Category,Appraisal_Code,lu_function,lu_date,lu_User)
			values(@FileID,@FileType,@FileSize,@FileName,@Content,@Category,@appCode,app_name(),getdate(),@UserID )
 
 
 END

