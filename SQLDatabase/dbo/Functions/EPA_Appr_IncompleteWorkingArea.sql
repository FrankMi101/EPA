





 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 13 , 2018 
-- Description:	check ALP complete Result
-- ==================================================================================
  

CREATE FUNCTION [dbo].[EPA_Appr_IncompleteWorkingArea]
(	@SchoolYear		varchar(8) = null, -- could be user role
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null
 )
  

RETURNS varchar(3)
AS 
  BEGIN
		declare @preYear2 varchar(8), @LastSessionID varchar(10), @ItemCode varchar(10)
			   set @preYear2 = [dbo].[EPA_CurrentSchoolYearPreNext]('Previous',@SchoolYear)
			   set @LastSessionID = ( select top 1  SessionID from dbo.EPA_Appr_SignOff  
										where School_Year =  @preYear2  and EmployeeID = @EmployeeID and ItemCode ='SUM95' and SignOff_Action ='Sign Off'
										order by SessionID DESC )	
				declare @CountTable as table 
				(itemcode varchar(10),
				 SignOffCount int)	
				insert into  @CountTable		 				    
                select  ItemCode, count(*) from    dbo.EPA_Appr_SignOff 
			        where School_Year =  @preYear2  and EmployeeID = @EmployeeID  and SignOff_Action ='Sign Off'
					group by ItemCode
					having count(*) < 2
               set @ItemCode = ( select top 1 itemcode  from @CountTable  where SignOffCount = 1)

				 
	  
   return   left(isnull(@ItemCode,'SUM'),3)
End	 






