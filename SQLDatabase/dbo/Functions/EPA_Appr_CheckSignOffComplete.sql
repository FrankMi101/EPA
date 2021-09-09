





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Decmber 07, 2017 
-- Description: check appraisal process sign off
-- ==================================================================================
 
 
CREATE function [dbo].[EPA_Appr_CheckSignOffComplete]  -- 'Appraiser','mif','20172018','0529','00014245','Appraisal1','SUM','Admin'
(	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@ItemCode		varchar(10)= null, 
	@UserRole		varchar(20)= null,
	@Category		varchar(10) =null 
	)

RETURNS varchar(10)
AS 
  BEGIN
		declare @rValue varchar(10)
 		set @ItemCode =case @ItemCode when 'SUM' then 'SUM95'
									 when 'ALP' then 'ALP95'
									 when 'IMP'	then 'IMP95'
									 when 'STR' then 'STR95'
									 when 'AGP' then 'AGP95'
									 when 'ENR' then 'ERN95' 
									 else @ItemCode end

		if @Operate ='Both'
		   begin
		        declare @SignOffCount int 
				set @SignOffCount = (select count(*) from  dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Category = @Category and [signature] !='')
			    if   @SignOffCount >= 2 
					set @rValue = 'Complete' 
				else
					set @rValue ='Incomplete'  
				--if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = 'Appraisee' and signature !='')
				--	if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = 'Appraiser' and signature !='' )
				--		 set @rValue = 'Complete' 
				--	else
				--		 set @rValue ='Incomplete'  
				--else
				--    set @rValue = 'Incomplete'
		   end
		else
			if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Category = @Category and SignOff_Type = @Operate and [signature] !='')
				  set @rValue = 'Complete' 
			else
				 set @rValue = 'Incomplete' 
		  
		RETURN(@rValue)
 END

   

    

  







