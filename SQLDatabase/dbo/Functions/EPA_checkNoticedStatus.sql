

 



 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 20, 2020
-- Description:	check auto notice once a week 
-- ==================================================================================
  

CREATE FUNCTION [dbo].[EPA_checkNoticedStatus]
(	@NoticeType			varchar(10),
	@Phase				varchar(10),
	@OutCome			varchar(50),
	@Appraisal1			varchar(50),
	@ALPResult			varchar(50)
 )

RETURNS varchar(20)
AS 
  BEGIN
		declare @rVal varchar(20), @QualType varchar(1) , @ApprStatu varchar(1)

        set @QualType =  case @NoticeType when 'ALP' then case when @Phase in  ('E','NE1','NE2','NE3','NE4') then '1' else '0'end
							   when 'EPA' then case when @Phase in  ('E','NTP','LTO') then '1' else '0'end
							   when 'OBS' then case when @Phase in  ('E','NTP','LTO') then '1' else '0'end
							   when 'SIG' then case when @Phase in  ('E','NE1','NE2','NE3','NE4') then '1' else '0'end
							 			  else  '0' end  	 

		set @ApprStatu = case @NoticeType when 'ALP' then case isnull(@ALPResult,'Not Start')  when 'Not Start' then '1' else '0'end
							   when 'EPA' then case isnull(@Appraisal1,'Not Start') when 'Not Start' then '1' else '0' end
							   when 'OBS' then case isnull(@Appraisal1,'Not Start') when 'Not Start' then '1' else '0' end
							   when 'SIG' then case isnull(@OutCome,'Not Start') when 'SignOff Required' then '1' else '0' end
							 			  else  '0' end  

       if (@QualType = '1' and  @ApprStatu ='1')
	       set @rVal = 'GoNotice'
		else
			set @rVal = 'Not'
 
 
	return @rVal
END  
  


 





