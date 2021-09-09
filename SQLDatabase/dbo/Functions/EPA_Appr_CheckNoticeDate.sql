
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: May 09, 2018 
-- Description: check notification did
-- ==================================================================================
 
 
CREATE function [dbo].[EPA_Appr_CheckNoticeDate]  -- 'Appraiser','mif','20172018','0529','00014245','Appraisal1','SUM','Admin'
(	@NoticeRole		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@NoticeType		varchar(30)= null, 
	@NoticeArea		varchar(20)= null  
	)

RETURNS varchar(10)
AS 
  BEGIN
		declare @rValue varchar(10)
 		 if exists (select * from  [dbo].[EPA_Appr_Notification] where school_year = @SchoolYear and school_code =@SchoolCode and SessionID = @SessionID and EmployeeID =  @EmployeeID and NoticeType =@NoticeType and AppraisalArea =@NoticeArea and NoticeRole = @NoticeRole  )
		  	set @rValue = ( select top 1 [dbo].[DateF](NoticeDate,'YYYYMMDD')
							from [dbo].[EPA_Appr_Notification] where school_year = @SchoolYear and school_code =@SchoolCode and SessionID = @SessionID and EmployeeID =  @EmployeeID and NoticeType =@NoticeType and AppraisalArea =@NoticeArea and NoticeRole = @NoticeRole  )
		 else
			 set @rValue =''  
	 
		RETURN(@rValue)
 END
  