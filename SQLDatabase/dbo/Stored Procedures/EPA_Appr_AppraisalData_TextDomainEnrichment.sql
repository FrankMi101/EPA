


       


 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 14, 2018 
-- Description:	get and update Enrichment appraisal domain competency content
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextDomainEnrichment]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,  
	@DomainID		varchar(10)= null,  
	@CompetencyID	varchar(10)= null,  
	@ActionItem		varchar(20)= null,  
	@Value			varchar(1000) = null   

	 
as 

set nocount on 
  
 if @Value is null

	select top 1  Appraisal_Note  
	from  [dbo].[EPA_Appr_Enrichment_DomainCompetency]
	where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID and ActionItem = @ActionItem
else
   begin
		begin try
			if exists (select *  from  [dbo].[EPA_Appr_Enrichment_DomainCompetency]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID and ActionItem = @ActionItem)
				  update  [dbo].[EPA_Appr_Enrichment_DomainCompetency]
				  set Appraisal_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
				  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID and ActionItem = @ActionItem
 			else
				insert into   [dbo].[EPA_Appr_Enrichment_DomainCompetency]
				( School_Year,School_Code,EmployeeID,SessionID,ItemCode,DomainID,CompetencyID, ActionItem , Appraisal_Note,lu_date,lu_user,lu_function)
				values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @DomainID, @CompetencyID,  @ActionItem, @Value, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end






