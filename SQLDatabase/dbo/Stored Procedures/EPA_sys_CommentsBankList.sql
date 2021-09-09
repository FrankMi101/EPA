







 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 21, 2018
-- Description:	get and update application Users
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_CommentsBankList]    --  'get','mif','EPA','dsds','Board','0000' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,  --- Type
	@Area			varchar(20)= null, --  Owner
	@Type			varchar(30) = null,
	@Owner			varchar(30) = null,
 	@IDs			varchar(10) = null,
	@DomainID		varchar(10) = null,
	@Shared			varchar(50) =null,
	@Comments		varchar(250) =null,
	@Active			int = null

as

set nocount on 
 begin
    declare @PS   varchar(7), @imgA varchar(200)
	set @imgA =  dbo.EPA_getImageIcon('Delete') -- '<img border="0" width="23" height="23" src="../images/delete.png" />'
	set @PS = ''',''' 
	if @IDs is null
		 select IDs,  DomainID, dbo.EPA_getDomainName(DomainID) as DomainName, Shared,
 		      Comments, [Status] as Active ,
		 	 ROW_NUMBER() OVER(ORDER BY Shared, DomainID ) AS RowNo,
			 '<a title="click on button to delete this record of ' + Shared  + ' " href="javascript:DeleteRecord(''' 
		     + cast(IDs as  varchar(10)) + @PS + [Owner] + @PS + cast(DomainID as varchar(10)) + ''')" >'  +  @imgA + '</a>'  as [Action],
			  '<a href="#"> ' + dbo.EPA_getImageIcon('Save') + '</a>' as ActionS  -- <img border="0" width="23" height="23" src="../images/save.png" /> </a>' as ActionS  
		 from  [dbo].[EPA_sys_CommentsBank]
		 where [Type] = @Type and [Owner] = @Owner
		 order by RowNo
    else
	  begin try
		   begin tran
 				if exists (select * from [dbo].[EPA_sys_CommentsBank]   where  IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_sys_CommentsBank]  where   IDs = @IDs  
					   else
						  update  [dbo].[EPA_sys_CommentsBank] 
						  set  Shared = @Shared , Comments = @comments , [status] = @Active,  DomainID = @DomainID,
						  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where   IDs = @IDs
					end
 				else
					insert into   [dbo].[EPA_sys_CommentsBank] 
					(  [Type] , [Owner], DomainID , Shared, comments, [Status], lu_date,lu_user,lu_function)
					values(@Type, @Owner, @DomainID,@Shared,@Comments,@Active, getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from  [dbo].[EPA_sys_appraisalRole]





