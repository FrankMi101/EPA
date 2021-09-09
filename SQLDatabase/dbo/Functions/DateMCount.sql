
CREATE  FUNCTION    [dbo].[DateMCount] 
( 
  @sDate  datetime,
  @eDate datetime
)  
RETURNS numeric(4,1) 
AS  
BEGIN 

  declare   @vMonth numeric(4,1)
  
  set @vMonth = 				CASE  WHEN DATEPART(DAY, @sDate) > DATEPART(DAY, @eDate)
								THEN DATEDIFF(MONTH, @sDate, @eDate) - 1
								ELSE DATEDIFF(MONTH, @sDate, @eDate)             END  

	if DATEPART(DAY, @eDate) - DATEPART(DAY, @sDate) > 15
	    set @vMonth =    @vMonth  + 1
    else
	    set @vMonth =   @vMonth  + 0.5
	   
	 return @vMonth
END  
