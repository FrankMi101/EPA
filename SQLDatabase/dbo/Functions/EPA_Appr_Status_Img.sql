












-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 15, 2018 
-- Description:	get Session Appraisal Result show in different color
-- ==================================================================================  

CREATE  FUNCTION [dbo].[EPA_Appr_Status_Img] 
( @Type			varchar(20)=null,
  @Result		varchar(50)=null,
  @EmployeeID   varchar(10)=null,
  @Schoolyear	varchar(8) = null,
  @ApprType		varchar(10) = null
)  
RETURNS varchar(250) 
AS  
BEGIN 
 
	declare @rValue   varchar(250) , @imgSize varchar(100), @imgTitle varchar(100), @img varchar(50), @exist varchar(20)

	if @Type ='Notes'
	   begin
			if exists (select * from [dbo].[EPA_Appr_Notes]  where School_Year =@Schoolyear and EmployeeID = @EmployeeID)
				set @exist='Yes'
			else
				set @exist='No'
	   end
	if @Type ='Notice'
	   begin
 			if exists (select * from [dbo].[EPA_Appr_Notification]  where School_Year =@Schoolyear and EmployeeID = @EmployeeID and NoticeType = @Result)
				set @exist='Yes'
			else
				set @exist='No'
	   end
	set @imgSize = ' border="0" width="22" height="22" ' 
	set @imgTitle =' title ="' + case @Result when 'ALP' then 'Annual Learning Plan' else 'Performance Appraisal' end      
							   + Case @Type when 'Notes'  then Case  @exist  when 'Yes' then ' Notes exists'    else ' Notes not exists'	  end 
										    when 'Notice' then Case  @exist  when 'Yes' then ' Notice sent out' else ' Notice has not sent out' end 
											else '' end +'"'								 
	set @img = 'src="' + Case @Type when 'Notes'  then  case @exist when 'Yes' then  '../images/action2.png'  else case @ApprType when 'PPA' then '../images/action3.png' else  '../images/action.png' end end
 									when 'Notice' then  case @exist when 'Yes' then  '../images/action2.png'  else '../images/action.png' end
									else  '../images/action.png' end  +'"'
	set @rValue =  '<img ' +  @imgTitle +  @imgSize + @img  +' />' 


	set @rValue =  isnull(@rValue,'') 
   return @rValue
END  

  











