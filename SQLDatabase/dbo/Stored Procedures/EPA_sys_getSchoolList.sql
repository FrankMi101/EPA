













-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get school list by Role
-- ================================================================================== 
 
-- Drop proc dbo.EPA_sys_getSchoolList 'SchoolList','mif','Principal','0529','20192020'
CREATE Procedure [dbo].[EPA_sys_getSchoolList]
 	(	@Operate	varchar(30) = 'upaUser',
		@UserID		varchar(30) = null,
		@Para1		varchar(30) =null,   --  user role
		@Para2		varchar(30) = null,  -- school code / school area
		@Para3		varchar(30) = null  --  school_year
	)

 
AS
BEGIN 
	set nocount on
	   if @Para1 in('Principal','VP')
	      begin
		      if exists (select * from [dbo].[EPA_sys_securityUsers] where GroupID ='Admin' and UserID = @UserID)
				 select  UnitCode as Code , UnitName as [Name]
				  from  [dbo].[EPA_Org_CompanyUnit]  
				  Where UnitCode = @Para2
             else    
				  select   UnitCode as Code , UnitName as [Name]
				  from EPA_Appr_EmployeeList  as E 
				  inner join  [dbo].[EPA_Org_CompanyUnit] as U on  E.Unit_ID = U.UnitCode
				  where userid = @UserID and Appraisal_year = @Para3  -- UnitCode = @Para3
		  end
	   else if @Para1 ='Teacher'
			   select Unitcode as Code , UnitName as [Name]
			   from [dbo].[EPA_ORG_Schools] 
			   where UnitCode = @Para2
	  else if @Para1 in ('SO','Superintendent','Supervisory')
			  begin
 				   if exists (select * from [dbo].[EPA_Org_RegionArea] where  SuperID = @UserID and Active = '1' and SchoolScop = 'AreaSchool')
				       select @Para2 as Code, 'All Area Schools' as [Name] --- get all area schools
					   union
					   select   distinct UnitCode as Code , UnitName as [Name] 
					   from [dbo].[EPA_ORG_Schools]  
					   where Active ='1' and area in (select AreaCode  from [dbo].[EPA_Org_RegionArea]  where SuperID =  @UserID )
					   order by [Name]
				   else
					   select distinct UnitCode as Code , UnitName as [Name]  
					   from [dbo].[EPA_ORG_Schools] 
					   where Active ='1'  and area in (select AreaCode  from [dbo].[EPA_Org_RegionArea] where SuperID = case  @UserID when 'mif' then 'toveysc' else @UserID  end and Active = '1')
					   order by [Name]
			   end
 		else if @Para1 in ('Admin','Director')
			 begin	
				 if left(@Para2,2) in('Ar','HR','CE')
					   select distinct UnitCode as Code , UnitName as [Name] 
						from [dbo].[EPA_ORG_Schools]  
					   where Active ='1' and Area = @Para2
					   order by [Name]
				 else 
					   select distinct UnitCode as Code , UnitName as [Name] 
						from [dbo].[EPA_ORG_Schools]  
					   where Active ='1'
					   order by [Name]
			end
		  	
 
 END 
  


   



