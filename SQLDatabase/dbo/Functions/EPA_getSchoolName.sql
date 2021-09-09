





 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get school name by ID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getSchoolName]
(@Code varchar(8),
 @Type varchar(10))
RETURNS varchar(250)
AS 
  BEGIN
		declare @rValue varchar(250)

      if exists (select * from [dbo].[EPA_Org_Schools]   where UnitCode = @Code)
	     begin
		    if @Type ='BoardName'
			    set @rValue ='Toronto Catholic District School Board'
		    if @Type ='Name'
		  		set @rValue = ( select top 1  UnitName from [dbo].[EPA_Org_Schools]   where UnitCode = @Code) 
		    if @Type ='BriefName'
		  		set @rValue = ( select top 1  Brief_Name from dbo.[EPA_Org_Schools] where UnitCode = @Code) 
		 end
	  else
	  	  set @rValue = 'Not an Employee'
		  
		RETURN(@rValue)
 END

  






