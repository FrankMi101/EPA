





-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 02, 2018 
-- Description:	get experience teacher Improvement plan report
-- ================================================================================== 
 
-- drop proc dbo.EPA_Appr_Report_StrategyNTP    'report','mif', '20172018','0529', '00010461','Appraisal1','NTP'
 create proc [dbo].[EPA_Appr_Report_StrategyNTP]  
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null
as
set nocount on
-- select * from  [dbo].[EPA_Appr_Comments
--set @Domain = dbo.tcdsb_Login(@UserID,'Domain')
 
declare @Goal11     varchar(500) -- Orientation Board level Professional Goal 
declare @Strategy11 varchar(500) -- Orientation Board level Strategy 
declare @Initial11   varchar(10)  -- Orientation Board level Principal initial 

declare @Goal12 varchar(500) -- Orientation School level Professional Goal 
declare @Strategy12 varchar(500) -- Orientation School level Strategy 
declare @Initial12 varchar(50)  -- Orientation School level Principal initial

declare @Goal21     varchar(500) -- Professional Development and Training Classroom Management Professional Goal 
declare @Strategy21 varchar(500) -- Professional Development and TrainingClassroom Management Strategy 
declare @Initial21   varchar(10) -- Professional Development and TrainingClassroom Management Principal initial 
declare @Goal22     varchar(500) -- Professional Development and Traininglanning, Assessment and Evaluation Professional Goal 
declare @Strategy22 varchar(500) -- Professional Development and Traininglanning, Assessment and Evaluation Strategy 
declare @Initial22  varchar(10)  -- Professional Development and Traininglanning, Assessment and Evaluation Principal initial 
declare @Goal23     varchar(500) -- Professional Development and TrainingCommunication with Parents Professional Goal 
declare @Strategy23 varchar(500) -- Professional Development and TrainingCommunication with Parents Strategy 
declare @Initial23   varchar(10) -- Professional Development and TrainingCommunication with Parents Principal initial 
declare @Goal24     varchar(500) -- Professional Development and TrainingTeaching Students with Special Needs and Other Divers Learners Professional Goal 
declare @Strategy24 varchar(500) -- Professional Development and TrainingTeaching Students with Special Needs and Other Divers Learners Strategy 
declare @Initial24   varchar(10) -- Professional Development and TrainingTeaching Students with Special Needs and Other Divers Learners Principal initial 
declare @Goal25     varchar(500) -- Professional Development and TrainingCurrent Education Priorities  Professional Goal 
declare @Strategy25 varchar(500) -- Professional Development and TrainingCurrent Education Priorities  Strategy 
declare @Initial25   varchar(10) -- Professional Development and TrainingCurrent Education Priorities  Principal initial 

declare @Goal31     varchar(500) -- Mentoring Development of NTIP Individual Strategy with Mentor Professional Goal 
declare @Strategy31 varchar(500) -- Mentoring Development of NTIP Individual Strategy with Mentor Strategy 
declare @Initial31   varchar(10) -- Mentoring Development of NTIP Individual Strategy with Mentor Principal initial 
declare @Goal32     varchar(500) -- Mentoring Mentoring activities Professional Goal 
declare @Strategy32 varchar(500) -- Mentoring Mentoring activities Strategy 
declare @Initial32  varchar(10)  -- Mentoring Mentoring activities Principal initial 


select @Goal11 = Goal ,@Strategy11 = Strategy ,@Initial11 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR111'
select @Goal12 = Goal ,@Strategy12 = Strategy ,@Initial12 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR112'
 
select @Goal31 = Goal ,@Strategy31 = Strategy ,@Initial31 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR331'
select @Goal32 = Goal ,@Strategy32 = Strategy ,@Initial32 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR332'

select @Goal21 = Goal ,@Strategy21 = Strategy ,@Initial21 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR221'
select @Goal22 = Goal ,@Strategy22 = Strategy ,@Initial22 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR222'
select @Goal23 = Goal ,@Strategy23 = Strategy ,@Initial23 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR221'
select @Goal24 = Goal ,@Strategy24 = Strategy ,@Initial24 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR222'
select @Goal25 = Goal ,@Strategy25 = Strategy ,@Initial25 = Principal_Initail from [dbo].[EPA_Appr_Strategy] where School_Year =@SchoolYear and School_Code =@SchoolCode and EmployeeID =@EmployeeID and SessionID = @SessionID and ItemCode ='STR221'
 

declare @SUM11 varchar(4000) --ENP21 - Expectation 
 declare @STR72 varchar(4000) --ENR73 - Teacher's Comments on the Enrichment Plan (Optional)
  
  set @SUM11 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'SUM11') 
  set @STR72 =  dbo.EPA_getAppraisalComments(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'STR72') 
    
  --declare @DateNext  varchar(10) -- Date of Next Performance Appraisal    
  --set @DateNext =  dbo.EPA_getAppraisalCommentSmall(@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,'ENR95','Date') 
select 
	 	
  	isnull(@SUM11,'') as SUM11,
  	isnull(@STR72,'') as STR72,
 	isnull(@Goal11,'') as Goal11,
	isnull(@Goal12,'') as Goal12,
	isnull(@Goal21,'') as Goal21,
	isnull(@Goal22,'') as Goal22,
	isnull(@Goal23,'') as Goal23 ,
	isnull(@Goal24,'') as Goal24 ,
	isnull(@Goal25,'') as Goal25 ,
	isnull(@Goal31,'') as Goal31,
	isnull(@Goal32,'') as Goal32,
 	isnull(@Strategy11,'') as Strategy11,
	isnull(@Strategy12,'') as Strategy12,
	isnull(@Strategy21,'') as Strategy21,
	isnull(@Strategy22,'') as Strategy22,
	isnull(@Strategy23,'') as Strategy23 ,
	isnull(@Strategy24,'') as Strategy24 ,
	isnull(@Strategy25,'') as Strategy25 ,
	isnull(@Strategy31,'') as Strategy31,
	isnull(@Strategy32,'') as Strategy32,

	isnull(@Initial11,'') as Initial11,
	isnull(@Initial12,'') as Initial12,
	isnull(@Initial21,'') as Initial21,
	isnull(@Initial22,'') as Initial22,
	isnull(@Initial23,'') as Initial23 ,
	isnull(@Initial24,'') as Initial24 ,
	isnull(@Initial25,'') as Initial25 ,
	isnull(@Initial31,'') as Initial31,
	isnull(@Initial32,'') as Initial32,
	 *
 from dbo.EPA_getReportSignature(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,'ENR95') 


 
-- select * from EPA_Appr_Comments where EmployeeID='00010461'  and SessionID ='Appraisal1' 
--   select * from [dbo].[EPA_Appr_Comments_small] where EmployeeID='00014245'  and SessionID ='Appraisal1' 



--select * from [dbo].[EPA_Appr_Strategy] where EmployeeID='00010461'

-- select * from EPA_Appr_Comments   where EmployeeID='00010461'
