
 



 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 20, 2020
-- Description:	check auto notice once a week 
-- ==================================================================================
  

CREATE FUNCTION [dbo].[EPA_checkNoticed]
(	@NoticeType			varchar(10),
	@AppraisalYear		varchar(8),
	@AppraisalSchool	varchar(8),
	@EmployeeID			varchar(10) 
 )

RETURNS varchar(20)
AS 
  BEGIN
		declare @rVal varchar(20)
   
     if exists (select * from [dbo].[EPA_Appr_Notification_AutoCheckTrace]
				where school_year = @AppraisalYear and School_code = @AppraisalSchool and Employee_id = @EmployeeID and NoticeType = @NoticeType
				and NoticeDate  + 7  >=  getdate()
				)
        set @rVal = 'Not'
	 else
		set @rVal = 'GoNotice'
 
	return @rVal
END  
  


 





