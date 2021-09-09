





 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get school name by ID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getSuperArea]
(@Code varchar(10),
@Type	varchar(20) )

RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50)

      if exists (select * from [dbo].[EPA_Org_RegionArea]   where AreaCode = @Code)
	     begin
		    if @Type ='District'
			    set @rValue =  ( select top 1  District   from [dbo].[EPA_Org_RegionArea]   where AreaCode = @Code) 
		    if @Type ='SuperArea'
			    set @rValue =  ( select top 1  AreaName + ' - ' + [dbo].[EPA_getUserNamebyID](SuperID)  from [dbo].[EPA_Org_RegionArea]   where AreaCode = @Code) 
		    if @Type ='SupervisorID'
			    set @rValue =  ( select top 1  SuperID from [dbo].[EPA_Org_RegionArea]   where AreaCode = @Code) 
 		    if @Type ='OfficerID'
		  		set @rValue = ( select top 1  Officer from dbo.[EPA_Org_RegionArea] where AreaCode = @Code) 
		    if @Type ='Supervisor'
			    set @rValue =  ( select top 1  [dbo].[EPA_getUserNamebyID](SuperID) from [dbo].[EPA_Org_RegionArea]   where AreaCode = @Code) 
		    if @Type ='Area'
		  		set @rValue = ( select top 1  AreaName from [dbo].[EPA_Org_RegionArea]   where AreaCode = @Code) 
		    if @Type ='Officer'
		  		set @rValue = ( select top 1  [dbo].[EPA_getUserNamebyID](Officer) from dbo.[EPA_Org_RegionArea] where AreaCode = @Code) 
		 end
	  else
	  	  set @rValue = ''
		  
		RETURN(@rValue)
 END

  






