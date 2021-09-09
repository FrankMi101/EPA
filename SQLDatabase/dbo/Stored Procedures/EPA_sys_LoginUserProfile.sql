




-- ============================================================================
-- Author:		Frank Mi
-- Create date: October 20, 2017 
-- Description:	get Login User profile. such as user role, user postion, and permission
-- =============================================================================
 
CREATE proc [dbo].[EPA_sys_LoginUserProfile] -- 'LoginUserEmployeeID','bellisa03'
	@Operate   varchar(30),
	@UserID    varchar(30),
	@Role 	   varchar(30) = null

as

set nocount on
declare  @gRole 	varchar(30)
declare @gPermission  varchar(30)
-- set @UserID = dbo.tcdsb_Login(@UserID,'UserID')
if @Operate ='CurrentSchoolYear'
     begin 
		if exists (select * from [dbo].[EPA_sys_UsersActionTrack]  where UserID =   @UserID)
			select   [dbo].[EPA_CurrentApprYear](Working_Unit)       --select dbo.EPA_CurrentSchoolYear(8,25) as rValue
			from [dbo].[EPA_sys_UsersActionTrack]  where UserID = @UserID
		else
			select [dbo].[EPA_CurrentApprYear](Unit_ID)      
			from [dbo].[EPA_Org_EmployeeList] where UserID = @UserID
		 --select dbo.EPA_CurrentSchoolYear(8,25) as rValue
	  end
else if @Operate ='Role'
        select dbo.EPA_getUserAppraisalRole(@UserID)
 
else if @Operate ='Position'
     select top 1 Employee_Position
	 from [dbo].[EPA_Org_EmployeeList]  
	 where UserID = @UserID 
else if @Operate ='LoginUserEmployeeID'
     select top 1   Employee_ID
	 from [dbo].[EPA_Org_EmployeeList]  
	 where UserID = @UserID 

else if @Operate ='LoginUserName'
    begin
	    if exists (select * from [dbo].[EPA_sys_securityUsers] where UserID = @UserID)
			select top 1 UserName
			from [dbo].[EPA_sys_securityUsers]
			 where UserID = @UserID
		else if exists (select * from [dbo].[EPA_Org_EmployeeList]  where  UserID = @UserID )
			select top 1 FirstName + ' ' + LastName
			from [dbo].[EPA_Org_EmployeeList]  
			where UserID = @UserID 
		else
			select 'Unknow Login User'	
	 end
 else if @Operate = 'Permission'
   begin
      if @Role is null
          set @Role = dbo.EPA_getUserAppraisalRole(@UserID)
  
      set @gPermission = (select top 1 Permission from dbo.EPA_sys_securityUsersPermission where GroupID = @UserID and GrantType ='User')
      if @gPermission is null 
         set @gPermission = ( select top 1 Permission from dbo.EPA_sys_securityUsersPermission where GroupID = @Role and GrantType ='Group')
      set @gPermission = isnull(@gPermission,'Deny')
      select @gPermission as  rValue 

   end  
else 
    select top 1 Employee_ID 
	 from [dbo].[EPA_Org_EmployeeList]  
	 where UserID = @UserID 
  



