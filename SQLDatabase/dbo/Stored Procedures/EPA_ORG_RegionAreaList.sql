





 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 16, 2018
-- Description:	get and update RegionArea
-- ==================================================================================
 
CREATE proc [dbo].[EPA_ORG_RegionAreaList]   --    'Date','mif','20172018','0529','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null,
	@Area			varchar(20)= null,
	@IDs			varchar(10) = null,
	@Code			varchar(20) = null,
	@Name			varchar(100) =null,
	@Comments		varchar(250) =null,
	@Active			int = null,
	@District		varchar(30) =null,
	@SuperID		varchar(30) =null,
	@Officer		varchar(30) =null 

as

set nocount on 
 begin

	if @IDs is null
		begin
			declare @PS   varchar(7), @imgA varchar(200)
			set @imgA =  dbo.EPA_getImageIcon('Delete') -- '<img border="0" width="25" height="25" src="../images/close.ico" />'
			set @PS = ''',''' 
			 select IDs, [AreaCode] as Code , [AreaName] as NameText, Comments, [Active] as Active , District,SuperID as Supervisor,Officer,
		 		 ROW_NUMBER() OVER(ORDER BY IDs ) AS RowNo,
				 '<a title="click on button to delete this record of ' + [AreaName] + ' " href="javascript:DeleteRecord(''' 
				 + cast(IDs as  varchar(10)) + @PS + [AreaCode] + ''')" >'  +  @imgA + '</a>'  as [Action],
				 '<a href="#"> ' + dbo.EPA_getImageIcon('Save') + '  </a>' as ActionS
 
			 from [dbo].[EPA_Org_RegionArea]
			 where [AreaCode] is  not null
			 order by RowNo
		 end
    else
	  begin try
		   begin tran
 				if exists (select * from [dbo].[EPA_Org_RegionArea]   where   IDs = @IDs )
				   begin
				       if @Operate ='Delete'
							delete  [dbo].[EPA_Org_RegionArea]  where    IDs = @IDs  
					   else
						  update  [dbo].[EPA_Org_RegionArea] 
						  set [AreaCode] = @Code , [AreaName] = @Name, Comments = @comments , [Active] = @Active, District = @District,SuperID=@SuperID,Officer=@Officer,
						  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where   IDs = @IDs
					end
 				else
					insert into   [dbo].[EPA_Org_RegionArea] 
					( [AreaCode], [AreaName], Comments,[Active], lu_date,lu_user,lu_function)
					values( @Code,@Name,@Comments,'1', getdate(),@UserID, app_name())
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]




