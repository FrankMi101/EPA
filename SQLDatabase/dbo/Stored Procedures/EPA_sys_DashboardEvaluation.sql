﻿
 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 05, 2017 
-- Description:	get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc  dbo.EPA_sys_DashboardALP 'Admin','mif','20172018','0529','Teacher','' 
CREATE Procedure [dbo].[EPA_sys_DashboardEvaluation]
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser',
		@SchoolYear		varchar(8) = null,
		@SchoolCode		varchar(8) = null 
	)
AS
BEGIN   
  set nocount on
        select AppraisalPhase as ALPStatus ,1 as  TeacherName
        from  dbo.EPA_Appraisal_StaffListView  
--		where AppraisalPhase not in ('NTP','LTO') and school_year = '20172018' and school_code = '0529'   
 		where  school_year = @SchoolYear and school_code = @SchoolCode   
		order by ALPStatus
    
 
 END
  






