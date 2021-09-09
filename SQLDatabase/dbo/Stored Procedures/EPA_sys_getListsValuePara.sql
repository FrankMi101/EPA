



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 25, 2017 
-- Description:	get items for list 
-- ================================================================================== 

-- Drop proc dbo.EPA_sys_getListsValuePara 'SchoolArea','toveysc','SO','Area2','0529'
CREATE Procedure [dbo].[EPA_sys_getListsValuePara] ---'CompetencyRatingList','mif','TPA'
 	(	@Operate	varchar(30) = 'upaUser',
		@UserID		varchar(30) = null,
		@Para1		varchar(50) =null,
		@Para2		varchar(50) = null,
		@Para3		varchar(50) = null 
		  
	)

 
AS
BEGIN 
	set nocount on
	   if exists(select * from dbo.EPA_sys_StandardCode where ListType = @Operate)
				select '0' as [Code], ' ' as [Name] ,'' as Orderby
				union
				select listValue as [Code], listText  as [Name] , Orderby 
				from  dbo.EPA_sys_StandardCode
				where ListType = @Operate
				order by Orderby
		else
			begin
			    if @Operate ='UserRole'
				    select distinct  [Role] as [Code], Full_Name as [Name]
				    from [dbo].[EPA_sys_appraisalRole]  
					where Appraisal_Code ='EPA' and [Role]  not in ('Other','Retired')
 					order by [Name]
				else if @Operate ='DistrictList'
						select '' as [Code], '<-- Select -->' as [Name]
						union
						select District_code as [Code], District_Name  as [Name]
						from  [dbo].[EPA_ORG_District] 
						order by [Code]				
				else if @Operate ='Supervisor'
						select '' as [Code], '<-- Select -->' as [Name]
						union
						select  UserID as [Code], FullName  as [Name]
						from  [dbo].[EPA_Org_EmployeeList] 
						where Employee_Position  in ('Superintendent','Supervisor')
						order by [Code]				
				else if @Operate ='Officer'
						select '' as [Code], '<-- Select -->' as [Name]
						union
						select  UserID as [Code], FullName  as [Name]
						from  [dbo].[EPA_Org_EmployeeList] 
						where Employee_Position  in ('Officer' )		
				else if @Operate ='SchoolList'
						select  distinct UnitCode as [Code] , UnitName as [Name] 
					    from [dbo].[EPA_ORG_Schools] 
					    where Active ='1'
					    order by [Name]
				else if @Operate ='SchoolPrincipal'
						select '' as [Code], '<-- Select -->' as [Name]
						union
						select  UserID as [Code], FullName  as [Name]
						from  [dbo].[EPA_Org_EmployeeList] 
						where Employee_Position ='Principal'
						order by [Code]	
				else if @Operate ='SchoolArea'
						begin
						   if @Para1 in ('Admin','Director')
								select 'All' as [Code], '<-- Select -->' as [Name]
								union
								select    AreaCode as [Code], AreaName  as [Name]
								from  [dbo].[EPA_Org_RegionArea]  
								order by [Code]
						   else if @Para1 ='SO'
								begin
									if exists(select top 1 * from  [dbo].[EPA_Org_RegionArea]  where SuperID = @UserID and left(AreaCode, 4) = 'Area')
										select top 1   AreaCode as [Code], AreaName  as [Name]
										from  [dbo].[EPA_Org_RegionArea]  
										where SuperID = @UserID
 										order by [Code]
									else
										select    AreaCode as [Code], AreaName  as [Name]
										from  [dbo].[EPA_Org_RegionArea]  
										order by [Code]
								end
						   else
								select distinct  AreaCode as [Code], AreaName  as [Name]
								from  [dbo].[EPA_Org_RegionArea]  
								Where AreaCode =  @Para2
								order by [Code]
							--	where AreaCode = @Para2 		select * from [dbo].[EPA_Org_Schools]	 
						end	
				else if @Operate ='ALP'
						select Appraisal_Step as [Code], Appraisal_StepName  as [Name]
						from  dbo.EPA_sys_appraisalStep
						order by IDs				
				else if @Operate ='AppraisalPhase'
						select '0' as [Code] ,''  as [Name]  
						union
						select 'Lea' as [Code], 'Leave' as [Name]
						union
						select   Appraisal_Phase as [Code], Appraisal_PhaseName  as [Name]
						from  [dbo].[EPA_sys_appraisalPhase] 
						order by [Name]
				else if @Operate ='ApprType'
					begin
						if @Para3 ='PPA' 
							select 'Evaluation' as [Code], 'Evaluation Year' as [Name], '1' as orderby
							union
							select 'PPA' as [Code], 'No Evaluation Year' as [Name], '2' as orderby
							union
							select 'NTP' as [Code], 'First Year Admin' as [Name], '3' as orderby						 
							order by orderby, [Code]
						else
 							select 'TPA' as [Code], 'No Evaluation Year' as [Name], '4' as orderby
							union
							select 'Evaluation' as [Code], 'Evaluation Year' as [Name], '1' as orderby
							union
							select 'NTP' as [Code], 'New Tecachers' as [Name], '2' as orderby
							union
							select 'LTO' as [Code], 'Long Term Occasional Teachers' as [Name], '3' as orderby
							union
							select 'Leave' as [Code], 'Leave Staffs' as [Name], '5' as orderby
							union
							select 'RET' as [Code], 'Retirement Staffs' as [Name], '6' as orderby
							order by orderby, [Code]
					end
				else if @Operate ='Category'
 						select   'EPA' as [Code], 'Educator Performance Appraisal'  as [Name]
						union
						select   'TPA' as [Code], 'Teacher Performance Appraisal'  as [Name]
						union
						select   'PPA' as [Code], 'Principal Performance Appraisal'  as [Name]
						union
						select   'BPA' as [Code], 'Business Leader Performance Appraisal'  as [Name]
						order by [Name]
					else if @Operate ='Phase'
 						select   Appraisal_Phase as [Code], Appraisal_PhaseName  as [Name]
						from  [dbo].[EPA_sys_appraisalPhase] 
						order by [Name]
				else if @Operate ='AppraisalType'
						select Appraisal_Code as [Code], Appraisal_Name  as [Name]
						from  dbo.EPA_sys_appraisalType 
						order by IDs
				else if @Operate ='AppraisalSession'
						select Code as [Code], [Name] 
						from  dbo.EPA_sys_AppraisalSession  where active = 1
						order by IDs
				else if @Operate ='AppraisalArea'
						select  Appraisal_Process as [Code], Appraisal_ProcessName  as [Name]
						from  [dbo].[EPA_sys_appraisalProcess] 
						where Appraisal_Code = @Para1
						order by [Code]
				else if @Operate ='StatementCategory'
				        select 'App' as [Code], 'All Application' as [Name]
						union 
						select Appraisal_Code as [Code], Appraisal_Name  as [Name]
						from  dbo.EPA_sys_appraisalType 
						order by [Code]
				else if @Operate ='StatementNumber'
						select '0' as [Code], '0' as [Name]
						union 
						select  distinct  [No] as [Code],  [No]  as [Name]
						from  [dbo].[EPA_Org_Statements] 
						Where SchoolYear = @Para1 and SchoolCode = @Para2 
 						order by [Code]
				else if @Operate ='StatementArea'
						select 'App' as [Code], 'All Working Area' as [Name]
						union 
						select   Appraisal_Process as [Code], Appraisal_ProcessName  as [Name]
						from  [dbo].[EPA_sys_appraisalProcess] 
 						order by [Code]
				else if @Operate ='AppraisalAreaAll'
				        select 'EPA' as [Code], 'All TPA Appraisal Area' as [Name] 
						union
						select 'PPA' as myVaue, 'All PPA Appraisal Area' as [Name] 
						union
						select   distinct  Appraisal_code as [Code], Appraisal_Text  as [Name]
						from  [dbo].[EPA_sys_Appraisal_Definition] 
						where Area_Step  is not null and Appraisal_Category !='LTO'
						order by [Code]
						 
				else if @Operate ='Process'
				     
						select Appraisal_Step as [Code], Appraisal_StepName  as [Name]  
						from  dbo.EPA_sys_appraisalStep
						order by IDs						
				else if @Operate ='AppraisalProcess'
				     
						select Appraisal_Step as [Code], Appraisal_StepName  as [Name]  
						from  dbo.EPA_sys_appraisalStep
						order by IDs					
				else if @Operate ='AppraisalDomain'
						select  Appraisal_Domain as [Code], Appraisal_DomainName  as [Name]
						from  dbo.EPA_sys_appraisalDomain
						where Appraisal_Code = @Para1  and Active = 1
						order by IDs

 				else if @Operate ='AppraisalCompetency'
						select  Appraisal_Competency as [Code], Appraisal_CompetencyName  as [Name]
						from  dbo.EPA_sys_appraisalDomainCompetency
						where Appraisal_Code = @Para1 and Appraisal_Domain =@Para2  and Active = 1
						order by IDs
				else if @Operate = 'SchoolYear'
				     select distinct  school_year as [Name], school_year as [Code]
					 from  dbo.EPA_Appraisal_StaffListView
					-- where Employee_ID = '00015076'
					order by [Name]
				else if @Operate = 'SchoolYearTo'
				     select distinct  school_year as [Name], school_year as [Code]
					 from  dbo.EPA_Appraisal_StaffListView
					 union 
					 select '20182019'as [Name],'20182019' as [Code]
					-- where Employee_ID = '00015076'
					order by [Name]
				else if @Operate = 'CompetencyRatingList'
				    begin
						if @Para1 ='NTP'
 							 select distinct  Appraisal_Rate as [Name], IDs as [Code]
							 from  [dbo].[EPA_sys_appraisalRating]
							 where IDs in ('3','4','5') 
							 order by IDs
						else
							 select distinct  Appraisal_Rate as [Name], IDs as [Code]
							 from  [dbo].[EPA_sys_appraisalRating]
							 where IDs in ('3','5')   
							 order by IDs						
					end
			else if @Operate = 'RatingList'
				    begin
						if @Para1 ='NTP' and @Para3 ='Appraisal1'		 
 								 select distinct  Appraisal_Rate as [Name], IDs as [Code]
								 from  [dbo].[EPA_sys_appraisalRating]
								 where IDs in ('3','4')
								 order by IDs
			   		    else
								 select distinct  Appraisal_Rate as [Name], IDs as [Code]
								 from  [dbo].[EPA_sys_appraisalRating]
								 where IDs in ('3','5')
								 order by IDs
 			
					end
				else if @Operate = 'SchoolAppraiser'
					begin
					    if @Para3 ='PPA' 
							select ' ' as [Name], '0000' as [Code]
							union
						   	select   dbo.EPA_getUserNamebyID(Employee_ID) as [Name], userID as [Code]						   
							from dbo.EPA_Appr_EmployeeList  
							where Appraisal_year = @Para1 and Unit_ID = @Para2 and Appraisal_Role in ('Principal','Coordinator') and Appraisal_Status='Active'
							union
							select   dbo.EPA_getUserNamebyID(SuperID) as [Name], SuperID as [Code]						   
							from [dbo].[EPA_Org_RegionArea]   -- dbo.EPA_Appr_EmployeeList  
							where  AreaCode = ( select top 1 Area from dbo.EPA_Org_Schools where UnitCode = @Para2)
						else
							select ' ' as [Name], '0000' as [Code]
							union
							select   dbo.EPA_getUserNamebyID(Employee_ID) as [Name], userID as [Code]						   
							 from dbo.EPA_Appr_EmployeeList  
							where Appraisal_year =@Para1 and Unit_ID = @Para2 and Appraisal_Role in('VP','Principal','Coordinator','Superintendent') and Appraisal_Status='Active'
					end
				else if @Operate = 'SchoolMentor'
					begin
					    select ' ' as [Name], '0000' as [Code]
						union
						select  E.FullName as [Name], E.UserID as [Code]						   
						from dbo.EPA_Org_EmployeeList  as E
						inner join dbo.EPA_Appr_EmployeeList as A on E.Employee_ID =A.Employee_ID
						where  A.Appraisal_year = @Para1 and  A.Unit_ID = @Para2  and A.Appraisal_Status ='Active' and A.Appraisal_Cycle in ('E','NE1','NE2','NE3','NE4')
					end				 
				else if @Operate = 'DomainList'
					begin
 						select  appraisal_domainName  as [Name],appraisal_domain as [Code]						   
						from [dbo].[EPA_sys_appraisalDomain] 
						where Appraisal_Code ='EPA'
 						order by [Code]  
					end				 
				else if @Operate = 'DomainListcBank'
					begin
						select '<- select Item ->' as [Name], '' as [Code]
						union
					    select 'General Comments' as [Name], '0' as [Code]
						union
 						select  appraisal_domainName  as [Name],appraisal_domain as [Code]						   
						from [dbo].[EPA_sys_appraisalDomain] 
						where Appraisal_Code ='EPA'
 						order by [Code]  
					end		
			
				else if @Operate = 'SharedListcBank'
					begin
					    select '<- select Item->' as [Name], '' as [Code]
						union 
 						select  distinct Shared  as [Name],Shared as [Code]						   
						from     [dbo].[EPA_sys_CommentsBank]  --where shared in ('Sattisfactory','Unsattisfactory')
						where Owner in ('0000','0529') and shared in ('Satisfactory','Unsatisfactory','Catholic Look Fors')
  						order by [Code]  
					end					 
			   else if @Operate = 'CompetencyList'
					begin
 						select  Appraisal_CompetencyName   as [Name],Appraisal_Competency as [Code]						   
						from [dbo].[EPA_sys_appraisalDomainCompetency] 
						where Appraisal_Code ='EPA' and Appraisal_Domain = @Para1
 						order by [Code]  
					end				 
			end
 
 
 END 
 

  






















