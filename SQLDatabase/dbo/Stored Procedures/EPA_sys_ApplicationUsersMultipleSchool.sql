





 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 21, 2018
-- Description:	get and update application Users
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_ApplicationUsersMultipleSchool]   --    'Date','mif','20172018','0529','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,
	@Area			varchar(20)= null, -- UserRole or GroupID
	@SchoolYear		varchar(8)= null, -- UserRole or GroupID
	@IDs			varchar(10) = null,
	@PrincipalID	varchar(30) = null,
	@SchoolCode		varchar(8) =null,
	@Comments		varchar(250) =null,
	@Active			int = null

as

set nocount on 
 begin
    declare @PS   varchar(7), @imgA varchar(200)
	set @imgA =  dbo.EPA_getImageIcon('Delete')
	set @PS = ''',''' 
	if @IDs is null
		 select IDs, UserID, SchoolCode,
		  [dbo].[EPA_getUserNamebyID]( userID)  as UserName , 
		  [dbo].[EPA_getSchoolName](SchoolCode,'Name') as SchoolName, 
		    Comments, Active as Active ,
		 	 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
			 '<a title="click on button to delete this record of ' + UserID + ' " href="javascript:DeleteRecord(''' 
		     + cast(IDs as  varchar(10)) + @PS + UserID + @PS + SchoolCode + ''')" >'  +  @imgA + '</a>'  as [Action],
			  '<a href="#">' + dbo.EPA_getImageIcon('Save') + '</a>' as ActionS  
		 from  [dbo].[EPA_Org_MultipleSchoolUsers]
		 where schoolYear = @SchoolYear
		 order by RowNo
    else
	  begin try
		   begin tran
 				if exists (select * from [dbo].[EPA_Org_MultipleSchoolUsers]   where  IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_Org_MultipleSchoolUsers]  where   IDs = @IDs  
					   else
						  update  [dbo].[EPA_Org_MultipleSchoolUsers] 
						  set userID = @PrincipalID , SchoolCode =@SchoolCode, Comments = @comments , Active = @Active, --groupID = @UserRole,
						  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where   IDs = @IDs
					end
 				else
					insert into   [dbo].[EPA_Org_MultipleSchoolUsers] 
					( Category, SchoolYear,UserID, SchoolCode, comments,Active, lu_date,lu_user,lu_function)
					values(@Category,@SchoolYear,@PrincipalID,@SchoolCode,@Comments,@Active, getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from  [dbo].[EPA_sys_appraisalRole]




