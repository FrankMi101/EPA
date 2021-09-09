 



-- ==================================================================================
-- Author:		Frank Mi
-- Create date: May 09, 2018 
-- Description: check appraisal process sign off
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_NoticeDate]  -- 'Appraiser','mif','20172018','0529','00014245','Appraisal1','SUM','Admin'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@NoticeType		varchar(30)= null, 
	@NoticeArea		varchar(10)= null  

as

set nocount on 
 
select [dbo].[EPA_Appr_CheckNoticeDate]( @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@NoticeType,@NoticeArea )
/*
declare @Appraiser varchar(30) ,@Appraisee varchar(30)
set @ItemCode =case @ItemCode when 'SUM' then 'SUM95'
							 when 'ALP' then 'ALP95'
							 when 'IMP'	then 'IMP95'
							 when 'STR' then 'STR95'
							 when 'AGP' then 'AGP95'
							 when 'ENR' then 'ERN95' 
							 else @ItemCode end

if @Operate ='Both'
   begin
		if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = 'Appraisee' and signature !='')
            if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = 'Appraiser' and signature !='' )
				select 'Complete' as rVal
			else
				select 'Incomplete' as rVal
		else
		   select 'Incomplete'
   end
else
    if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @Operate and signature !='')
         select 'Complete' as rVal
    else
	    select 'Incomplete' as rVal
		  
  */
  








