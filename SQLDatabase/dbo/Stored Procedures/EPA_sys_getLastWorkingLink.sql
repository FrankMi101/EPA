













 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: JUly 28, 2020 ;  
-- Description:	get user last working item link  
-- ==================================================================================  
CREATE Procedure [dbo].[EPA_sys_getLastWorkingLink]  
 	(	@Operate		varchar(30) = 'Teacher',
		@UserID			varchar(30) = 'upaUser' 
	)
AS
BEGIN   
  set nocount on
  
    declare @PS     varchar(7) 
    set @PS = ''','''

	if @Operate = 'WorkingItem'
		select top 1   case Appraisal_Area when 'ALP' then 'javascript:OpenALPTop(''' else 'javascript:OpenAppraisalTop(''' end 
			   + cast(Working_EmployeeID as  varchar(10)) + @PS + Working_year  + @PS + Working_Unit    + @PS +  Appraisal_Category + @PS +  Appraisal_Phase + @PS + dbo.EPA_getUserNamebyID(Working_EmployeeID) + @PS +  Appraisal_Area + @PS +  Appraisal_Item +  ''')' 
	    from [dbo].[EPA_sys_UsersActionTrack] 
		where UserID = @UserID	

 	if @Operate = 'WorkingArea'
		select top 1   case Appraisal_Area when 'ALP' then 'javascript:OpenALP(''' else 'javascript:OpenAppraisal(''' end 
			   + cast(Working_EmployeeID as  varchar(10)) + @PS + Working_year  + @PS + Working_Unit    + @PS +  Appraisal_Category + @PS +  Appraisal_Phase + @PS + dbo.EPA_getUserNamebyID(Working_EmployeeID)  + @PS +  Appraisal_Area + @PS +  Appraisal_Item +  ''')' 
	    from [dbo].[EPA_sys_UsersActionTrack] 
		where UserID = @UserID	
	 
END	  
	   












