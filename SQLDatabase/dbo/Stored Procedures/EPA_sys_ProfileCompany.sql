

-- Drop proc dbo.EPA_sys_ProfileCompany
CREATE Procedure [dbo].[EPA_sys_ProfileCompany]
 	( 	@UserID		varchar(30) ='upaUser',
		@Code		varchar(30) = null,
		@Name		varchar(200) = null, 
		@LogoSign   varchar(50) = null, 
		@Industry   varchar(50) = null, 
		@Comments	varchar(500) = null 
	)
AS
BEGIN 
	set nocount on
delete EPA_sys_Company
where ids=3
	if @Code is null
		select IDs,  Unit_Code,Unit_Name,Unit_Sign,comments ,Industry_code
		from dbo.EPA_sys_Company 
	else
		if exists (select * from dbo.EPA_sys_Company where Unit_Code = @Code  )
			update  dbo.EPA_sys_Company
			set Unit_Name = @Name,Unit_Sign = @LogoSign,Industry_code = @Industry , comments = @Comments , lu_Date =getdate(), lu_User =  @UserID
			where Unit_Code = @Code
		else
		   insert into dbo.EPA_sys_Company
			(Unit_Code,Unit_Name,Unit_Sign,Industry_code,comments,lu_Function,lu_Date,lu_User)
			values (@Code,@Name,@LogoSign,@Industry,@Comments, app_name(),getdate(),@UserID)

 
 
 END

