 


--  drop proc dbo.tcdsb_TPA_Appraisal_SummativeCompetencyNTRubric
--- grant exec on dbo.tcdsb_TPA_Appraisal_SummativeCompetencyNTRubric to companion

CREATE procedure [dbo].[EPA_Appr_DomainCompetencyRubric] --'Unsatisfactory','mif','20172018','0529','0554293','','','1','1'
 	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10)= null ,
	@DomainID		varchar(10)= null,
	@CompetencyID	varchar(10)=null  

as
set nocount on
declare @Gender varchar(2), @Rubric varchar(400), @Rubric1 varchar(35) , @Rubric2  varchar(150)
set @Gender = [dbo].[EPA_Staff.Gender](@EmployeeID)

select top  1 @Rubric = case @Gender when 'F' then replace(CompetencyS,'his/her','her')
									 when 'M' then replace(CompetencyS,'his/her','his') 
									 else  CompetencyS  end,
			  @Rubric1 = RubricType			 
             from dbo.EPA_sys_AppraisalDomainCompetencyRubric 
			  where DomainID = @DomainID and Competency_ID = @CompetencyID
 
  
set @Rubric1 =  case @Operate
				when 'Satisfactory'		then case @Rubric1  when 'I'   then 'considerable'
															when 'II'  then 'to a considerable extent'
															when 'III' then 'with considerable effectiveness' end 
				when 'Development Needed'	then case @Rubric1  when 'I'   then 'some'
															when 'II'  then 'to some extent'
															when 'III' then 'with some effectiveness' end 
				when 'UnSatisfactory'	then case @Rubric1  when 'I'   then 'limited'
															when 'II'  then 'to a limited extent'
															when 'III' then 'with limited effectiveness' end 
                end
set @Rubric2 = case @Operate 
				when 'Satisfactory'		then 'The teacher shows continued growth in this competency.'
				when 'UnSatisfactory'	then 'The teacher requires extensive improvement in this competency.'
				when 'Development Needed'	then 'The teacher would benefit from intensive support to further develop this competency.'
				end
    
--select  replace(@Rubric,'[RubricType]',@Rubric1) +  char(13) +char(10) + @Rubric2  as rValue
select  replace(@Rubric,'[RubricType]',@Rubric1) +  '. '  + @Rubric2  as rValue
 


