

  

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 13, 2018 
-- Description:	get Appraiser by unit id and position type
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getAppraiserByPostion]
(@UnitID varchar(8),
 @PositionType varchar(10)
)
RETURNS varchar(50)
AS 
  BEGIN
		declare @rValue varchar(50)
	    if  @PositionType ='Teacher'
	 		set @rValue = ( select top 1 UserID from [dbo].[EPA_Org_EmployeeList]  
							where Unit_ID = @UnitID  and Position_Type in ( 'Principal','VP')  order by Position_Type) 
		 if  @PositionType ='VP'
			set @rValue = ( select top 1 UserID from [dbo].[EPA_Org_EmployeeList]  
							where Unit_ID = @UnitID  and Position_Type= 'Principal' order by Position_Type) 
		 if  @PositionType ='Principal'
			set @rValue = ( select top 1 UserID from [dbo].[EPA_Org_EmployeeList]  
							where   Position_Type= 'SO' order by Position_Type) 
 			
		RETURN(@rValue)
 END

  




