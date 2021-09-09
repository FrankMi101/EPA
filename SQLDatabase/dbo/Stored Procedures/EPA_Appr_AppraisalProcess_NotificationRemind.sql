





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 27, 2018 
-- Description:	remind ALP notification at first or second reminder day
-- ==================================================================================
          
-- Drop proc dbo.EPA_Appr_AppraisalProcess_NotificationReminder 'Save','mif','StrategySignOff','mif@tcdsb.org;frank_ml@hotmail.com'
CREATE Procedure [dbo].[EPA_Appr_AppraisalProcess_NotificationRemind] 
 
AS
BEGIN 
	declare @currentSchoolyear varchar(8) 

-- Step 1  Check ALP need reminder
 
 
	    declare @UnitCode varchar(8), @SchoolName varchar(250) 
		DECLARE Schools CURSOR 
		FOR select UnitCode, UnitName from EPA_Org_CompanyUnit  where Active ='1'

	 
		OPEN Schools
		   FETCH NEXT FROM Schools  INTO   @UnitCode , @SchoolName 
			WHILE  @@FETCH_STATUS = 0
				  begin	          
   					 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindCheck
 						 @UnitCode , @SchoolName,'ALP'
   					 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindCheck
 						 @UnitCode , @SchoolName,'TPA' 
   					 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindCheck
 						 @UnitCode , @SchoolName,'NTP' 
   					 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindCheck
 						 @UnitCode , @SchoolName,'LTO' 
   					 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindCheck
 						 @UnitCode , @SchoolName,'BPA'  --  business leadership Performance appraisal
   					 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindCheck
 						 @UnitCode , @SchoolName,'AGP' 
    				 EXEC dbo.EPA_Appr_AppraisalProcess_NotificationRemindCheck
 						 @UnitCode , @SchoolName,'PPA' 

 					 FETCH NEXT FROM Schools  INTO   @UnitCode , @SchoolName 
				  end
		CLOSE Schools
		DEALLOCATE Schools

 
  
 END  
 



