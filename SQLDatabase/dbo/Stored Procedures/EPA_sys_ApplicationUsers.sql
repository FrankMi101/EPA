




 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 14, 2018
-- Description:	get and update application Users
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_ApplicationUsers]   --    'Date','mif','20172018','0529','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,
	@Area			varchar(20)= null, -- UserRole or GroupID
	@IDs			varchar(10) = null,
	@Code			varchar(20) = null,
	@Name			varchar(100) =null,
	@Comments		varchar(250) =null,
	@Active			int = null,
	@UserRole			varchar(100) =null 

as

set nocount on 
 begin
    declare @PS   varchar(7), @imgA varchar(200)
	set @imgA =  dbo.EPA_getImageIcon('Delete')
	set @PS = ''',''' 
	if @IDs is null
		 select IDs, userID as Code , userName  as NameText,GroupID as UserRole, Comments, Active_Sign as Active ,
		 	 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
			 '<a title="click on button to delete this record of ' + userName + ' " href="javascript:DeleteRecord(''' 
		     + cast(IDs as  varchar(10)) + @PS + UserID + @PS + GroupID + ''')" >'  +  @imgA + '</a>'  as [Action],
			  '<a href="#">' +  dbo.EPA_getImageIcon('Save') + ' </a>' as ActionS  
		 from [dbo].[EPA_sys_securityUsers]
		 where UserID is not null
		 order by RowNo
    else
	  begin try
		   begin tran
 				if exists (select * from [dbo].[EPA_sys_securityUsers]   where  IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_sys_securityUsers]  where   IDs = @IDs  
					   else
						  update  [dbo].[EPA_sys_securityUsers] 
						  set userID = @Code , userName = @Name, Comments = @comments , Active_Sign = @Active, --groupID = @UserRole,
						  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where   IDs = @IDs
					end
 				else
					insert into   [dbo].[EPA_sys_securityUsers] 
					( GroupID, UserID, UserName, comments,Active_Sign, lu_date,lu_user,lu_function)
					values(@UserRole, @Code,@Name,@Comments,@Active, getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from  [dbo].[EPA_sys_appraisalRole]



