







 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 27, 2017 
-- Description:	get and update observation date and comments
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_ObservationList] --   '0','mif','20172018','0549','00010452','Session1','NTP','OBS','OBS32' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null, 
	@DomainID		varchar(10) = null,
	@CompetencyID	varchar(10) = null, 
	@Check			varchar(10) = null,   
	@Value			varchar(250) = null   

	 
as

set nocount on 
 

 if @Operate ='Get' -- @DomainID is null
	begin
		declare @CompetncyTable as table
		(DomainID  int,
		 CompetencyID int, 
		CompetencyName varchar(250),
		SelectedC	   varchar(1),
		Comments	   varchar(250),
		RowNo			varchar(2)
		)
		if @Category ='NTP'
			insert into  @CompetncyTable
			select Appraisal_Domain , '0' as Appraisal_Competency, Appraisal_DomainName as Competency, 0 as SelectC,'' as Comments ,''
			from [dbo].[EPA_sys_appraisalDomain]
			where Appraisal_Code = 'TPA' and Appraisal_Domain  < 4 --@Category
			union 
			select Appraisal_Domain,Appraisal_Competency, space(6) + Appraisal_CompetencyName as Competency,
			[dbo].[EPA_appr_AppraisalObservationSelected](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,Appraisal_Domain,Appraisal_Competency) as SelectC,
			[dbo].[EPA_appr_AppraisalObservationNotes](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,Appraisal_Domain,Appraisal_Competency) as Comments,
			cast(Appraisal_Competency as char(2))
			from 	[dbo].[EPA_sys_appraisalDomainCompetency]
			where Appraisal_Code = 'EPA' and Evidence_Level ='8' -- @Category
			order by Appraisal_Domain, Appraisal_Competency
		 

		else
			insert into  @CompetncyTable
			select Appraisal_Domain , '0' as Appraisal_Competency, Appraisal_DomainName as Competency, 0 as SelectC,'' as Comments,''
			from [dbo].[EPA_sys_appraisalDomain]
			where Appraisal_Code = 'TPA' --@Category
			union 
			select Appraisal_Domain,Appraisal_Competency, space(6) + Appraisal_CompetencyName as Competency,
			[dbo].[EPA_appr_AppraisalObservationSelected](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,Appraisal_Domain,Appraisal_Competency) as SelectC,
			[dbo].[EPA_appr_AppraisalObservationNotes](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,Appraisal_Domain,Appraisal_Competency) as Comments
			,cast(Appraisal_Competency as char(2))
			from 	[dbo].[EPA_sys_appraisalDomainCompetency]
			where Appraisal_Code = 'EPA' -- @Category
			order by Appraisal_Domain, Appraisal_Competency
 

		select DomainID ,CompetencyID,CompetencyName,
		  case isnull(SelectedC,'0') when '1' then 'true' else 'false' end as SelectedC,
		  Comments,RowNo
	  	-- ROW_NUMBER() OVER(ORDER BY DomainID, CompetencyID ) AS RowNo 
		from @CompetncyTable
		order by DomainID , CompetencyID, RowNo

	end
else
   begin
		begin try
			if exists (select * from [dbo].[EPA_Appr_Comments_ObservationOnCompetency] --where employeeid ='00010452'
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID )
				  begin
				      if @Operate ='Check'
 						  update  [dbo].[EPA_Appr_Comments_ObservationOnCompetency]
						  set [Observation_check]  = @Check,  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID
					  else
						  update  [dbo].[EPA_Appr_Comments_ObservationOnCompetency]
						  set  Observation_Note = @Value, lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
						  where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and DomainID = @DomainID and CompetencyID = @CompetencyID
						
				  end
			else
				insert into   [dbo].[EPA_Appr_Comments_ObservationOnCompetency]
				( School_Year,School_Code,EmployeeID,SessionID,ItemCode,DomainID,CompetencyID,[Observation_Check], Observation_Note,lu_date,lu_user,lu_function)
				values(@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@ItemCode,@DomainID,@CompetencyID, @Check, @Value, getdate(),@UserID, app_name())

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end






