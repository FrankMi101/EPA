



 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 16, 2018
-- Description:	get and update Schools
-- ==================================================================================
 
CREATE proc [dbo].[EPA_ORG_SchoolsList]    -- 'Date','mif','EPA','School','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,
	@Area			varchar(20)= null,  -- school Type Elementary /secondary/ school/Department
	@IDs			varchar(10) = null,
	@Code			varchar(20) = null,
	@Name			varchar(100) =null,
	@Comments		varchar(250) =null,
	@Active			int = null,
	@District		varchar(30) =null,
	@Header			varchar(30) =null,
	@AreaCode		varchar(30) = null, 
 	@Panel			varchar(20) =null,
	@TPA			int =null,
	@PPA			int= null

as

set nocount on 
 begin
    declare @PS   varchar(7), @imgA varchar(200), @imgEdit varchar(200)
	set @imgA =  dbo.EPA_getImageIcon('Delete') -- '<img border="0" width="23" height="23" src="../images/delete.png" />'
	set @imgEdit =  dbo.EPA_getImageIcon('Edit2') -- '<img border="0" width="25" height="25" src="../images/Edit2.jpg" />'
	set @PS = ''',''' 
	if @IDs is null
		 select IDs, [UnitCode] as Code , [UnitName] as Name, Comments, [Active] as Active , 
		 [dbo].[EPA_getUserNamebyID](Header)  as Header, 
		 [dbo].[EPA_getSuperArea](Area,'SuperArea') as Supervisor,District, Panel, TPA,PPA,Brief_Name as BriefName,

		 	 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
			 '<a title="click on button to delete this record of ' + [UnitName] + ' " href="javascript:DeleteRecord(''' 
		     + cast(IDs as  varchar(10)) + @PS + [UnitCode] + ''')" >'  +  @imgA + '</a>'  as [Action],
		     '<a title="click on button to Edit this record of ' + [UnitName] + ' " href="javascript:EditRecord(''' 
		     + cast(IDs as  varchar(10)) + @PS + [UnitCode] + ''')" >'  +  @imgEdit + '</a>'  as Edit	  
		 from [dbo].[EPA_ORG_Schools]
		 where  [Panel] = @Area  and [UnitCode] is  not null
		 order by RowNo
    else if @Code is null
	     select IDs, [UnitCode] as Code , [UnitName] as Name , Comments, [Active] as Active , Header, Area  as Supervisor, District , panel,[Type], TPA,PPA, Brief_Name  as BriefName 
	  from [dbo].[EPA_Org_Schools]
		 where IDs =@IDs

	else 
	  
	  begin try
		   begin tran
 				if exists (select * from  [dbo].[EPA_Org_Schools]   where   IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_Org_Schools]  where    IDs = @IDs  
					   else
						  update  [dbo].[EPA_Org_Schools] 
						  set [UnitCode] = @Code , [UnitName] = @Name, Comments = @comments , [Active] = @Active,  Header= @Header,Area=@AreaCode,District =@District,Panel = @Panel, TPA= @TPA, PPA = @PPA
						  ,lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where   IDs = @IDs
					end
 				else
					insert into   [dbo].[EPA_Org_Schools] 
					( [UnitCode], [UnitName], Comments,[Active],[Type], lu_date,lu_user,lu_function)
					values( @Code,@Name,@Comments,'1',@Area, getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]
 

