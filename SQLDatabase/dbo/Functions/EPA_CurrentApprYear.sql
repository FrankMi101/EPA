



-- =========================================================================
-- Author:		Frank Mi
-- Create date: April 10, 2018 
-- Description:	get current school year by school
-- =========================================================================
 
-- drop function  dbo.Current.SchoolYear 
CREATE FUNCTION [dbo].[EPA_CurrentApprYear] 
( @UnitID  varchar(8)  
 )
RETURNS varchar(8) 
AS  
BEGIN 
    declare  @date datetime, @SchoolYear varchar(8)
	declare @ThisYear int, @NextYear int, @PreviousYear int
	if exists (select * from [dbo].[EPA_sys_AppraisalYearCurrent] where Unit_ID = @UnitID )
		set  @SchoolYear = (select top 1 Current_Year from [dbo].[EPA_sys_AppraisalYearCurrent] where Unit_ID = @UnitID )
    else if exists (select * from  [dbo].[EPA_sys_AppraisalYearCurrent] where Unit_ID = '0000')
		set  @SchoolYear = (select top 1 Current_Year  from [dbo].[EPA_sys_AppraisalYearCurrent] where Unit_ID = '0000' )
    else 
	    set  @SchoolYear = [dbo].[EPA_CurrentSchoolYear](8,25) 

return @SchoolYear

END
 

/*
 	set @date = getdate()

	set @ThisYear=CAST(year(@date)as int)
	set @NextYear= @ThisYear+1
	set @PreviousYear=@ThisYear-1
	if month(@date)> @month
    		set @SchoolYear=CAST(@ThisYear as varchar(4)) + CAST(@NextYear as varchar(4))
	else 
		if month(@date) = @month
			if day(@date)>= @day
				set @SchoolYear=CAST(@ThisYear as varchar(4)) + CAST(@NextYear as varchar(4))
			else
    			set @SchoolYear=CAST(@PreviousYear as varchar(4)) + CAST(@ThisYear as varchar(4))

		else
    		set @SchoolYear=CAST(@PreviousYear as varchar(4)) + CAST(@ThisYear as varchar(4))
 
*/

