




-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get Appraisal Item Name from definition table
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalItemName]
(	@AppraisalCategory varchar(20),
	@AppraisalArea varchar(20),
	@AppraisalCode varchar(20)
)
RETURNS varchar(100)
AS 
  BEGIN
		declare @rValue varchar(100)

      if exists (select * from [dbo].[EPA_sys_Appraisal_Definition]  
				where Appraisal_Category =@AppraisalCategory and Appraisal_Area =@AppraisalArea and Appraisal_Code = @AppraisalCode)
	     
	 	 set @rValue = ( select top 1  Appraisal_Text from dbo.EPA_sys_Appraisal_Definition 
		 where Appraisal_Category =@AppraisalCategory and Appraisal_Area =@AppraisalArea and Appraisal_Code = @AppraisalCode) 
	  else
	  	  set @rValue = 'New Item'
		  
		RETURN(@rValue)
 END

  


