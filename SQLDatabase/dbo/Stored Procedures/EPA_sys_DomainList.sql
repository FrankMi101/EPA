







 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 19, 2018
-- Description:	get and update Appraisal Domain
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_DomainList]   --    'Date','mif','20172018','0529','00010452','Appraisal1','ntp'  
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
	set @imgA =  dbo.EPA_getImageIcon('Delete') -- '<img border="0" width="25" height="25" src="../images/close.ico" />'
	set @PS = ''',''' 
	if @Operate ='Get'
		 select IDs, Appraisal_Domain as DomainID , Appraisal_DomainName as DomainName, Comments, Active  ,
		 	 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
			 --'<a title="click on button to delete this record of ' + Appraisal_DomainName + ' " href="javascript:DeleteRecord(''' 
		  --   + cast(IDs as  varchar(10)) + @PS + Appraisal_Code + ''')" >'  +  @imgA + '</a>'  as [Action], 
			  '<a href="#" title="click on button to delete this record of ' + Appraisal_DomainName + ' " >'  +  @imgA + '</a>'  as [Action], 
			 '<a href="#"> ' + dbo.EPA_getImageIcon('Save') + ' </a>' as ActionS
	     from [dbo].[EPA_sys_appraisalDomain]
		 where Appraisal_Code  = @Category
		 order by RowNo
    else
	  begin try
		   begin tran
 				if exists (select * from [dbo].[EPA_sys_appraisalDomain]   where   IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_sys_appraisalDomain]  where    IDs = @IDs  
					   else
						  update  [dbo].[EPA_sys_appraisalDomain] 
						  set [Appraisal_Domain] = @Code , [Appraisal_DomainName] = @Name, Comments = @comments , Active = @Active,
						  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where   IDs = @IDs
					end
 				else
					insert into   [dbo].[EPA_sys_appraisalDomain] 
					( [Appraisal_Code], [Appraisal_Domain],[Appraisal_DomainName], comments,Active, lu_date,lu_user,lu_function)
					values( @Category, @Code, @Name,@Comments,@Active, getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]






