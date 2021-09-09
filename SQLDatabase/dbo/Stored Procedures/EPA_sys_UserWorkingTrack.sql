





 
 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	tracking Login User activities and get user last action information
-- ==================================================================================
 --  'AppraisalArea','mif','HistoryList'
 
CREATE proc [dbo].[EPA_sys_UserWorkingTrack]
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Value 			varchar(50) = null, -- could be user role
	@MachinName		varchar(30) = null,
	@ScreenSize		varchar(30) = null,
	@BrowerType		varchar(30) = null,
	@BrowerVersion	varchar(30) = null 
as

set nocount on

if @Value is null
   begin
		if @Operate = 'LastValue'
		   	select   Working_EmployeeID, Working_Year, Working_Unit, Working_SessionID,Working_Date, Appraisal_Category,Appraisal_Area,Appraisal_Item, Content_Page, UserRole, UserID
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID
		else if @Operate ='WorkYear'
		   	select top 1  Working_Year 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	   
		else if @Operate ='OpenSchoolYear'
		   begin
		        declare @CurrentApprYear varchar(8), @CurrentSchoolYear varchar(8)
		        select top 1 @CurrentApprYear =  [dbo].[EPA_CurrentApprYear] (Working_Unit) , @CurrentSchoolYear = [dbo].[EPA_CurrentSchoolYear](8, 25)  from   [dbo].[EPA_sys_UsersActionTrack]  where UserID = @UserID 
				if @CurrentApprYear < @CurrentSchoolYear
				    select [dbo].[EPA_CurrentSchoolYearPreNext]('Previous', @CurrentApprYear)
                else 
				    select [dbo].[EPA_CurrentSchoolYearPreNext]('Previous', @CurrentSchoolYear )
            end
		else if @Operate ='WorkUnit'
		   	select top 1  Working_Unit 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	   
		else if @Operate ='WorkingUser'
		   	select top 1 Working_EmployeeID 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID
		else if @Operate ='WorkingAppr'
		   	select top 1 Working_Appr 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID
		else if @Operate ='WorkSession'
		   	select top 1  Working_SessionID 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID			   
 		else if @Operate ='ContentPage'
		   	select top 1  Content_Page 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID			   
 		else if @Operate ='AppraisalCategory'
		   	select top 1  Appraisal_Category 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
 		else if @Operate ='AppraisalArea'  
		   	select top 1  Appraisal_Area 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
 		else if @Operate ='AppraisalItem'
		   	select top 1  Appraisal_Item 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
			
 		else if @Operate ='AppraisalItemName'
		   	select top 1  dbo.EPA_getAppraisalItemName(Appraisal_Category, Appraisal_Area, Appraisal_Item) 
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
 		else if @Operate ='EmployeeName'
		   	select top 1  dbo.EPA_getUserNamebyID( Working_EmployeeID)  
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
 		else if @Operate ='WorkingListName'
		   	select top 1  dbo.EPA_getAppraisalItemName(Appraisal_Category, Appraisal_Area, Appraisal_Item)  
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID	
 		else if @Operate ='WorkingListAreaName'
		   	select top 1  dbo.EPA_getAppraisalItemName(Appraisal_Category, Appraisal_Area, Appraisal_Item)  
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID		
		else if @Operate ='SchoolName'
		   	select top 1   dbo.EPA_getSchoolName( Working_Unit,'Name' )
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID														
		else if @Operate ='SchoolArea'
		    select [dbo].[EPA_getSchoolArea_byUserID](@UserID, 'Unknow')
 		
		else if @Operate ='ClientScreen'
		   	select top 1 ScreenSize
			from [dbo].[EPA_sys_UsersActionTrack]
			where UserID = @UserID		
 						   
   end
else
   begin
	    begin try
			if @Operate ='LastValue'
			   begin
					if exists (select * from [dbo].[EPA_sys_UsersActionTrack] where UserID = @UserID)
							update [dbo].[EPA_sys_UsersActionTrack]
							set  UserRole = @Value, Server_Name = @MachinName, ScreenSize = @ScreenSize, Browser_Type = @BrowerType, Browser_Version = @BrowerVersion,Login_Time = getdate(), lu_date =getdate()
							where UserID = @UserID
					else
					   begin
						   declare @schoolYear varchar(8), @schoolCode varchar(8), @session varchar(20), @userRole varchar(20), @employeeID varchar(10)
						   select top 1    @schoolYear = Appraisal_year, @schoolCode = Unit_ID, @session ='Appraisal 0', @userRole = Appraisal_Role,  @employeeID = Employee_ID
						   from dbo.EPA_appr_EmployeeList   
						   where UserID = @UserID   order by Appraisal_year DESC
						   insert into [dbo].[EPA_sys_UsersActionTrack]
								(UserID, UserRole, Working_EmployeeID, Working_Year, Working_Unit, Working_SessionID,   Working_Date, Appraisal_Category,Appraisal_Area,Appraisal_Item, Content_Page, Server_Name,ScreenSize,Browser_Type,Browser_Version,Login_Time,LogOn,lu_date,lu_user,lu_function )
						   values(@UserID,@Value, @employeeID,@schoolYear,@schoolCode,@session,getdate(), '','', '','',@MachinName, @ScreenSize,@BrowerType,@BrowerVersion,getdate(),'Online',getdate(),@userID,app_name())	
					   end

					--select Working_UserID, Working_Year, Working_Unit, SessionID, Working_PageID, Working_ItemsID, Working_Date, UserRole
					--from [dbo].[EPA_sys_UsersActionTrack]
					--where UserID = @UserID
			   end
			if @Operate ='WorkYear'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Working_Year = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	   
			if @Operate ='WorkUnit'
				update [dbo].[EPA_sys_UsersActionTrack] set Working_Unit = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	   
			if @Operate ='WorkingUser'
				update [dbo].[EPA_sys_UsersActionTrack] set Working_EmployeeID = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID
			if @Operate ='WorkingAppr'
				update [dbo].[EPA_sys_UsersActionTrack] set Working_Appr = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID
			if @Operate ='WorkSession'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Working_SessionID = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID			   
 			if @Operate ='ContentPage'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Content_Page = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID			   
 			if @Operate ='AppraisalCategory'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Category = @Value,   Working_Appr = case @Value when 'PPA' then 'PPA' else 'TPA' end,  lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	
 			if @Operate ='AppraisalArea'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Area = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID	
 			if @Operate ='AppraisalItem'
		   		update [dbo].[EPA_sys_UsersActionTrack] set Appraisal_Item = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID		
			if @Operate ='ClientScreen'
		   		update [dbo].[EPA_sys_UsersActionTrack] set ScreenSize = @Value, lu_date =getdate(), lu_function =app_name(), lu_user = @UserID
				where UserID = @UserID		

			Select 'Successfully' as rValue
	   end try
       
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
	end	    
	 


