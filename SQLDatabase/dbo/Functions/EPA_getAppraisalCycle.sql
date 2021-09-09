





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 3, 2018 
-- Description:	get user application role
-- ================================================================================== 

Create FUNCTION dbo.EPA_getAppraisalCycle
(	@AppraisalType	varchar(10), 
	@AppraisalCycle	varchar(10), 
	@AppraisalResult	varchar(50))
RETURNS varchar(3)
AS 
  BEGIN
		declare @rValue varchar(3)
		if @AppraisalCycle ='LTO' 
			set @rValue ='LTO'
		else if @AppraisalCycle ='NE4'
			set @rValue ='E'
        else if @AppraisalCycle ='NTP'
		    set @rValue = case @AppraisalResult when 'Successful completion of NTIP' then  'NE1' else 'NTP' end
		else if @AppraisalCycle ='E'
			set  @rValue = case @AppraisalResult when 'Satisfactory' then  'NE1' else 'E' end
		else
			set @rValue ='NE' + case right(@AppraisalCycle,1) when '1' then '2' when '2' then '3' when '3' then '4' else '0' end
				 
 
		RETURN(@rValue)
 END
 


