









 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 17, 2019
-- Description:	get and update Appraisal Area
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_SetupAppraisalCategory]       -- 'Retrieve','mif','20172018','0529','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30), 
	@IDs			varchar(10) = null,
	@Code			varchar(20) = null,
	@Name			varchar(100) =null,
	@Comments		varchar(250) =null,
	@Active			int = null

as

set nocount on 
 begin
    declare @PS   varchar(7), @imgA varchar(200)
	set @imgA = dbo.EPA_getImageIcon('Delete')
	set @PS = ''',''' 
	if @Operate = 'List' 
		 select IDs, Code,[Name], Comments, Active  ,
		 	 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo, 
			  '<a href="#" title="click on button to delete this record of ' + [Name] + ' " >'  +  @imgA + '</a>'  as [Action], 
			 '<a href="#"> ' + dbo.EPA_getImageIcon('Save') +' </a>' as ActionS
	     from [dbo].[EPA_sys_appraisalCategory] 
		 order by RowNo
    else if @Operate ='Get'
	     select IDs, Code,[Name], Comments, Active,  
			  '<a href="#" title="click on button to delete this record of ' + [Name] + ' " >'  +  @imgA + '</a>'  as [Action], 
			 '<a href="#"> ' + dbo.EPA_getImageIcon('Save') +'  </a>' as ActionS
	     from [dbo].[EPA_sys_appraisalCategory] 
		 Where IDs = @IDs
    else
		  begin try
			   begin tran
			       if exists(select * from [dbo].[EPA_sys_appraisalCategory] where IDs =@IDs)
				      begin
						if @Operate ='Delete'
							delete  [dbo].[EPA_sys_appraisalCategory]  where    IDs = @IDs  
						else if @Operate ='Update'
 							 update [dbo].[EPA_sys_appraisalCategory] 
							 set [Code] = @Code , [Name] = @Name, Comments = @comments , Active = @Active,
								  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							 where   IDs = @IDs
					  end 
 				   else if @Operate ='Insert'
						insert into   [dbo].[EPA_sys_appraisalCategory] 
						( [Code], [Name], comments,Active, lu_date,lu_user,lu_function)
						values(  @Code, @Name, @Comments,@Active, getdate(),@UserID, app_name())
	 
			   commit tran	
					Select 'Successfully' as rValue
		   end try
		   begin catch
			   Rollback tran
			   Select 'Failed' as rValue		
		   end catch

 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]








