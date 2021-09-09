
    


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 3, 2018 
-- Description:	get and  update appraisal samll Text content and list chose content
-- ==================================================================================
--  [dbo].[EPA_Appr_AppraisalData_Notes]     'Chose','mif','20172018','0529','00010558','Appraisal1','NTP','SUM','SUM41','110' 
CREATE proc [dbo].[EPA_Appr_AppraisalData_Notes]    
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,   
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(20)= null ,
	@ItemCode		varchar(10)= null,
	@Value			varchar(250) =null 

	 
as

set nocount on  
if @Value is null
   begin
       if  @Operate ='Rate'
			if exists(select * from [dbo].[EPA_Appr_Comments_small] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode and Category =@Category)
				select top 1 Appraisal_Rate
				from  [dbo].[EPA_Appr_Comments_small]  as A
				inner join [dbo].[EPA_sys_appraisalRating] as R on A.Appraisal_Chose = R.IDs  
				where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category
			else
				select ''
        if  @Operate ='Chose'
		    begin
				if @ItemCode ='STR95'
				    select  [dbo].[EPA_appr_checkCompleteTwoSatisfactory] (@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,@Category)
				else
					if exists(select * from  [dbo].[EPA_Appr_Comments_small] where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category =@Category)
						select top 1 Appraisal_Chose
						from  [dbo].[EPA_Appr_Comments_small]  
 						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category
					else 
					    select ''
			end
       if  @Operate ='Date'
	       if exists(select * from  [dbo].[EPA_Appr_Comments_small]  
 						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category =@Category) 
				select top 1 [dbo].[DateF](Appraisal_Date,'YYYYMMDD')
				from  [dbo].[EPA_Appr_Comments_small]  
 				where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category
			else
				select '' 
      if  @Operate ='Note'
			if exists(select * from  [dbo].[EPA_Appr_Comments_small]  
 					where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category =@Category )
				select top 1 Appraisal_Note
				from  [dbo].[EPA_Appr_Comments_small]  
 				where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category
			else
				select ''
	end
else
	begin
	   begin try
			if not exists(select * from  [dbo].[EPA_Appr_Comments_small]  
 				where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode  and Category =@Category )
				insert into [dbo].[EPA_Appr_Comments_small]
					( School_Year,School_Code,SessionID,EmployeeID,Category, ItemCode,lu_function,lu_date,lu_user)
 				values (@SchoolYear,@SchoolCode,@SessionID,@EmployeeID,@Category,@ItemCode,app_name(),getdate(),@UserID)
 
 			if  @Operate ='Rate'
					 update  [dbo].[EPA_Appr_Comments_small] set Appraisal_chose = @Value, lu_date =getdate(),lu_user =@UserID
 					 where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category
			if  @Operate ='Chose'
					 update  [dbo].[EPA_Appr_Comments_small] set Appraisal_chose = @Value, lu_date =getdate(),lu_user =@UserID
 					 where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category
			if  @Operate ='Date'
					 update  [dbo].[EPA_Appr_Comments_small] set Appraisal_date = @Value, lu_date =getdate(),lu_user =@UserID
 					 where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category
			if  @Operate ='Note'
					 update  [dbo].[EPA_Appr_Comments_small] set Appraisal_note = @Value, lu_date =getdate(),lu_user =@UserID
 					 where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID =@EmployeeID and ItemCode = @ItemCode   and Category =@Category

 			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
 	end
   



     


