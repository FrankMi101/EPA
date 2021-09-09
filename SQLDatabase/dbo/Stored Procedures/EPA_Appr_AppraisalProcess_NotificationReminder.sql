


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 27, 2018 
-- Description:	get and update notification email content
-- ==================================================================================
          
-- Drop proc dbo.EPA_Appr_AppraisalProcess_NotificationReminder 'Save','mif','StrategySignOff','mif@tcdsb.org;frank_ml@hotmail.com'
CREATE Procedure [dbo].[EPA_Appr_AppraisalProcess_NotificationReminder] 
 	(
	  @UserID			varchar(30) ='EPAAdmin' 
 	)
AS
BEGIN 
	declare @currentSchoolyear varchar(8)
 
-- Step 1  Check ALP need reminder
	--  part 1 Appraisee has not sign off on Annual learning Plan
		select Employee_ID, UserID, Appraiser, ALP_Result,TeacherName,eMail,'Appraisee' as ToWho from  [dbo].[EPA_Appraisal_StaffListView]
		where School_year = @currentSchoolyear  and AppraisalPhase in ('E','NE1','NE2','NE3','NE4')  and Appraisal_Role ='Teacher'  and ALP_Result != 'Completed' and Appraisal_Status='Active'
			 and Employee_ID not in (select Employee_ID from  [dbo].[EPA_Appr_SignOff] where School_Year = @currentSchoolyear and ItemCode ='ALP95' and SignOff_Type ='Appraisee' and SignOff_Action ='Sign Off')

	--  part 1 Appraiser has not sign off on Annual learning Plan
		select Employee_ID, UserID, Appraiser, ALP_Result,TeacherName,
		[dbo].[EPA_getUserEmailbyID](UserID) as eMail,
		 'Appraiser' as ToWho from  [dbo].[EPA_Appraisal_StaffListView]
		where School_year = @currentSchoolyear  and AppraisalPhase in ('E','NE1','NE2','NE3','NE4')  and Appraisal_Role ='Teacher'  and ALP_Result != 'Completed' and Appraisal_Status='Active'
			  and Employee_ID not in (select Employee_ID from  [dbo].[EPA_Appr_SignOff] where School_Year = @currentSchoolyear and ItemCode ='ALP95' and SignOff_Type ='Appraiser' and SignOff_Action ='Sign Off')

-- Step 2  Check AGP need reminder
	--  part 1 Appraisee has not sign off on Annual learning Plan
		select Employee_ID, UserID, Appraiser, ALP_Result,TeacherName,eMail,'Appraisee' as ToWho from  [dbo].[EPA_Appraisal_StaffListView]
		where School_year = @currentSchoolyear  and AppraisalPhase in ('E','NE1','NE2','NE3','NE4')  and Appraisal_Role in ('Principal','VP')  and ALP_Result != 'Completed' and Appraisal_Status='Active'
			 and Employee_ID not in (select Employee_ID from  [dbo].[EPA_Appr_SignOff] where School_Year = @currentSchoolyear and ItemCode ='ALP95' and SignOff_Type ='Appraisee' and SignOff_Action ='Sign Off')

	--  part 1 Appraiser has not sign off on Annual learning Plan
		select Employee_ID, UserID, Appraiser, ALP_Result,TeacherName,
		[dbo].[EPA_getUserEmailbyID](UserID) as eMail,
		 'Appraiser' as ToWho from  [dbo].[EPA_Appraisal_StaffListView]
		where School_year = @currentSchoolyear  and AppraisalPhase in ('E','NE1','NE2','NE3','NE4')  and Appraisal_Role in ('Principal','VP')  and ALP_Result != 'Completed' and Appraisal_Status='Active'
			  and Employee_ID not in (select Employee_ID from  [dbo].[EPA_Appr_SignOff] where School_Year = @currentSchoolyear and ItemCode ='ALP95' and SignOff_Type ='Appraiser' and SignOff_Action ='Sign Off')
 
END

