




  
 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 14, 2017 
-- Description:	get and update LTO Assignment 
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_LTOAssignment]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@Code			varchar(10)= null,  
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@StartDate		varchar(10) = null,   
	@EndDate		varchar(10) = null,   
	@Month			varchar(10) = null,   
	@Subject		varchar(10) = null 

as 
 

 if @StartDate is null
	begin
	    if not exists ( select * from [dbo].[EPA_Appr_Assignment] where School_Year = @SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @Code and Category =@Category )
		    insert into [dbo].[EPA_Appr_Assignment]
			( School_Year,School_Code,EmployeeID,SessionID,ItemCode, Assignment,  Category,  [Start_Date],End_Date,LengthMonth,lu_date,lu_user,lu_function) 	
			select  @SchoolYear ,@SchoolCode , @EmployeeID, @SessionID,@Code, Assignment, @Category , StartDate, enddate,  [dbo].[DateMCount](StartDate,enddate) , getdate(), @UserID, app_name() 
		    from [dbo].[EPA_Appr_EmployeeList]   
			where Appraisal_year = @SchoolYear  and Unit_ID = @SchoolCode and  Employee_ID = @EmployeeID 
 
  --select * from    delete [dbo].[EPA_Appr_Assignment] where EmployeeID ='00039524' and school_year ='20192020' and School_Code ='0528'
  --select * from  [dbo].[EPA_Appr_EmployeeList]  where Employee_ID ='00039524' and Appraisal_year ='20192020' and Unit_ID ='0528'

 		select top 1 EmployeeID, [dbo].[DateF]([Start_Date],'YYYYMMDD') as  StartDate,[dbo].[DateF]([End_Date],'YYYYMMDD') as EndDate, LengthMonth , Assignment, EmployeeID  as SAPNo
			from  [dbo].[EPA_Appr_Assignment]
			where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @Code and Category =@Category
 	end
else
   begin
		begin try
	  
			if exists (select * from  [dbo].[EPA_Appr_Assignment]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = @Code and Category =@Category )
 				 begin     
					update  [dbo].[EPA_Appr_Assignment] set [Start_Date]  = @StartDate,  [End_Date]  = @EndDate, LengthMonth  = @Month,  Assignment = @Subject,   lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
					where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @Code and Category =@Category 
					-- LTO start date and end date change need update the appraisal employee list
					update  [dbo].[EPA_Appr_EmployeeList]  set StartDate  = @StartDate,  EndDate = @EndDate, Assignment =  @Subject,  lu_date =getdate(), lu_user = @UserID, lu_function = app_name()
					where Appraisal_year = @SchoolYear and Unit_ID = @SchoolCode   and Employee_ID = @EmployeeID and   Appraisal_type =@Category 
 
				 end
			else
			  insert into [dbo].[EPA_Appr_Assignment]
				( School_Year,School_Code,EmployeeID,SessionID,ItemCode, Assignment, Category, [Start_Date],End_Date,LengthMonth,lu_date,lu_user,lu_function) 
				 values (@SchoolYear ,@SchoolCode , @EmployeeID,@SessionID,@Code, @Subject, @Category, @StartDate, @EndDate, @Month, getdate(), @UserID, app_name()) 

			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end

   

