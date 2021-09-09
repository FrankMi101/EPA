










-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 25, 2018 
-- Description:	get Session Appraisal Result show in diffrient color
-- ==================================================================================  

CREATE  FUNCTION [dbo].[EPA_Appr_Result_Img] 
( @Type			varchar(20)=null,
  @Result		varchar(50)=null,
  @EmployeeID   varchar(10)=null,
  @Schoolyear	varchar(8) = null,
  @Category		varchar(10) = null
)  
RETURNS varchar(250) 
AS  
BEGIN 
 
declare @rValue   varchar(250) , @imgSize varchar(100), @imgTitle varchar(100),@img varchar(50), @exist varchar(10), @vTitle varchar(10)
if exists (select * from [dbo].[EPA_Appr_Notification]  where School_Year =@Schoolyear and EmployeeID = @EmployeeID and NoticeType = case @Type when 'ALP' then 'Annual Learning Plan' when 'PPX' then 'Performance Appraisal' else 'Classroom Observation' end)
	set @exist='Yes'
else
	set @exist='No'

set @vTitle = Case @Type when 'PPX' then 'Appraisal' else case @Category when 'PPA' then  'AGP' else 'ALP' end end
 
set @imgSize = ' border="0" width="24" height="24" ' -- + '../images/chinaz9.ico' + '" />' 
set @imgTitle='title ="'+ Case @Type when 'ALP' then case @Category when 'NTP' then '' when 'LTO' then ''   else 
													 Case @Result when 'Not Start'				 then  @vTitle + case @exist when 'Yes' then ' not start, but noticed' else ' not start' end
																  when 'Need Appraiser Sign Off' then 'Need Appraiser Sign Off on ' + @vTitle
																  when 'Need Appraisee Sign Off' then 'Need Appraisee Sign Off on ' + @vTitle
																  when 'Completed'				 then @vTitle + ' Completed' 
																  when 'Incompleted'			 then @vTitle + ' In Progress'  else '' end  end

									 when 'PPX' then Case @Result when 'Not Start'				 then @vTitle  + case @exist when 'Yes' then ' not start yet, but noticed' else ' not start yet' end 
																  when 'SignOff Required'		 then 'Apprasial need signature'
																  when 'Appraiser SignOff Required' then 'Need Appraiser Sign Off on ' + @vTitle
																  when 'Appraisee SignOff Required' then 'Need Appraisee Sign Off on ' + @vTitle
																  when 'Strategy Signoff Required'		then 'Need Signoff NTIP Strategy'
																  when 'Incomplete'				then 'Apprasial In Progress'
																  when 'InProgress'				then 'Apprasial In Progress'																  
																  when 'Completed'				then 'Performance Appraisal completed' else '' end 
									 else  '' end + '"'

set   @img = 'src="' +	  Case @Type when 'ALP' then case @Category when 'NTP' then '' when 'LTO' then ''  else 
													 Case @Result when 'Not Start'				 then  case @exist when 'Yes' then '../images/Notice.png' else case @Category when 'PPA' then '../images/chinaz91.gif' else  '../images/chinaz9.ico' end end
																  when 'Need Appraiser Sign Off' then '../images/chinaz9P.png'
																  when 'Need Appraisee Sign Off' then '../images/chinaz9T.png'
																  when 'Incompleted'			 then '../images/chinaz90.png'
																  when 'Completed'				 then '../images/chinaz9.png'  else '' end  end
									 when 'PPX' then Case @Result when 'Not Start'				 then case @exist when 'Yes' then '../images/Notice.png' else '../images/chinaz80.png' end 
																  when 'SignOff Required'		 then '../images/signature.png'
																  when 'Appraiser SignOff Required'		 then '../images/chinaz9P.png'
																  when 'Appraisee SignOff Required'		 then '../images/chinaz9T.png'
																  when 'Strategy Signoff Required'		then '../images/chinaz13.ico'
																  when 'Incomplete'				then '../images/chinaz8.png'
																  when 'InProgress'				then '../images/chinaz8.png'																  
																  when 'Completed'				then '../images/chinaz13.ico'  else '' end 
									 else  '' end +'"' 

 
 if @imgTitle =''
	set @rValue =''
 else  
	set @rValue =  '<img ' +  @imgTitle +  @imgSize + @img  +' />' 

 	
  set @rValue =  isnull(@rValue,'') 
  
    
   return @rValue
END  

  








