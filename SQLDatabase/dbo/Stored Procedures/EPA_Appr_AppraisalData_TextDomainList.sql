
        


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 19, 2017 
-- Description:	get and ipdate appraisal Text content
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextDomainList]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
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
	@Value			varchar(1) = null   

	 
as

set nocount on 
 

 if @Value is null

	select top 1 Rate
	from  [dbo].[EPA_Appr_Comments_DomainCompetency] 
	where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID
else
   begin
		begin try
			if exists (select * from  [dbo].[EPA_Appr_Comments_DomainCompetency]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID=@DomainID and CompetencyID= @CompetencyID)			     
					  update  [dbo].[EPA_Appr_Comments_DomainCompetency]
					  set Rate = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
					  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID
 			else
				insert into   [dbo].[EPA_Appr_Comments_DomainCompetency]
				( School_Year,School_Code,EmployeeID,SessionID,ItemCode,DomainID,CompetencyID,Rate,lu_date,lu_user,lu_function)
				values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode, @DomainID, @CompetencyID, @Value, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end




