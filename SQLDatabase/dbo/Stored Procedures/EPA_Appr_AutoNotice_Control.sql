

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: JUly 13, 2020 
-- Description:	auto email notification batch control this one should exec by a SQL job
-- ================================================================================== 
CREATE proc [dbo].[EPA_Appr_AutoNotice_Control] 
as 
set nocount on
-- Step 1  Check Annual Learning Plan once a week 
	EXEC dbo.EPA_Appr_AutoNotice_List 'ALP'
-- Step 2  Check appraisal once a week 
	EXEC dbo.EPA_Appr_AutoNotice_List 'EPA'
-- Step 3  Check classroom observation once a week 
	EXEC dbo.EPA_Appr_AutoNotice_List 'OBS'
-- Step 4  Check Sign off   once a week 
	EXEC dbo.EPA_Appr_AutoNotice_List 'SIG'

