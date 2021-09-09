


 -- Drop proc dbo.EPA_sys_UserDigitalSignatureRead 'Retrieve','','UPA','2'
CREATE Procedure [dbo].[EPA_sys_UserDigitalSignatureRead]
 	(	@Operate		varchar(30) ='read',
		@UserID		varchar(30) ='upaUser',
		@Type		varchar(30) ='SginOff',
		@EmployeeID	varchar(20),
		@DigitalKey	varchar(250) = null 
	)
AS
BEGIN   
	set nocount on
	if @DigitalKey is null
	     if exists (select * from  dbo.EPA_sys_UsersDigitalSignature where Employee_ID = @EmployeeID)
			 select top 1 Digital_Signature from dbo.EPA_sys_UsersDigitalSignature 
			 where Employee_ID = @EmployeeID
		else
		    select '' as Digital_Signature
    else
	  begin
	     begin try
			   if exists (select * from  dbo.EPA_sys_UsersDigitalSignature where Employee_ID = @EmployeeID)
					select top 1 Digital_Signature 
					from dbo.EPA_sys_UsersDigitalSignature 
					where Employee_ID = @EmployeeID
			   else
					insert into dbo.EPA_sys_UsersDigitalSignature 
					(Employee_ID,Digital_Signature,lu_user,lu_date,lu_function)
					values(@EmployeeID,@DigitalKey, @UserID, getdate(), app_name())

			 select 'Successful' as rValue
         end try
		 begin catch
		     Select 'Failed' as rValue
		 end catch
      end			 
 END
  


