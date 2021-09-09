

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: March 3, 2018
-- Description:	Appraisla staff rollover for Next school year 
-- ==================================================================================
 
 --    [dbo].[EPA_Appr_AppraisalProcess_RollOver]  ' ', 'mif','20182019','20192020', '0' ,'00024763', 'Appraisal4', 'TPA','SUM','SUM95'
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_RollOver]  
	@Operate		varchar(30),
	@UserID			varchar(30) = null,
	@FromSchoolYear		varchar(8) = null, -- could be user role
	@ToSchoolYear		varchar(8) = null, -- could be user role
	@SchoolCode		varchar(8) = null 
as

set nocount on
if  @SchoolCode is null
   set @SchoolCode ='%'
else
	set @SchoolCode = @SchoolCode + '%'	

if  @Operate ='RolloverList'
    begin
	
		declare @PS     varchar(7), @PreviousYear varchar(8),@NextYear varchar(8)
	    set @PreviousYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@FromSchoolYear) 
	    set @NextYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Next',@FromSchoolYear) 

		set @PS = ''','''


 		select  'ID' + School_Year  + School_code + A.Employee_ID + A.TeacherName as myKey, School_Year as SchoolYear ,School_code as SchoolCode, A.Employee_ID as EmployeeID,

			'<a title="More Appraisal Action on '+ TeacherName + ' " href="javascript:OpenMenu(''' 
			 + cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS + 'Appraisal1' + @PS  + A.TeacherName +  ''')" >' 
 			 + dbo.EPA_Appr_Status_Img('Notes','',A.Employee_ID,A.School_year,A.Appraisal_Type)  + '</a>'  as [Action],   
			case A.ALP_Result when  '' then A.ALP_Result else '<a title="Open ' + TeacherName + '`s ALP " href="javascript:OpenALP(''' 
			+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code   + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
			+ dbo.EPA_Appr_Result_Img('ALP', A.ALP_Result,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>' end as ALP,
			case  A.Appraisal_Process  when '' then  A.Appraisal_Process else
			'<a title="Open ' + TeacherName + '`s Appraisal Process " href="javascript:OpenAppraisal(''' 
			+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code    + @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')" >' 
			+ dbo.EPA_Appr_Result_Img('PPX', A.Appraisal_Process,A.Employee_ID,A.School_year,A.Appraisal_Type ) + '</a>' end as EPA,
    
			'<a title="View ' + TeacherName + ' Process Detail" href="javascript:OpenHistory(''' 
			+ cast(A.Employee_ID as  varchar(15)) + @PS + A.School_year  + @PS + A.School_code +   @PS +  A.Appraisal_Type + @PS +  A.AppraisalPhase + @PS +  A.TeacherName +  ''')">' + A.TeacherName + '</a>' as TeacherNameL,   
		 
			Appraisal_Status  as AppraisalStatus,
			'<a title="Start Date:' + dbo.DateF(StartDate,'YYYYMMDD') + ' End Date:' +   dbo.DateF(EndDate,'YYYYMMDD') + '" href="#">' + 	isnull(A.Appraisal_Type,'') + '</a>'  as AppraisalType,


			dbo.EPA_getAppraisalPhase(A.AppraisalPhase) as AppraisalPhase,
			dbo.EPA_getAppraisalPhase(dbo.EPA_getAppraisalPhaseByYear(A.Employee_ID, @PreviousYear) ) as AppraisalPhaseP,
			dbo.EPA_getAppraisalPhase(dbo.EPA_getAppraisalPhaseByYear(A.Employee_ID, @NextYear) ) as AppraisalPhaseN,

			
 			dbo.EPA_getUserNamebyID(Appraiser) as Appraiser, 		 
			A.CurrentSession,  A.Appraisal_Process as AppraisalProcess,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_1,''))	as Appraisal1,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_2, ''))	as Appraisal2 ,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_3,''))	as Appraisal3,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisal_4, ''))	as Appraisal4 ,
			[dbo].[EPA_Appr_Result_Show](isnull(A.Appraisaloutcome,'')) as AppraisalOutcome ,
			isnull(A.Assignment,'')		as Assignment,
			isnull(A.Comments,'')		as Comments,
			dbo.EPA_getSchoolName(A.School_Code,'Name')  as School,
  			A.TeacherName ,
			dbo.EPA_getUserNamebyID(Mentor) as  Mentor,
			Employee_Position as EmployeePosition,
   		  ROW_NUMBER() OVER(ORDER BY   A.Appraisal_Type,  A.AppraisalPhase, A.TeacherName ) AS RowNo 
			from  dbo.EPA_Appraisal_StaffListView  as A 
			where  School_Year = @FromSchoolYear  and  School_Code like( @SchoolCode )
  			order by  RowNo
	End
else if exists(select * from dbo.EPA_Appr_EmployeeList  where Appraisal_year =    @ToSchoolYear and Unit_ID  like( @SchoolCode))
   select 'Rollover dose not need' as rValue
else 
   begin   
      begin try
		   begin tran
				insert into  dbo.EPA_Appr_EmployeeList 
				( UserID,Appraisal_year,Unit_ID, Employee_ID,Appraisal_Status,Appraisal_type,Appraisal_Cycle, EvidenceLevel, Appraisal_Role, Appraiser,Mentor,Assignment, TimeType, Appraisal_Result, Appraisal_Process, StartDate, EndDate, lu_date,lu_user,lu_function)

				select  
					UserID,@ToSchoolYear,School_Code, Employee_ID,Appraisal_Status,
					case Appraisal_type when 'NTP' then case Appraisaloutcome  when 'Successful completion of NTIP' then 'TPA' else Appraisal_type end  else Appraisal_type end,
					dbo.EPA_getAppraisalCycle(Appraisal_type, Appraisalphase, Appraisaloutcome) as Appraisal_Cycle, 
					'0' as  EvidenceLevel, 
					 dbo.EPA_getAppraisalRole(Employee_ID) as Appraisal_Role, 
					Appraiser, Mentor, Assignment, TimeType, '' as Appraisal_Result, '' as Appraisal_Process,
					dbo.DateFC(left(@ToSchoolYear,4) + '-09-01','YYYYMMDD') as Startdate, dbo.DateFC(right(@ToSchoolYear,4) + '-06-30','YYYYMMDD') as EndDate,
					 getdate(),@UserID,app_name() 
 
				from [dbo].[EPA_Appraisal_StaffListView] --dbo.EPA_Appr_EmployeeList 
				where School_Year = @FromSchoolYear and School_Code like (@SchoolCode ) and Appraisal_Status !='Retired'
				order by School_Code


				update dbo.EPA_Appr_EmployeeList 
				set EvidenceLevel = case Appraisal_type when 'TPA' then '16' when 'LTO' then '0' else '8' end,
						   Mentor = case  Appraisal_type when 'TPA' then '' else Mentor end,
					ALP_Result = case Appraisal_type when 'NTP' then  '' when 'LTO' then '' else 'Not Start' end 

				where Appraisal_year = @FromSchoolYear and Unit_ID like (@SchoolCode ) 

				
				update  [dbo].[EPA_sys_AppraisalYearCurrent]  set Current_Year = @ToSchoolYear
				where Unit_ID like   (@SchoolCode ) 
 

		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
	    



	end
 


