
 
         
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 17, 2019
-- Description:	get and update Appraisal Area
-- ==================================================================================
  
CREATE proc [dbo].[EPA_Org_AppStatementManage]     
	@Operate		varchar(30),
	@UserID			varchar(30), 
	@SchoolYear     varchar(8) ,
	@SchoolCode		varchar(8) = null,
	@IDs			varchar(10) = null,
	@No				varchar(10) = null,
	@Category		varchar(10) = null,
	@Area			varchar(10) =null,
	@Subject		varchar(250) =null,
	@Statements		varchar(1000) =null,
	@Publisher		varchar(50) = null,
	@StartDate		SmallDatetime = null,
	@EndDate		SmallDatetime = null,
	@Active			int = null


as
 

set nocount on 
 begin
   
     if @Operate ='Get'
	     begin
			 if @IDs = '0'
				 select top 1 IDs, [No],SchoolYear,SchoolCode,[Category],[Area], [Subject], Statements, Active, StartDate,EndDate,Publisher
				 from  [dbo].[EPA_Org_Statements]
				 Where  SchoolYear = @SchoolYear and SchoolCode = @SchoolCode 
				 order by No DESC

			 else
				 select IDs, [No],SchoolYear,SchoolCode,[Category],[Area], [Subject], Statements, Active, StartDate,EndDate,Publisher
				 from  [dbo].[EPA_Org_Statements]
				 Where  SchoolYear = @SchoolYear and SchoolCode = @SchoolCode  and [No] = @No -- IDs = @IDs
		end
    else
		  begin try
			   begin tran
			       if exists(select * from [dbo].[EPA_Org_Statements] where IDs = @IDs)
				      begin
						if @Operate ='Delete'
							delete  [dbo].[EPA_Org_Statements]  where    IDs = @IDs  
						else if @Operate ='Update'
 							 update [dbo].[EPA_Org_Statements] 
							 set [Category] = @Category , [Area] = @Area,  [Subject] = @Subject ,Statements = @Statements , StartDate = @StartDate, EndDate = @EndDate,  Active = @Active,
								  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
							 where   IDs = @IDs
					  end 
 				   else if @Operate ='Insert'
						insert into   [dbo].[EPA_Org_Statements] 
						( [No],SchoolYear,SchoolCode,[Category],[Area], [Subject], Statements, Active, StartDate,EndDate,Publisher, lu_date,lu_user,lu_function) 
						values( @No, @SchoolYear, @SchoolCode,@Category,@Area,@Subject, @Statements,@Active, @StartDate,@EndDate,@Publisher, getdate(),@UserID, app_name())
	 
			   commit tran	
					Select 'Successfully' as rValue
		   end try
		   begin catch
			   Rollback tran
			   Select 'Failed' as rValue		
		   end catch

 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]









