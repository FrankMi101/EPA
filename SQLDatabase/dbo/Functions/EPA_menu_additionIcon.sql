

  
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: May  09, 2020 
-- Description:	get menu additional action icon
-- ==================================================================================
  

CREATE FUNCTION [dbo].[EPA_menu_additionIcon]
(@AppraisalRole		varchar(20),
 @AppraisalArea		varchar(10),
 @MenuText			varchar(200) 
 )

RETURNS varchar(300)
AS 
  BEGIN
		declare @rValue varchar(300) 
		set  @rValue = @MenuText

		if @AppraisalRole ='Appraiser' 
		   begin
		       if @AppraisalArea ='SUM'   set @rValue = @MenuText + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +   '<a href = "ViewPermission.aspx?aID=' + @AppraisalArea +'" target="GoPageiFrame"> <img alt="R" title="grant appraisee View permission" src="../images/setup.png" height="30px" width="30px"/></a>'
		       if @AppraisalArea ='ALP'   set @rValue = @MenuText + '&nbsp;&nbsp;&nbsp;' +   '<a href = "ViewPermission.aspx?aID=' + @AppraisalArea +'" target="GoPageiFrame"> <img alt="R" title="grant appraisee View permission" src="../images/setup.png" height="30px" width="30px"/></a>'
		   end
		 
		 

  set @rValue =  isnull(@rValue,'') 
	   
	return @rValue
END  
  


 





