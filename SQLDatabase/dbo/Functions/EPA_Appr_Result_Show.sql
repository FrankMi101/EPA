

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 25, 2018 
-- Description:	get Session Appraisal Result show in diffrient color
-- ==================================================================================  

CREATE  FUNCTION [dbo].[EPA_Appr_Result_Show] 
(
  @Result   varchar(50) = null 

)  
RETURNS varchar(150) 
AS  
BEGIN 
 
declare @rValue   varchar(150) 
if  patindex('%(%',@Result)  > 5  -- set @Result = left(@Result, patindex('%(%',@Result) -1)
    set  @rValue =  '<span style="color:  #75ab75">'   + @Result +'</span>'
else 

set  @rValue = case @Result when 'Complete' then '<span style="color: #75ab75">' 
							when 'Incomplete' then '<span style="color: #0099ff">' 
							when 'Incompleted' then '<span style="color: #0099ff">' 
							when 'Not Start' then '<span style="color: #ff0033">' 
							when 'Not Started' then '<span style="color: #ff0033">' 
							when 'SignOff Required' then '<span style="color: #0099ff">' 
							when 'Sign Off Required' then '<span style="color: #0099ff">' 
							when 'SignOff Strategy Required' then '<span style="color: #0099ff">' 
							when 'NTIP Strategy Sign off need' then '<span style="color: #0099ff">' 
							when 'Need NTIP Strategy' then '<span style="color: #0099ff">'  
							when 'Unsatisfactory' then '<span style="color:  #75ab75">'  
							when 'Satisfactory' then '<span style="color:  #158a15">'  
							when 'Need 2nd Appraisal' then '<span style="color: #ff0033">'  
							when 'Need 3rd Appraisal' then '<span style="color: #ff0033">'  
							when 'Need 4th Appraisal' then '<span style="color: #ff0033">'  
							when 'Development Needed' then '<span style="color:  #75ab75">'  
							when 'Successful completion of NTIP' then '<span style="color: #158a15">' 
							else '<span>'  
							end	 + @Result +'</span>'
  
 	
  set @rValue =  isnull(@rValue,'') 
  
    
   return @rValue
END  

  



