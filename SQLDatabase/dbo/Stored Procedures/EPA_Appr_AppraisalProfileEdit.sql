






-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 7, 2018 
-- Description:	get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc  dbo.EPA_Appr_EmployeeProfileEdit 'Status','mif','20172018','0529','','' 
CREATE Procedure [dbo].[EPA_Appr_AppraisalProfileEdit]
 	(	@Operate			varchar(30) = 'Update',
	    @IDs				varchar(10) =null,
		@UserID				varchar(30) = null,
		@EmployeeID			varchar(15) = null,
  		@AppraisalYear		varchar(8) = null,
		@UnitID				varchar(8) = null,
		@AppraisalStatus	varchar(10) = null, 
		@AppraisalType		varchar(10) = null, 
		@AppraisalCycle		varchar(10) = null, 
		@AppraisalRole		varchar(15) = null,   
		@EvidenceLevel		varchar(10) = null, 
		@Appraiser			varchar(30) = null, 
		@Mentor				varchar(30) = null, 
		@TimeType			varchar(10) = null, 
		@Assignment			varchar(100) = null, 
		@Comments			varchar(250) = null  
	 
	)
AS
BEGIN   
  set nocount on
  if @Operate ='Get'
       select  IDs,UserID, Employee_ID as EmployeeID, Appraisal_year as AppraisalYear,Unit_ID as UnitID, Appraisal_Status as AppraisalStatus, 
	   Appraisal_type as AppraisalType, Appraisal_Cycle as AppraisalCycle,Appraisal_Role as AppraisalRole, EvidenceLevel,TimeType,Appraiser,Mentor,Assignment,Comments
       from  [dbo].[EPA_Appr_EmployeeList] 
	   where  Employee_ID = @EmployeeID  and Appraisal_year = @AppraisalYear
 
  else
	  begin
		   begin try
			   begin tran
					 if @Operate ='Delete' 
						 begin
							insert into dbo.EPA_Appr_EmployeeList_Bak 
							select * from   dbo.EPA_Appr_EmployeeList where IDs = @IDs
							delete dbo.EPA_Appr_EmployeeList where IDs = @IDs 
						 end
					else if exists (select *  from dbo.EPA_Appr_EmployeeList   where  IDs = @IDs ) -- Employee_ID = @EmployeeID and Appraisal_year = @AppraisalYear )
						update dbo.EPA_Appr_EmployeeList
						set UserID = @UserID, Employee_ID=@EmployeeID, Unit_ID=@UnitID, Appraisal_Status=@AppraisalStatus, Appraisal_type=@AppraisalType, Appraisal_Cycle=@AppraisalCycle,Appraisal_Role=@AppraisalRole, 
						EvidenceLevel=@EvidenceLevel,Appraiser=@Appraiser, Mentor=@Mentor,Assignment=@Assignment,Comments=@Comments,TimeType=@TimeType,
						lu_date=getdate(), lu_function=app_name(), lu_user = @UserID
						where   IDs =@IDs  --  Employee_ID = @EmployeeID  and  Appraisal_year = @AppraisalYear 
					else
						Insert into dbo.EPA_Appr_EmployeeList
						 (UserID, Employee_ID, Appraisal_year,Unit_ID, Appraisal_Status, Appraisal_type, Appraisal_Cycle,Appraisal_Role, EvidenceLevel,Appraiser,Mentor,Assignment,Comments,TimeType)
						values(@UserID,@EmployeeID,@AppraisalYear,@UnitID,@AppraisalStatus,@AppraisalType,@AppraisalCycle,@AppraisalRole,@EvidenceLevel,@Appraiser,@Mentor,@Assignment,@Comments,@TimeType)

				commit tran	
					Select 'Successfully' as rValue
		   end try
		   begin catch
			   Rollback tran
			   Select 'Failed' as rValue		
		   end catch

	end

END

/*
	begin try
		   begin tran
			 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
*/









