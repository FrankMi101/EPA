
 

 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: December 31, 2017 
-- Description:	get and update observation date and comments
-- ==================================================================================
 
CREATE proc [dbo].[EPA_Appr_Report_Observation]   --    'Date','mif','20172018','0529','00010452','Appraisal1','ntp'  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null

as

set nocount on 
 begin
		declare @CompetncyTable as table
		(DomainID  int,
		DomainName varchar(100),
		CompetencyID int, 
		CompetencyName varchar(250),
		SelectedC	   varchar(1),
		Comments	   varchar(250)
		)
	  
	  if @Category ='NTP'
			insert into  @CompetncyTable
			select C.Appraisal_Domain, D.Appraisal_DomainName, C.Appraisal_Competency,   Appraisal_CompetencyName as Competency,
			[dbo].[EPA_appr_AppraisalObservationSelected](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'OBS21',C.Appraisal_Domain,C.Appraisal_Competency) as SelectC,
			[dbo].[EPA_appr_AppraisalObservationNotes](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'OBS21',C.Appraisal_Domain,Appraisal_Competency) as Comments
			from 	[dbo].[EPA_sys_appraisalDomainCompetency] as C
			inner join [dbo].[EPA_sys_appraisalDomain]  as D  on C.Appraisal_Domain = D.Appraisal_Domain and D.Appraisal_Code ='TPA'
			where C.Appraisal_Code = 'TPA'  and Evidence_Level ='8'
			order by C.Appraisal_Domain, C.Appraisal_Competency
	  else
			insert into  @CompetncyTable
			select C.Appraisal_Domain, D.Appraisal_DomainName, C.Appraisal_Competency,   Appraisal_CompetencyName as Competency,
			[dbo].[EPA_appr_AppraisalObservationSelected](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'OBS21',C.Appraisal_Domain,C.Appraisal_Competency) as SelectC,
			[dbo].[EPA_appr_AppraisalObservationNotes](@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'OBS21',C.Appraisal_Domain,Appraisal_Competency) as Comments
			from 	[dbo].[EPA_sys_appraisalDomainCompetency] as C
			inner join [dbo].[EPA_sys_appraisalDomain]  as D  on C.Appraisal_Domain = D.Appraisal_Domain and D.Appraisal_Code ='TPA'
			where C.Appraisal_Code = 'TPA' -- @Category
			order by C.Appraisal_Domain, C.Appraisal_Competency

		declare @DateOfObservation varchar(10), @AppraiseeName varchar(50), @ObservationNote  varchar(1000)
		select   top 1  @DateOfObservation =  [dbo].[DateF]([Observation_Date],'YYYYMMDD') ,
						@AppraiseeName = [dbo].[EPA_getUserNamebyID](@EmployeeID),
						@ObservationNote = isnull(Observation_Note,'')
		from  [dbo].[EPA_Appr_Comments_Observation]
		where School_Year =@SchoolYear and School_Code = @SchoolCode and SessionID = @SessionID and EmployeeID = @EmployeeID and ItemCode = 'OBS22' 
		 

		select DomainID ,DomainName, CompetencyID,CompetencyName,
		  SelectedC  ,
		  Comments,
	  	 ROW_NUMBER() OVER(ORDER BY DomainID, CompetencyID ) AS RowNo,
		 @DateOfObservation as ObsDate ,
		 @AppraiseeName		as AppraiseeName,
		 @ObservationNote	as ObservationNote
		from @CompetncyTable
		order by RowNo
 
 end

-- select * from [dbo].[EPA_sys_appraisalDomainCompetency]
