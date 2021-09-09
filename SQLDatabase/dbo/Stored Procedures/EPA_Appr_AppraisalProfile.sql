











 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	tracking Login User activities and get user last action information
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProfile]  -- 'mif','Role'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null, -- could be user role
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@Category		varchar(10) = null,
	@Value			varchar(50) = null 
as

set nocount on

if @Value is null
   begin
 
		if @Operate ='AssignmentLink'
		   	select top 1 UserID
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 
		if @Operate ='AppraiseeUserID'
		   	select top 1 UserID
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 
		if @Operate ='AppraiserID'
		   	select top 1   Appraiser
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 	 
		if @Operate ='AppraiserName'
		   	select top 1  [dbo].[EPA_getUserNamebyID](Appraiser)
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 				  
		if @Operate ='AppraiseeName'
	 		select top 1  [dbo].[EPA_getUserNamebyID](@EmployeeID)
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 		
		if @Operate ='ApraisalSchool'
	 		select top 1  Unit_ID
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 

		if @Operate ='ApraisalSchoolName'
	 		select top 1 [dbo].[EPA_getSchoolName]( Unit_ID,'Name')
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 

		if @Operate ='WorkingSession'
			select top 1  dbo.EPA_appr_CurrentAppraisalSession(Appraisal_year, Employee_ID,Unit_ID,Appraisal_Cycle,Appraisal_type)
			from [dbo].[EPA_Appr_EmployeeList]  
  			where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and  Employee_ID = @EmployeeID and Appraisal_type = @Category
 
 		if @Operate ='AppraisalPhase'
			select top 1  Appraisal_Cycle 
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 
		if @Operate ='AppraisalType'
			select top 1  Appraisal_type
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 
		 if @Operate ='CurrentStatus'
			select  top 1  Appraisal_Status
			from [dbo].[EPA_Appr_EmployeeList] 
			where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID 
		 if @Operate ='CurrentProfile'
		    begin
			   if exists (select * from  [dbo].[EPA_Appr_EmployeeList] 	where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID  and len(Appraiser) > 2)
					if exists (select * from  [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID  and Appraisal_Cycle in ('E','LTO','NTP','NE0','NE2','NE3','NE4'))
					    select 'Ready'
					else	
						select 'NotReady'
			   else
					select 'NotReady' 
		   end
 		if @Operate ='AppraisalCategory'
		   	select top 1  Appraisal_Category 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
 		if @Operate ='AppraisalArea'
		   	select top 1  Appraisal_Area 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
		
		if @Operate ='AppraiseeArea'
		   	select top 1  Appraisal_Area 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
 		if @Operate ='AppraisalItem'
		   	select top 1  Appraisal_Item 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
		if @Operate ='AppraiseeCode'
		   	select top 1  Appraisal_Item 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID		
			
		if @Operate ='LastAppraisalResult'	
		   select  top 1  Appraisaloutcome  	from 	[dbo].[EPA_Appraisal_StaffListView]		
		   where School_Year = @SchoolYear and Employee_ID =@EmployeeID			
		
		if @Operate ='preAppraisalCompleteStatus'
		  begin
		       declare @preYear varchar(8), @CompleteStatus  varchar(50), @appraisalCycle varchar(10)
			   set @preYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@SchoolYear)
			    select  top 1 @CompleteStatus = Appraisal_Result, @appraisalCycle = Appraisal_Cycle  from dbo.EPA_Appr_EmployeeList where  Appraisal_year = @preYear and Employee_ID = @EmployeeID
				if @appraisalCycle in ('E','NTP')
 				      set @CompleteStatus = case @CompleteStatus when 'SignOff Required' then 'InCompleted'
																 when 'Not Start' then 'InCompleted'
																 when 'Incpmplete' then 'InCompleted' 
																 else 'Completed' end
 				else
					set @CompleteStatus ='Completed' 
				select @CompleteStatus as rValue
 		  end
		if @Operate ='PreviousAppraisalYear'		 
			   select  [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@SchoolYear) as rValue
  		  
		if @Operate ='PreviousYearSessionID'
		  begin
		       declare @preYear2 varchar(8), @LastSessionID varchar(10)
			   set @preYear2 = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@SchoolYear)
			   set @LastSessionID = ( select top 1  SessionID from dbo.EPA_Appr_SignOff  
										where School_Year =  @preYear2  and EmployeeID = @EmployeeID and ItemCode ='SUM95' and SignOff_Action ='Sign Off'
										order by SessionID DESC )		    
				select @LastSessionID as rValue
 		  end
		if @Operate ='PreviousYearAreaCode'
		  begin
		       
				select   [dbo].[EPA_Appr_IncompleteWorkingArea](@SchoolYear,@SchoolCode, @EmployeeID) as rValue
 		  end	
 		if @Operate ='PreviousYearArea'
		  begin
		          
				select case  [dbo].[EPA_Appr_IncompleteWorkingArea](@SchoolYear,@SchoolCode, @EmployeeID) 
						when 'ALP' then 'Annual Learning Plan'
						when 'SUM' then 'Summative Report'
						when 'STR' then 'NTIP Individual NTIP Strategy'
						when 'IMP' then 'Improvement Plan'
						when 'ENR' then 'Enrichment Plan'
						else 'Appraisal Summary'  end as rValue
 		  end		 	 	   
   end
else
   begin
	    begin try
	 
			if @Operate ='WorkYear'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Working_Year = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	   
			if @Operate ='WorkUnit'
				update [dbo].[EPA_sys_UsersActionTrack] set Working_Unit = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	   
			if @Operate ='WorkUser'
				update [dbo].[EPA_sys_UsersActionTrack] set Working_EmployeeID = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID
			if @Operate ='WorkSession'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Working_SessionID = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID			   
 			if @Operate ='ContentPage'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Content_Page = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID			   
 			if @Operate ='AppraisalCategory'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Category = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	
 			if @Operate ='AppraisalType'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Category = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	
			if @Operate ='AppraisalArea'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Area = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	
 			if @Operate ='AppraisalPhase'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Phase = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID		
 			if @Operate ='AppraisalItem'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Item = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID		
			if @Operate ='AppraisalCode'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Item = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID		

			Select 'Successfully' as rValue
	   end try
       
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
	end	    



	--select * from [dbo].[EPA_sys_UsersActionTrack]










