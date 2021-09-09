


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: January 3, 2018 
-- Description:	get NTIP two satisfactory appraisal complete
-- ================================================================================== 
 

CREATE FUNCTION [dbo].[EPA_appr_checkCompleteTwoSatisfactory]
(	
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20) = null,
	@ItemCode		varchar(10) = null,
	@Category		varchar(10) = null
)
RETURNS varchar(10)
AS 
  BEGIN
		declare @rValue varchar(10) , @signCount int

		set @rValue  =  ( select count(*) from [dbo].[EPA_Appr_Rating]
					where School_Year between   [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@SchoolYear ) and  @SchoolYear  
					and EmployeeID =@EmployeeID  and Category  =  @Category and ItemCode = 'SUM61'  and Appraisal_Chose ='3' )
  

        if @rValue = 2
		   begin
				set @SessionID = (select top 1 SessionID from [dbo].[EPA_Appr_Rating] 
								  where School_Year between   [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@SchoolYear ) and  @SchoolYear  
								  and EmployeeID =@EmployeeID  and Category  =  @Category and ItemCode = 'SUM61'  and Appraisal_Chose ='3' 
								  order by SessionID Desc)
				set @SignCount = (select count(*) from [dbo].[EPA_Appr_SignOff]
								  where School_Year = @SchoolYear and SChool_code = @SchoolCode and SessionID =@SessionID 
								  and EmployeeID =@EmployeeID  and Category = @Category and ItemCode = 'SUM95' and SignOff_Action in ('Sign Off','Demand Undo Sign Off') and isnull([Signature],'') !='' 
								  )
				if @SignCount = 2
					set @rValue ='Yes'
				else
					set @rValue ='No'
		   end
		else
			set @rValue ='No'
		 
		RETURN(@rValue)
 END

   
