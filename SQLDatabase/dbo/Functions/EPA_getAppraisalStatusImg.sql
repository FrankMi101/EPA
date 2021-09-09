






 



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 05, 2017   enhanced by Frank at January 6, 2018  
-- Description:	get Appraisal status image
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraisalStatusImg]
(	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(20)= null ,
	@Area			varchar(20)= null,
	@ApprCode		varchar(10) = null,
	@contentType	varchar(20) = null,  
	@StepCheck		varchar(1) = null
)
RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50),@StepStatus int
		set @StepStatus = [dbo].[EPA_appr_AppraisalProcessCompleteStatus]
		                  (@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area,@ApprCode,@contentType,@StepCheck)

	 if  @contentType ='Report'
	 	 set @rValue =  '../images/pdfReport.png'
	 else if  @contentType ='Signature'
	     begin
		     if @StepStatus ='1'
	 			set @rValue =  '../images/SignatureDone.png'
             else
	 			set @rValue =  '../images/Signature.png'			
		 end
     else if  @StepStatus = '1' 
	     set @rValue =  '../images/Item_done.png'
	 else
	     set @rValue =  '../images/Item_0.png'   
		RETURN(@rValue)
 END

   








