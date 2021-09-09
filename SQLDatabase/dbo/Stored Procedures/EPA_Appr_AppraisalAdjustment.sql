










-- ==================================================================================
-- Author		: Frank Mi
-- Create date	: January 27, 2021
-- Description	: Appraisal adjustment by Admin User
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalAdjustment]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@EmployeeID		varchar(20)= null,
	@Category		varchar(20)= null,
	@ItemCode		varchar(10)= null,  
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@SessionID		varchar(20)= null,  
 	@SchoolYearTo		varchar(8)= null,  
	@SchoolCodeTo		varchar(8)= null,  
	@SessionIDTo		varchar(20)= null 


	 
as

set nocount on 
  
 declare @EmployeeName varchar(50), @AppraiserName varchar(50)
 select top 1 @EmployeeName = [dbo].[EPA_getUserNamebyID]( Employee_ID), @AppraiserName = [dbo].[EPA_getUserNamebyID](Appraiser)
 from [dbo].[EPA_Appraisal_StaffListView] where School_Year = @SchoolYear and School_Code = @SchoolCode and Employee_ID = @EmployeeID

   begin
		begin try
		   begin tran

				if @Operate = 'Remove' 
					begin
						delete   [dbo].[EPA_Appr_Comments]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode
 
 						delete  [dbo].[EPA_Appr_Comments_small]  
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete  [dbo].[EPA_Appr_Comments_Observation] 
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = 'OBS'

						delete [dbo].[EPA_Appr_Comments_DomainCompetency]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete [dbo].[EPA_Appr_Rating]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

 						delete    [dbo].[EPA_Appr_SignOff]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete [dbo].[EPA_Appr_Strategy]	
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and left(ItemCode,3) = @ItemCode
						
					end
				if @Operate = 'SignOff' 
					begin
						delete [dbo].[EPA_Appr_SignOff]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						insert into  [dbo].[EPA_Appr_SignOff]
						values (@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,@Category,'Appraisee','Sign Off', getdate(),@EmployeeName,null,'EPAAdmin',getdate(),@UserID)
						insert into  [dbo].[EPA_Appr_SignOff]
						values (@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@ItemCode,@Category,'Appraiser','Sign Off', getdate(),@AppraiserName,null,'EPAAdmin',getdate(),@UserID)
					end
				if @Operate = 'CopyTo' 
					begin
						delete   [dbo].[EPA_Appr_Comments]
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode
 
 						delete  [dbo].[EPA_Appr_Comments_small]  
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete  [dbo].[EPA_Appr_Comments_Observation] 
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = 'OBS'

						delete [dbo].[EPA_Appr_Comments_DomainCompetency]
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete [dbo].[EPA_Appr_Rating]
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

 					--	delete    [dbo].[EPA_Appr_SignOff]
						--where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete [dbo].[EPA_Appr_Strategy]	
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and left(ItemCode,3) = @ItemCode


						insert into [dbo].[EPA_Appr_Comments] 
						select @SchoolYearTo, @SchoolCodeTo, EmployeeID, @SessionIDTo, ItemCode,Category,Appraisal_Note,'EPAAdmin',getdate(),@UserID 
						from  [dbo].[EPA_Appr_Comments]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID  and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode
 
 						insert into  [dbo].[EPA_Appr_Comments_small]  
						select @SchoolYearTo, @SchoolCodeTo, EmployeeID, @SessionIDTo, ItemCode,Category,Appraisal_Note, Appraisal_chose, Appraisal_Date,'EPAAdmin',getdate(),@UserID 
						from  [dbo].[EPA_Appr_Comments_small]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID  and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						insert into  [dbo].[EPA_Appr_Comments_Observation] 
						select @SchoolYearTo, @SchoolCodeTo, EmployeeID, @SessionIDTo, ItemCode,Category, Observation_Date, Observation_Note,'EPAAdmin',getdate(),@UserID
						from    [dbo].[EPA_Appr_Comments_Observation] 
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID  and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = 'OBS'

						insert into [dbo].[EPA_Appr_Comments_DomainCompetency]
						select @SchoolYearTo, @SchoolCodeTo, EmployeeID, @SessionIDTo, ItemCode, DomainID,CompetencyID, Category, Rate,Appraisal_Note,'EPAAdmin',getdate(),@UserID
						from [dbo].[EPA_Appr_Comments_DomainCompetency]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID  and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						insert into [dbo].[EPA_Appr_Rating]
						select @SchoolYearTo, @SchoolCodeTo, EmployeeID, @SessionIDTo, ItemCode,  Category, Appraisal_Note, Appraisal_chose, Appraisal_Date,'EPAAdmin', getdate(),@UserID
						from  [dbo].[EPA_Appr_Rating]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID  and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode
 
						insert into [dbo].[EPA_Appr_Strategy]	
						select @SchoolYearTo, @SchoolCodeTo, EmployeeID, @SessionIDTo, ItemCode,  Goal, Strategy, Principal_Initail,'EPAAdmin',getdate(),@UserID
						from [dbo].[EPA_Appr_Strategy]
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID  and EmployeeID = @EmployeeID  and left(ItemCode,3) = @ItemCode
					end
				if @Operate = 'MoveTo' 
					begin
						delete   [dbo].[EPA_Appr_Comments]
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode
 
 						delete  [dbo].[EPA_Appr_Comments_small]  
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete  [dbo].[EPA_Appr_Comments_Observation] 
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = 'OBS'

						delete [dbo].[EPA_Appr_Comments_DomainCompetency]
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete [dbo].[EPA_Appr_Rating]
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

 					 	delete    [dbo].[EPA_Appr_SignOff]
						 where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and Category = @Category and left(ItemCode,3) = @ItemCode

						delete [dbo].[EPA_Appr_Strategy]	
						where School_Year =@SchoolYearTo and School_Code = @SchoolCodeTo and SessionID = @SessionIDTo and EmployeeID = @EmployeeID  and left(ItemCode,3) = @ItemCode	
						
						update   [dbo].[EPA_Appr_Comments] set  School_Year =@SchoolYearTo , School_Code = @SchoolCodeTo,  SessionID  = @SessionIDTo, lu_date =getdate(),lu_user = @UserID, lu_function ='EPAAdmin'
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID  = @SessionID and EmployeeID = @EmployeeID and Category = @Category and left(ItemCode,3) = @ItemCode


						update   [dbo].[EPA_Appr_Comments_small]   set  School_Year =@SchoolYearTo , School_Code = @SchoolCodeTo,  SessionID  = @SessionIDTo, lu_date =getdate(),lu_user = @UserID, lu_function ='EPAAdmin'
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID  = @SessionID and EmployeeID = @EmployeeID and Category = @Category and left(ItemCode,3) = @ItemCode

						update   [dbo].[EPA_Appr_Comments_DomainCompetency] set  School_Year =@SchoolYearTo , School_Code = @SchoolCodeTo,  SessionID  = @SessionIDTo, lu_date =getdate(),lu_user = @UserID, lu_function ='EPAAdmin'
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID  = @SessionID and EmployeeID = @EmployeeID and Category = @Category and left(ItemCode,3) = @ItemCode

						update  [dbo].[EPA_Appr_Rating] set  School_Year =@SchoolYearTo , School_Code = @SchoolCodeTo,  SessionID  = @SessionIDTo, lu_date =getdate(),lu_user = @UserID, lu_function ='EPAAdmin'
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID  = @SessionID and EmployeeID = @EmployeeID and Category = @Category and left(ItemCode,3) = @ItemCode

						update   [dbo].[EPA_Appr_SignOff] set  School_Year =@SchoolYearTo , School_Code = @SchoolCodeTo,  SessionID  = @SessionIDTo, lu_date =getdate(),lu_user = @UserID, lu_function ='EPAAdmin'
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID  = @SessionID and EmployeeID = @EmployeeID and Category = @Category and left(ItemCode,3) = @ItemCode

						update   [dbo].[EPA_Appr_Strategy] set  School_Year =@SchoolYearTo , School_Code = @SchoolCodeTo,  SessionID  = @SessionIDTo, lu_date =getdate(),lu_user = @UserID, lu_function ='EPAAdmin'
						where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID  = @SessionID and EmployeeID = @EmployeeID and  left(ItemCode,3) = @ItemCode
 
					end
	 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
  end
   







