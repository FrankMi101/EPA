
CREATE FUNCTION [dbo].[getAgebyDate]
(	@DOB datetime,  -- date of birth date
	@objDate datetime  -- object date
)
RETURNS int 
AS 
  BEGIN
		declare @rValue  int
	    --set @rValue = ( select
					--	case  when DATEADD(YY, DATEDIFF(YY, @DOB , @objDate),  @DOB )  > @objDate
					--		  then DATEDIFF(YY, @DOB , @objDate) - 1
					--		  else DATEDIFF(YY, @DOB , @objDate) end
					-- )

        if  DATEADD(YY, DATEDIFF(YY, @DOB , @objDate),  @DOB )  > @objDate
		    set @rValue = DATEDIFF(YY, @DOB , @objDate) - 1
        else
			 set @rValue = DATEDIFF(YY, @DOB , @objDate)

		RETURN(@rValue)
 END

  
