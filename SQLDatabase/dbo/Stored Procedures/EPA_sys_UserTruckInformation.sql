

 
 -- drop proc dbo.EPA_sys_UserTruckInformation
 
create proc [dbo].[EPA_sys_UserTruckInformation] -- 'mif','Role'
	@UserID    varchar(30),
	@Type      varchar(20),
	@Value	   varchar(100) = null

as

set nocount on 

if @Value  is null
   begin 
      if not exists ( select * from dbo.EPA_sys_UsersTrack where UserID = @UserID)
		insert into dbo.EPA_sys_UsersTrack
		(UserID, Work_UserID,Work_Year,Unit_code)
		values (@UserID, @UserID,year(getdate()), '0000')
        select  Work_UserID  from dbo.EPA_sys_UsersTrack where UserID = @UserID
      if @Type ='UserRole'
		select UserRole  from dbo.EPA_sys_UsersTrack where UserID = @UserID
   end
else
   begin
      if @Type ='Login'
     	 update dbo.EPA_sys_UsersTrack  set LogOn = rtrim(@Value), Login_Time = getdate()  where UserID = @UserID
      if @Type ='Logout'
     	 update dbo.EPA_sys_UsersTrack  set LogOn = rtrim(@Value), Logout_Time = getdate()  where UserID = @UserID
      if @Type ='UserRole'
     	 update dbo.EPA_sys_UsersTrack  set UserRole = rtrim(@Value)  where UserID = @UserID

   end  
 

