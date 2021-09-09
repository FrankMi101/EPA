




 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: February 24, 2018
-- Description:	update staff appraisal progress status
-- ==================================================================================
 
 --    [dbo].[EPA_Appr_AppraisalProcess_UpdateResult]  'SUM95','SignOff','mif','20172018','0529','00013254', 'Appraisal2', 'TPA','SUM','SUM95'
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_UpdateResult]  
	@Operate		varchar(30),
	@Action			varchar(20) =null,
	@UserID			varchar(30)=null,
	@SchoolYear		varchar(8) = null, -- could be user role
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@Category		varchar(10) = null,
	@Area			varchar(10) = null,
	@ItemCode		varchar(10) = null 
as

set nocount on
declare @Ratelevel int, @sCount int,@sCount2 int, @AppraisalX varchar(50), @AppraisalNext varchar(50), @AppraisalResult  varchar(50)
select  @AppraisalX ='Incompleted' , @AppraisalNext ='', @AppraisalResult=''
set @sCount =(select count(*) from [dbo].[EPA_Appr_SignOff] where  School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode ='SUM95' and Category = @Category  and SignOff_Action = 'Sign Off' and SignOff_Type != 'Supervisory')
set @Ratelevel =  (select top 1 Appraisal_chose from [dbo].[EPA_Appr_Rating] where School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode ='SUM61' and Category = @Category  ) 
if @Ratelevel is not null set @AppraisalX =  dbo.EPA_GetRateByLevel(@Ratelevel,@Category)
-- select   @sCount , @Ratelevel , @AppraisalX
   

if @ItemCode ='SUM61'
	select  @AppraisalX ='SignOff Required' , @AppraisalResult = 'Appraiser SignOff Required'
else if  @Action ='Undo Sign Off'
    select @AppraisalX ='SignOff Required'  , @AppraisalResult = 'Appraiser SignOff Required'
else if @ItemCode ='SUM95'
	begin
      if @Category ='NTP'
		  begin
				if @sCount =2  
					begin
						declare @SatisfactoryC int, @PreYear varchar(8),@PreCategory varchar(10)
						set @PreYear = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@SchoolYear)
						--set @PreCategory =[dbo].[EPA_getAppraisalCategory](@preYear,@SchoolCode,@EmployeeID)
						--if  @PreCategory != @Category  set @preYear = @SchoolYear --- only previous school year is NTP need to check previous year appraisal rate

						set @SatisfactoryC = (select count(*)   from [dbo].[EPA_Appr_Rating] where School_Year between @preYear and  @SchoolYear and EmployeeID = @EmployeeID and Category = @Category  and ItemCode ='SUM61' and  Appraisal_chose ='3' ) -- and School_Code =@SchoolCode
						if @SatisfactoryC >= 2
						     begin
							      set @sCount2 = (select count(*) from [dbo].[EPA_Appr_SignOff] where  School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode ='STR95' and Category = @Category  and SignOff_Action = 'Sign Off' and SignOff_Type != 'Supervisory')
						          if @sCount2 = 2 
								      set  @AppraisalResult = 'Successful completion of NTIP'
								  else if exists ( select * from [dbo].[EPA_Appr_Strategy] where  School_Year = @SchoolYear and School_Code = @SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and len(isnull(Goal,'')) > 2  )
								       set  @AppraisalResult = 'NTIP Strategy Sign off need'
                                  else
									   set  @AppraisalResult = 'Need NTIP Strategy'
							 end	
						else
							set  @AppraisalResult = case right(@SessionID,1) when '1' then 'Need 2nd Appraisal' 
																			 when '2' then 'Need 3rd Appraisal'
																			 when '3' then 'Need 4th Appraisal' else 'Incomplete' end 
					end
				else
					set  @AppraisalResult = @Operate  + ' SignOff Required'
		  end
      else   --  LTO , TPA, PPA
		 begin
				if @sCount =2  
				    set  @AppraisalResult = @AppraisalX
				else
					set  @AppraisalResult =  @Operate  + ' SignOff Required' 
 
		  end
	end	

	update [dbo].[EPA_Appr_EmployeeList] 
	set Appraisal_Result = @AppraisalResult
	where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and Employee_ID = @EmployeeID	and Appraisal_type = @Category

	 
	 
