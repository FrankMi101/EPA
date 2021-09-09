



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 3, 2018 
-- Description:	previous school year or nect school year by current school year
-- ==================================================================================  

CREATE  FUNCTION [dbo].[EPA_CurrentSchoolYearPreNext] 
( @Type		varchar(10),
  @SchoolYear varchar(8)
)  
RETURNS varchar(8) 
AS  
BEGIN 
	declare @rSchoolYear varchar(8)
	declare @ThisYear int
	declare @NextYear int
	declare @PreviousYear int

	if @Type = 'Previous'
		begin
 			set @ThisYear=CAST(left(@SchoolYear,4) as int)
			set @PreviousYear=@ThisYear-1
			set @rSchoolYear =  CAST(@PreviousYear as varchar(4)) + CAST(@ThisYear as varchar(4))
			
		end
	if @Type = 'Next'
		begin
 			set @ThisYear=CAST(right(@SchoolYear,4) as int)
			set @NextYear=@ThisYear+1
			set @rSchoolYear=CAST(@ThisYear as varchar(4)) + CAST(@NextYear as varchar(4))

		end

	return   @rSchoolYear -- '20092010'  --

END










