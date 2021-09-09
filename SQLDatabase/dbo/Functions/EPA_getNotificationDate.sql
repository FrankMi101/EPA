



CREATE FUNCTION [dbo].[EPA_getNotificationDate]
(@AppraisalYear		varchar(8),
 @AppraisalSchool	varchar(8),
 @EmployeeID		varchar(10),
 @SessionID			varchar(15),
 @NoticeType		varchar(20),
 @NoticeArea		varchar(10),
 @NoticeRole		varchar(15),
 @DateType			varchar(10) 
 )

RETURNS varchar(15)
AS 
  BEGIN

		declare @rValue varchar(15)  
		if exists (select * from  [dbo].[EPA_Appr_Notification] 
					where School_Year = @AppraisalYear  and School_Code  =  @AppraisalSchool and EmployeeID = @EmployeeID  and (SessionID = @SessionID or SessionID ='')  and NoticeType = @NoticeType and AppraisalArea =@NoticeArea and NoticeRole = @NoticeRole)
           set @rValue = (	select top 1  case @DateType when 'NoticeDate' then	dbo.DateF( NoticeDate,'YYYYMMDD')
										else  dbo.DateF( DeadlineDate,'YYYYMMDD')  end
							from  [dbo].[EPA_Appr_Notification] 
							where School_Year = @AppraisalYear  and School_Code  =  @AppraisalSchool and EmployeeID = @EmployeeID and (SessionID = @SessionID or SessionID ='') and NoticeType = @NoticeType and AppraisalArea =@NoticeArea and NoticeRole = @NoticeRole
							order by NoticeDate DESC  )
		else
			set @rValue =''
  set @rValue =  isnull(@rValue,'') 
	   
	return @rValue
END  


