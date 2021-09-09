






 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: June 04, 2020
-- Description:	get and update application Users
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_SystemItemsList_phase]   
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(20)= null,
	@Area			varchar(20)= null,
	@IDs			varchar(10) = null,
	@Code			varchar(30) = null,
	@Name			varchar(200) =null,
	@Comments		varchar(250) =null,
	@Active			bit = null,
	@Orders			varchar(10) = null,
	@KeyPoint		varchar(50) = null

as

set nocount on 
 begin
    declare @PS   varchar(7)  
	set @PS = ''',''' 
	if @IDs is null
		begin 
 
				 select IDs, Appraisal_Phase as Code, Appraisal_PhaseName as [Name] ,
					Comments, Active as Active ,
		 			 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
					 '<a title="click on button to delete this record of ' + Appraisal_Phase + ' " href="javascript:DeleteRecord(''' 
					 + cast(IDs as  varchar(10)) + @PS + Appraisal_PhaseName + @PS + Appraisal_Phase + ''')" >'  +   dbo.EPA_getImageIcon('Delete')  + '</a>'  as [Action],
					  '<a href="#">' + dbo.EPA_getImageIcon('Save') + '</a>' as ActionS  
					 from [dbo].[EPA_sys_appraisalPhase]  
					 where Appraisal_Code = 'EPA'
					  order by RowNo 
		end		
    else
	  begin try
		   begin tran
 				if exists (select * from [dbo].[EPA_sys_appraisalPhase]   where  IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_sys_appraisalPhase]   where   IDs = @IDs  
					   else
						  update  [dbo].[EPA_sys_appraisalPhase]  
						  set Appraisal_Phase = @Code , Appraisal_PhaseName =@Name, Comments = @comments , Active = @Active, Appraisal_PhaseStep = @Orders, Appraisal_passSign = @KeyPoint --groupID = @UserRole,
						  , lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where   IDs = @IDs
					end
 				else
					insert into [dbo].[EPA_sys_appraisalPhase] 
					( Appraisal_Code, Appraisal_Phase, Appraisal_PhaseName,comments, Active, Appraisal_PhaseStep, Appraisal_passSign, lu_date,lu_user,lu_function)
					values(@Category,@Code,@Name, @Comments,@Active, @Orders,@KeyPoint,  getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from  [dbo].[EPA_sys_appraisalRole]




