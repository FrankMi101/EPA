



 



 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 19, 2018
-- Description:	get and update Appraisal Domain
-- ==================================================================================
  
CREATE proc [dbo].[EPA_sys_DomainCompetencyList]  --  'Get','mif','EPA','1' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,
	@Area			varchar(20)= null,
	@IDs			varchar(10) = null,
	@Code			varchar(20) = null,
	@Name			varchar(350) =null,
	@Comments		varchar(250) =null,
	@Active			int = null,
	@TPA			int = null,
	@NTP			int = null,
	@LTO			int = null

as

set nocount on 
 begin
    declare @PS   varchar(7), @imgA varchar(200)
	set @imgA =  dbo.EPA_getImageIcon('Delete') -- '<img border="0" width="25" height="25" src="../images/close.ico" />' 
	set @PS = ''',''' 
	if @Operate ='LookFors'
	     select IDs, Appraisal_Competency as CompetencyID , Appraisal_CompetencyName as CompetencyName, Comments, Active , 
		 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
	 	 '<a href="javascript:openLookFors(''' + cast(IDs as varchar(10)) + @PS +   cast(Appraisal_Domain  as varchar(10)) + @PS  + cast(Appraisal_Competency as varchar(10)) + ''')">'
		 + dbo.EPA_getImageIcon('LookFors') + ' </a>' as ActionS
	 	 from [dbo].[EPA_sys_appraisalDomainCompetency]
		 where Appraisal_Code  = @Category  and Appraisal_Domain =  @Area
		 order by RowNo
	else
		begin
			if @Operate ='Get'
				 select IDs,  ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
				 Appraisal_Competency as CompetencyID , Appraisal_CompetencyName as CompetencyName, Comments, Active,  TPA, NTP,LTO,
					 --'<a title="click on button to delete this record of ' + Appraisal_CompetencyName + ' " href="javascript:DeleteRecord(''' 
					 --+ cast(IDs as  varchar(10)) + @PS + Appraisal_Code + ''')" >'  +  @imgA + '</a>'  as [Action], 
					  '<a href="#" title="click on button to delete this record of ' + Appraisal_CompetencyName + ' " >'  +  @imgA + '</a>'  as [Action], 
					 '<a href="#">'+ dbo.EPA_getImageIcon('Save') + ' </a>' as ActionS
	 			 from [dbo].[EPA_sys_appraisalDomainCompetency]
				 where Appraisal_Code  = @Category  and Appraisal_Domain =  @Area
				 order by RowNo

	 

			else
			  begin try
				   begin tran
 						if exists (select * from [dbo].[EPA_sys_appraisalDomainCompetency]   where   IDs = @IDs )
						   begin
							   if @Operate ='Delete'
									delete  [dbo].[EPA_sys_appraisalDomainCompetency]  where    IDs = @IDs  
							   else
								  update  [dbo].[EPA_sys_appraisalDomainCompetency] 
								  set [Appraisal_Competency] = @Code , [Appraisal_CompetencyName] = @Name, Comments = @comments , Active = @Active, TPA = @TPA, NTP = @NTP , LTO = @LTO,
								  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
								  where   IDs = @IDs
							end
 						else
							insert into   [dbo].[EPA_sys_appraisalDomainCompetency] 
							( [Appraisal_Code], [Appraisal_Domain], [Appraisal_Competency],[Appraisal_CompetencyName], comments,Active, lu_date,lu_user,lu_function)
							values( @Category, @Area, @Code, @Name, @Comments, @Active, getdate(), @UserID, app_name())
	 
				   commit tran	
						Select 'Successfully' as rValue
			   end try
			   begin catch
				   Rollback tran
				   Select 'Failed' as rValue		
			   end catch
		end
 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]









