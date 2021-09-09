








-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 7, 2018 
-- Description:	get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc  dbo.EPA_Org_StaffProfileEdit 'Get','','mif','00010421','0527','0529','00040314','' 
CREATE Procedure [dbo].[EPA_ORG_StaffProfileEdit]
 	(	@Operate		varchar(30) = 'Update',
	    @IDs			varchar(10) =null,
		@UserID			varchar(30) = null,
		@EmployeeID		varchar(15) = null,
		@UnitID			varchar(8) = null, 
  		@FirstName		varchar(30) = null,
		@LastName		varchar(30) = null,
		@Gender			varchar(10) = null, 
		@Email			varchar(30) = null, 
		@EmployeeStatus	varchar(10) = null, 
		@EmployeePosition	varchar(150) = null,   
		@PositionType	varchar(30) = null,   
		@TimeType		varchar(10) = null, 
		@StartDate		varchar(10) = null, 
		@EndDate		varchar(10) = null, 
		@Assignment		varchar(100) = null, 
		@Comments		varchar(250) = null  
		 
	)
AS
BEGIN   
  set nocount on
  
  if @Operate ='Get'
       select IDs,UserID, Employee_ID as EmployeeID,	FirstName ,LastName, isnull(email,'') as Email, isnull(Employee_Status,'') as EmployeeStatus, Gender,  isnull(Employee_Position,'') as EmployeePosition,  isnull(Position_Type,'') as PositionType, isnull(TimeType,'') as TimeType, 
	   dbo.DateF(Start_date,'YYYYMMDD') as StartDate,
	    dbo.DateF(End_date,'YYYYMMDD') as EndDate,
	   isnull( Assignment,'') as Assignment, 	
	   isnull( Comments,'') as Comments,Unit_ID as UnitID,
	     dbo.EPA_IsInAppraisalListYear(Employee_ID)   as IsInAppraisalList  
       from  dbo.EPA_Org_EmployeeList
	   where  Employee_ID =    @EmployeeID --IDs = @IDs --
  else  
	  begin
		   begin try
			   begin tran
			        if @Operate ='AddToApprList'
						begin 
							declare @currentSchoolYear varchar(8)
							set @currentSchoolYear = [dbo].[EPA_CurrentSchoolYear](8,20)
							if not exists (select * from [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @currentSchoolYear and Employee_ID = @EmployeeID)
								insert into [dbo].[EPA_Appr_EmployeeList]
								(UserID,Appraisal_year,Unit_ID,Employee_ID,Assignment,TimeType,Appraisal_Status,Appraisal_Role,Appraisal_type,Appraisal_Cycle,EvidenceLevel,Appraiser)

								select UserID, @currentSchoolYear,Unit_ID,Employee_ID, Assignment,TimeType, Employee_Status, 
								dbo.EPA_getAppraisalRole(Employee_ID) as Appraisal_Role,
					 			Case Position_Type when 'Teacher' then 'TPA' else 'PPA' end,
								Case Position_Type when 'Teacher' then 'TPA' else 'NE0' end,
								Case Position_Type when 'Teacher' then '16' else '0' end,  
								dbo.EPA_getAppraiserByPostion(Unit_ID,Position_Type)
								from  dbo.EPA_Org_EmployeeList   where IDs = @IDs 
						end

					else if exists (select * from dbo.EPA_Org_EmployeeList   where IDs = @IDs)
						update dbo.EPA_Org_EmployeeList
						set UserID = @UserID, FirstName = @FirstName,LastName=@LastName,  Employee_Status=@EmployeeStatus, Gender =@Gender, email=@email, 
						Employee_Position=@EmployeePosition, Position_Type =@PositionType, TimeType=@TimeType, 
						Start_date=dbo.DateFC(@StartDate,'YYYYMMDD'),End_date=dbo.DateFC(@EndDate,'YYYYMMDD'), Unit_ID=@UnitID,
						Assignment=@Assignment, Comments =@Comments 
						where IDs = @IDs -- Employee_ID = @EmployeeID
					else
						Insert into dbo.EPA_Org_EmployeeList
						 (UserID,LastName, FirstName, Employee_Status, Gender, email, Employee_Position, Position_Type, TimeType, Start_date,End_date, Unit_ID,Assignment,Comments)
						values(@UserID,@LastName,@FirstName,@EmployeeStatus,@Gender,@Email,@EmployeePosition,@PositionType, @TimeType,
						dbo.DateFC(@StartDate,'YYYYMMDD') , dbo.DateFC(@EndDate,'YYYYMMDD')  ,@UnitID,@Assignment,@Comments)

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






