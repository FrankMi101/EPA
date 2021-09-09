



 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 14, 2018
-- Description:	get and update Appraisal Role
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_ApplicationRole]   --    'Date','mif','20172018','0529','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,
	@Area			varchar(20)= null,
	@IDs			varchar(10) = null,
	@Code			varchar(20) = null,
	@Name			varchar(100) =null,
	@Comments		varchar(250) =null,
	@Active			int = null

as

set nocount on 
 begin
    declare @PS   varchar(7), @imgA varchar(200)
	set @imgA =  dbo.EPA_getImageIcon('Delete')
	set @PS = ''',''' 
	if @IDs is null
		 select IDs, [Role] as Code , Full_Name as NameText, Comments, Active_Sign as Active ,
		 	 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
			 '<a title="click on button to delete this record of ' + Full_Name + ' " href="javascript:DeleteRecord(''' 
		     + cast(IDs as  varchar(10)) + @PS + [Role] + ''')" >'  +  @imgA + '</a>'  as [Action],
			  '<a href="#">' + dbo.EPA_getImageIcon('Save') + ' </a>' as ActionS 
		 from [dbo].[EPA_sys_appraisalRole]
		 where Appraisal_Code = @Category
		 order by RowNo
    else
	  begin try
		   begin tran
 				if exists (select * from [dbo].[EPA_sys_appraisalRole]   where Appraisal_Code = @Category  and IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_sys_appraisalRole]  where Appraisal_Code = @Category  and IDs = @IDs  
					   else
						  update  [dbo].[EPA_sys_appraisalRole] 
						  set [Role] = @Code , Full_Name = @Name, Comments = @comments , Active_Sign = @Active,
						  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where Appraisal_Code = @Category  and IDs = @IDs
					end
 				else
					insert into   [dbo].[EPA_sys_appraisalRole] 
					( Appraisal_Code, [Role], Full_Name, comments,Active_Sign, lu_date,lu_user,lu_function)
					values(@Category, @Code,@Name,@Comments,@Active, getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]


