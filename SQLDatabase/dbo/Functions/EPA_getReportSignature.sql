

 
 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 30, 2018 
-- Description:	 LTO Appraisal Report Signature information
-- ==================================================================================
CREATE FUNCTION [dbo].[EPA_getReportSignature]
	( 
	 @SchoolYear	varchar(8),
	 @SchoolCode	varchar(8),
	 @EmployeeID	varchar(20),
	 @SessionID		varchar(20),
	 @ItemCode		varchar(10)
	 )
  
RETURNS @RSignature  TABLE 
		(SchoolYear varchar(8),
		 SchoolCode varchar(8),
		 EmployeeID varchar(20),
		 AppraiserSignature	varchar(30),
		 AppraiseeSignature	varchar(30),
		 SupervisoSignature	varchar(30),
		 AppraiserSignatureDate  varchar(20), 
		 AppraiseeSignatureDate  varchar(20), 
		 SupervisoSignatureDate  varchar(20),
		 AppraiseeLastName  varchar(30),
		 AppraiseeFirstName varchar(30),
		 AppraiserLastName  varchar(30),
		 AppraiserFirstName varchar(30),
		 SchoolName			varchar(250),
		 BoardName			varchar(250)
		  
)

AS 
BEGIN    

	declare @SignNameP  varchar(30)
	declare @SignNameT  varchar(30)
	declare @SignNameS  varchar(30)
	declare @SignDateP  varchar(20)
	declare @SignDateT  varchar(20)
	declare @SignDateS  varchar(20)

	select  top 1 @SignNameP = [Signature], @SignDateP = dbo.DateF(SignOff_date,'YYYYMMDD')  
	from [dbo].[EPA_Appr_SignOff] where SignOff_Type ='Appraiser' and ItemCode = @ItemCode and School_year = @Schoolyear and School_code = @SchoolCode and EmployeeID = @EmployeeID   and SessionID = @SessionID 

	select top 1  @SignNameT = [Signature], @SignDateT= dbo.DateF(SignOff_date,'YYYYMMDD')  
	from [dbo].[EPA_Appr_SignOff] where SignOff_Type ='Appraisee' and ItemCode = @ItemCode and School_year = @Schoolyear and School_code = @SchoolCode  and EmployeeID = @EmployeeID  and SessionID = @SessionID  
 
	select top 1  @SignNameS = [Signature], @SignDateS= dbo.DateF(SignOff_date,'YYYYMMDD')  
	from [dbo].[EPA_Appr_SignOff] where SignOff_Type ='Supervisor' and ItemCode = @ItemCode  and School_year = @Schoolyear and School_code = @SchoolCode and EmployeeID = @EmployeeID  and SessionID = @SessionID   

 
    insert into @RSignature
    select  	@SchoolYear, @SchoolCode, @EmployeeID, isnull(@SignNameP,''), isnull(@SignNameT,''), isnull(@SignNameS,''), isnull(@SignDateP,''), isnull(@SignDateT,''), isnull(@SignDateS,''),
    dbo.EPA_getNamebyID(@EmployeeID,@SchoolYear,'LastName')		as AppraiseeLastName, 
	dbo.EPA_getNamebyID(@EmployeeID,@SchoolYear,'FirstName')	as AppraiseeFirstName, 
	dbo.EPA_getNamebyID(@EmployeeID,@SchoolYear,'AdminLastName') as AppraiserLastName, 
	dbo.EPA_getNamebyID(@EmployeeID,@SchoolYear,'AdminFirstName') as AppraiserFirstName, 
	dbo.EPA_getSchoolName(@SchoolCode,'Name') as SchoolName, 
 	dbo.EPA_getSchoolName(@SchoolCode,'BoardName') as BoardName 
  
     RETURN
END	   

