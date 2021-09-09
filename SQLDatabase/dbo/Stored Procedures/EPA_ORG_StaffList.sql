





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 7, 2018 
-- Description:	get school appraisal staff list 
-- ================================================================================== 
        
 -- Drop proc  dbo.EPA_Org_StaffList 'Status','mif','20172018','0529','','' 
CREATE Procedure [dbo].[EPA_ORG_StaffList]
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser',
		@SchoolYear		varchar(8) = null,
		@SchoolCode		varchar(8) = null,
		@SearchBy		varchar(30) = null,
		@SearchValue	varchar(30) = null 
	)
AS
BEGIN   
  set nocount on
  declare @StaffList as table
  (Employee_ID  varchar(20),
    Unit_ID		  varchar(8))

  if @Operate ='Teacher'
     insert into @StaffList
	 select Employee_ID, Unit_ID
	 from  dbo.EPA_Org_EmployeeList
	 where UserID =  @UserID
  else -- @Operate in ('Superintendent','Principal','Vice Principal')
     begin
	    if @SearchBy ='Teacher'
			begin
			    if @SearchValue ='' 
						 insert into @StaffList
						 select Employee_ID, Unit_ID
						 from dbo.EPA_Org_EmployeeList
						 where  Unit_ID = @SchoolCode -- and   LastName like @SearchValue
				else
					begin
						 set @SearchValue = @SearchValue +'%'
						 insert into @StaffList
						 select Employee_ID, Unit_ID
						 from dbo.EPA_Org_EmployeeList
						 where    LastName like @SearchValue
					end
			 end
		else if @SearchBy ='Status'
			 insert into @StaffList
			 select Employee_ID, Unit_ID
			 from dbo.EPA_Org_EmployeeList
			 where  Unit_ID = @SchoolCode  and Employee_Status = @SearchValue
		else if @SearchBy ='Position'
			 insert into @StaffList
			 select Employee_ID, Unit_ID
			 from dbo.EPA_Org_EmployeeList
			 where  Unit_ID = @SchoolCode  and Employee_Position = @SearchValue
		else if @SearchBy ='NewStaff'
			 insert into @StaffList
			select Employee_ID, Unit_ID
			 from dbo.EPA_Org_EmployeeList
			 where  Unit_ID = @SchoolCode  and Employee_Status = @SearchValue
		else if @SearchBy ='Process'
			 insert into @StaffList
			 select Employee_ID, Unit_ID
			 from dbo.EPA_Org_EmployeeList
			 where  Unit_ID = @SchoolCode  
       else
	        insert into @StaffList
			 select Employee_ID, Unit_ID
			 from dbo.EPA_Org_EmployeeList
			 where  Unit_ID = @SchoolCode  
	 end

	  
    declare @PS     varchar(7)
    declare @imgNote varchar(200) 
    set @imgNote = ''')" > <img border="0" width="24" height="24" src="../images/edit2.jpg" />'
    set @PS = ''','''


 	select  IDs as myKey,   A.Employee_ID as EmployeeID,
	 
		 
		'<a title="Open ' + FullName + ' Profile " href="javascript:OpenStaffEdit(''' 
 		
		 + cast(A.Employee_ID as  varchar(15)) + @PS + ''  + @PS + A.Unit_ID    + @PS +  A.FullName  + @imgNote + '</a>'     as [Action],   

		 
	   Employee_Status as EmployeeStatus, Gender, email, 
	   Employee_Position as EmployeePosition,  TimeType, 
	   [dbo].[DateF]([Start_date],'YYYYMMDD') as StartDate,
	   [dbo].[DateF](End_date,'YYYYMMDD')  as EndDate,
	   A.Unit_ID as UnitID,
	 
		isnull( Assignment,'')		as Assignment,
		isnull( Comments,'')		as Comments,
		dbo.EPA_getSchoolName(A.Unit_ID,'Name')  as School,
  		FirstName ,LastName,
    		ROW_NUMBER() OVER(ORDER BY   A.Employee_Status, LastName, FirstName) AS RowNo 
        from  dbo.EPA_Org_EmployeeList  as A
		inner join @StaffList as S on A.Employee_ID = S.Employee_ID   and A.Unit_ID =S.Unit_ID
  		order by  RowNo
    
 
 END
     
	  









