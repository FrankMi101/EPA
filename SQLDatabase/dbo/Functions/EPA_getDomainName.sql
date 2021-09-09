

 


 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 31, 2018
-- Description:	get Appraisal domain Commets 
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getDomainName]
(	@DomainID		int 
)
RETURNS varchar(200)
AS 
  BEGIN
	  declare @rValue varchar(200) 
	    
        if @DomainID ='0'
		    set @rValue ='General Comments' 
        else 
		   set @rValue = (select top 1 Appraisal_DomainName  from EPA_sys_appraisalDomain where Appraisal_Domain = @DomainID )
 
	  RETURN(@rValue)
 END

  


