

-- Drop proc dbo.EPA_sys_ProfileIndustry 
CREATE Procedure [dbo].[EPA_sys_ProfileIndustry]
 	( 	@UserID		varchar(30) ='upaUser',
		@Code		varchar(50) = null,
		@Name		varchar(200) = null, 
		@LogoSign   varchar(50) = null, 
		@Comments	varchar(500) = null 
	)
AS
BEGIN 
	set nocount on

	if @Code is null
		select IDs,  Industry_Code,Industry_Name,Industry_Sign,comments
		from dbo.EPA_sys_Industry
		where ids =2
		order by IDs
	else
		if exists (select * from dbo.EPA_sys_Industry where Industry_Code = @Code  )
			update  dbo.EPA_sys_Industry
			set Industry_Name = @Name,Industry_Sign = @LogoSign,comments = @Comments , lu_Date =getdate(), lu_User =  @UserID
			where Industry_Code = @Code
		else
		   insert into dbo.EPA_sys_Industry
			(Industry_Code,Industry_Name,Industry_Sign,comments,lu_Function,lu_Date,lu_User)
			values (@Code,@Name,@LogoSign,@Comments, app_name(),getdate(),@UserID)

 
 
 END

