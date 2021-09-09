
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 20, 2018 
-- Description:	get current school Princiapl ID or Name
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getSchoolPrincipal]
(@Code varchar(8),
 @Type varchar(10))
RETURNS varchar(30)
AS 
  BEGIN
		declare @rValue varchar(30)
	    set @rValue = (select top 1 header  from [dbo].[EPA_Org_CompanyUnit]   where UnitCode = @Code)
	     begin
		    if @Type ='Name'
		  		set @rValue = ( select top 1 FullName from dbo.EPA_Org_EmployeeList where UserID = @rValue) 
		    if @Type ='UserID'
		  		set @rValue = ( select top 1  UserID from dbo.EPA_Org_EmployeeList where UserID = @rValue) 
		    if @Type ='Email'
		  		set @rValue = ( select top 1  eMail  from dbo.EPA_Org_EmployeeList where UserID = @rValue) 
	 
		  end
		RETURN(@rValue)
 END