-- select * from  [dbo].[EPA_Appr_EmployeeList]  where   Employee_ID ='00036442'
--- select * from EPA_Appr_SignOff where   EmployeeID ='00036442'
/*
		if @SessionID ='Appraisal1'
			begin				      
 				if @sCount =2 
					begin
						if  @Ratelevel = '3'
							 set  @AppraisalResult = case @Category when 'NTP' then 'Need 2nd Appraisal' else  @AppraisalX end
						else
						     set @AppraisalResult = case @Category when 'NTP' then 'Need 2nd Appraisal' when 'E' then 'Need ' else '' end
					end
			end
		if @SessionID ='Appraisal2'
			begin	      
				if @sCount = 2 
					begin

						--set @Ratelevel =  (select top 1 Appraisal_chose from [dbo].[EPA_Appr_Rating] where School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode ='SUM61') 
						--set @AppraisalX =  dbo.EPA_GetRateByLevel(@Ratelevel,@Category)
						if  @Ratelevel = '3'
							set @AppraisalResult = @AppraisalX
                        else
							set @AppraisalResult = case @Category when 'NTP' then  'Need 3rd Appraisal' when 'E' then '' else '' end
					end		
	   
			end		
		if @SessionID ='Appraisal3'
			begin	      
				if @sCount = 2 
					begin
						--set @Ratelevel =  (select top 1 Appraisal_chose from [dbo].[EPA_Appr_Rating] where School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode ='SUM61') 
						--set @AppraisalX = dbo.EPA_GetRateByLevel(@Ratelevel,@Category)
						if  @Ratelevel = '3'
							set @AppraisalResult = @AppraisalX
                        else
 							set @AppraisalResult = case @Category  when 'NTP' then 'Need 4th Appraisal' else '' end
					end		
	   
			end	
		if @SessionID ='Appraisal4'
			begin	      
				if @sCount = 2 
					begin
						--set @Ratelevel =  (select top 1 Appraisal_chose from [dbo].[EPA_Appr_Rating] where School_Year = @SchoolYear and School_Code =@SchoolCode and EmployeeID = @EmployeeID and SessionID = @SessionID and ItemCode ='SUM61') 
						--set @AppraisalX = dbo.EPA_GetRateByLevel(@Ratelevel,@Category)
						set @AppraisalResult = @AppraisalX
 					end		
	
			end	
*/
/*
if @SessionID ='Appraisal1'								 
  	update [dbo].[EPA_Appr_EmployeeList] 
		set Appraisal_1 =  @AppraisalX , 
			Appraisal_2 = @AppraisalNext,
			Appraisal_Result = @AppraisalResult
	where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and Employee_ID = @EmployeeID	
 
else if @SessionID ='Appraisal2'
 	update [dbo].[EPA_Appr_EmployeeList] 
		set Appraisal_2 = @AppraisalX, --case Appraisal_2 when 'Not Start' then @AppraisalX  when 'Incompleted' then @AppraisalX when  '' then @AppraisalX  else Appraisal_2 end,
			Appraisal_3 = @AppraisalNext,
			Appraisal_Result = @AppraisalResult
	where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and Employee_ID = @EmployeeID	
 
else if @SessionID ='Appraisal3'
	update [dbo].[EPA_Appr_EmployeeList] 
		set Appraisal_3 = @AppraisalX, --case Appraisal_3 when 'Not Start' then @AppraisalX  when 'Incompleted' then @AppraisalX when  '' then @AppraisalX  else Appraisal_3 end,
			Appraisal_4 = @AppraisalNext,
			Appraisal_Result = @AppraisalResult
	where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and Employee_ID = @EmployeeID	
else if @SessionID ='Appraisal4'
	update [dbo].[EPA_Appr_EmployeeList] 
		set Appraisal_4 = @AppraisalX, --case Appraisal_4 when 'Not Start' then @AppraisalX  when 'Incompleted' then @AppraisalX when  '' then @AppraisalX else Appraisal_4 end,
		Appraisal_Result = @AppraisalResult
	where Appraisal_year = @SchoolYear and unit_id = @SchoolCode and Employee_ID = @EmployeeID	
 
*/





