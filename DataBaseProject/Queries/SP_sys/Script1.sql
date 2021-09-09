IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'upa_sys_TitleText')
	BEGIN
		DROP  Procedure  dbo.upa_sys_TitleText
	END

GO
 
CREATE Procedure dbo.upa_sys_TitleText
 	(	@UserID		varchar(50) ='upaUser',
		@appCode	varchar(20) ='UPA',
		@Model		varchar(10) = 'Run', 
		@Category	varchar(20) = null, 
		@Title_IDs  varchar(30) = null, 
		@Title_Type varchar(20) = null, 
		@Value		varchar(1000) = null 
	)

 
AS
BEGIN 
	set nocount on
	declare @strHref varchar(100)
	declare @Para varchar(200)
	set @strHref = 	'<A title ="Entry Title" href="javascript:openTitleEditPage'
	set @Para = '(''' + @appCode + ''',''' + @Title_IDs + ''',''' + @Title_Type + ''')">'
	if @Value is null
		if @Model ='Design'
	        if exists (select * from dbo.upa_sys_appraisalTitle where Title_ID = @Title_IDs and Title_Type = @Title_Type and Appraisal_Code = @appCode)
				select  rtrim(@strHref)+ rtrim(@Para) + Title_Name + '</A>'
				from dbo.upa_sys_appraisalTitle 
				where Title_ID = @Title_IDs and Title_Type = @Title_Type and Appraisal_Code = @appCode
			else
				select rtrim(@strHref)+ rtrim(@Para) + @Title_IDs + '</A>'
 
        else
		    if exists (select * from dbo.upa_sys_appraisalTitle where Title_ID = @Title_IDs and Title_Type = @Title_Type and Appraisal_Code = @appCode)
				select top 1  Title_Name from dbo.upa_sys_appraisalTitle where Title_ID = @Title_IDs and Title_Type = @Title_Type and Appraisal_Code = @appCode
			else
				select @Title_IDs
	else
		if exists (select * from dbo.upa_sys_appraisalTitle where Title_ID = @Title_IDs and Title_Type = @Title_Type and Appraisal_Code = @appCode)
			update dbo.upa_sys_appraisalTitle
			set Title_Name = @Value
			where Title_ID = @Title_IDs and Title_Type = @Title_Type and Appraisal_Code = @appCode
		else
			insert into dbo.upa_sys_appraisalTitle
					(Title_ID, Title_Type, Appraisal_Code,Title_Name,lu_User,lu_Function, lu_Date)
			values(	@Title_IDs,@Title_Type,@appCode,	  @Value    ,@UserID, app_name(),getdate())
END
GO

 
GRANT EXEC ON dbo.upa_sys_TitleText TO PUBLIC

GO
  