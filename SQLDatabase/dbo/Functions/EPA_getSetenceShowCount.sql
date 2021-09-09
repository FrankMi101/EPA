

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 15, 2021 
-- Description:	get setence show lines count  
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getSetenceShowCount]
(@Sentence varchar(2000),
@SingleLen  int 
)
RETURNS int
AS 
  BEGIN
 	 declare @rValue int
	 set @rValue =  round( len(rtrim(ltrim(@sentence))) / @SingleLen + 0.5, 0)
	 return @rValue
 END

   
