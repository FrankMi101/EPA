

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 4, 2018 
-- Description:	get employee name by employee ID
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getNamebyID]
(@checkID varchar(20),
 @SchoolYear varchar(8),
 @NameType   varchar(30)
)
RETURNS varchar(50)
AS 
  BEGIN
 	 declare @rValue varchar(20)
     if ascii(left(ltrim(@checkID),1)) > 64 
	     set @checkID =  (select top 1 Employee_ID from dbo.EPA_Org_EmployeeList where UserID = @checkID)

     if left(@NameType,5) ='Admin'
		set  @checkID = (select top 1 [dbo].[EPA_getUserID](Appraiser)  from [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @SchoolYear and Employee_ID = @checkID)

     if @NameType in ('FirstName','AdminFirstName')
	    set @rValue = (select top 1 FirstName  from dbo.EPA_Org_EmployeeList where Employee_ID = @checkID)
     if @NameType in ('LastName','AdminLastName')
	    set @rValue = (select top 1 LastName  from dbo.EPA_Org_EmployeeList where Employee_ID = @checkID)

		RETURN(@rValue)
 END

  




