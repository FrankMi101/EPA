

 


 -- drop proc dbo.EPA_sys_UserPermissionControl
 
create proc [dbo].[EPA_sys_UserPermissionControl] -- 'mif','Role'
	@UserID    varchar(30),
	@Type      varchar(20),
	@Role 	   varchar(30) = null

as

set nocount on
declare  @gRole 	varchar(30)
declare @gPermission  varchar(30)
-- set @UserID = dbo.tcdsb_Login(@UserID,'UserID')

if @Type ='Role'
   begin 
       select dbo.EPA_getUserAppraisalRole(@UserID)
    end
  
if @Type = 'Permission'
   begin
      if @Role is null
          set @Role = dbo.EPA_getUserAppraisalRole(@UserID)
  
      set @gPermission = (select top 1 Permission from dbo.EPA_sys_securityUsersPermission where GroupID = @UserID and GrantType ='User')
      if @gPermission is null 
         set @gPermission = ( select top 1 Permission from dbo.EPA_sys_securityUsersPermission where GroupID = @Role and GrantType ='Group')
      set @gPermission = isnull(@gPermission,'Deny')
      select @gPermission as  rValue 

   end  

  

