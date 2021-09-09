







 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 10, 2017 Modify by Frank @ 2018/02/20
-- Description:	Get Appraisal List
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProfileList] --  'AppraisalSessionList', 'mif','20172018','0529',  '00039524'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@Category		varchar(10)=null 
as

set nocount on
begin
		if @Operate ='AppraisalYearList'
		   	select  distinct Appraisal_year as [Code], Appraisal_year as [Name] 
			from [dbo].[EPA_Appr_EmployeeList] 
			where   Employee_ID = @EmployeeID 	 
			order by Name
		if @Operate ='ApraisalSchoolList'
		   	select distinct unit_id as [Code], [dbo].[EPA_getSchoolName]( Unit_ID,'Name') as [Name] 
			from [dbo].[EPA_Appr_EmployeeList] 
			where   Employee_ID = @EmployeeID 	 
			order by Name			  
 
		if @Operate ='AppraisalSessionList'
		   begin
				declare @currentSession varchar(20)
				set @currentSession = ( select top 1  dbo.EPA_appr_CurrentAppraisalSession(Appraisal_year, Employee_ID,Unit_ID,Appraisal_Cycle,Appraisal_type)
										from [dbo].[EPA_Appr_EmployeeList] where Appraisal_year = @SchoolYear and Employee_ID = @EmployeeID  and Appraisal_type = @Category)

               if @currentSession ='Appraisal4'
						select 'Appraisal1' as [Code], 'Appraisal 1' as [Name]
						union
						select 'Appraisal2' as [Code], 'Appraisal 2' as [Name]
						union
						select 'Appraisal3' as [Code], 'Appraisal 3' as [Name]
						union
						select 'Appraisal4' as [Code], 'Appraisal 4' as [Name]
               else if @currentSession ='Appraisal3'
						select 'Appraisal1' as [Code], 'Appraisal 1' as [Name]
						union
						select 'Appraisal2' as [Code], 'Appraisal 2' as [Name]
						union
						select 'Appraisal3' as [Code], 'Appraisal 3' as [Name]
               else if @currentSession ='Appraisal2'
						select 'Appraisal1' as [Code], 'Appraisal 1' as [Name]
						union
						select 'Appraisal2' as [Code], 'Appraisal 2' as [Name]
               else  
						select 'Appraisal1' as [Code], 'Appraisal 1' as [Name]
 
  
 			end
											   
   end
  


