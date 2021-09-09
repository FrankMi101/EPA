







 
 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: October 28, 2020
-- Description:	Get Appraisal List action filed
-- ==================================================================================
  

CREATE FUNCTION [dbo].[EPA_Appr_ListAction]
(@ActionType		varchar(10),
 @AppraisalYear		varchar(8),
 @AppraisalSchool	varchar(8),
 @EmployeeID		varchar(15),
 @AppraisalType		varchar(10),
 @AppraisalPhase	varchar(10),
 @ProcessReult		varchar(50), --  can be ALP_result
 @TeacherName		varchar(50),
 @IDs				varchar(10)
 )

RETURNS varchar(500)
AS 
  BEGIN	
	declare @rValue varchar(500), @PS varchar(7), @Para  varchar(100)
    set @PS = ''','''
	set @Para = @EmployeeID + @PS + @AppraisalYear  + @PS + @AppraisalSchool   + @PS +  @AppraisalType + @PS +  @AppraisalPhase + @PS +  @TeacherName 

		if @ActionType ='ApprAction'
			set @rValue =	'<a title="More Appraisal Action on '+ @TeacherName + ' " href="javascript:OpenMenu(''' 
						+ @IDs + @PS  + @Para + @PS + 'Appraisal1' +  ''')" >' 
 						+ dbo.EPA_Appr_Status_Img('Notes','',@EmployeeID,@AppraisalYear,@AppraisalType)  + '</a>'  
		else if @ActionType = 'ApprALP'
			 set @rValue =	case @AppraisalType  when 'LTO' then '' when 'NTP' then '' 
							else '<a title="Open ' + @TeacherName + '`s ALP " href="javascript:OpenALP(''' + @Para +  ''')" >' 
								+	case  @ProcessReult when  '' then  dbo.EPA_Appr_Result_Img('ALP','Not Start',@EmployeeID,@AppraisalYear,@AppraisalType) + '</a>'
									else  dbo.EPA_Appr_Result_Img('ALP',@ProcessReult, @EmployeeID,@AppraisalYear,@AppraisalType) + '</a>' 
									end 
							end	
		else if @ActionType ='ApprEPA'	 																		
			 set @rValue =	case  @ProcessReult  when '' then  @ProcessReult
							else '<a title="Open ' + @TeacherName + '`s Appraisal Process " href="javascript:OpenAppraisal(''' 
								+ @Para +  ''')" >' 
								+ dbo.EPA_Appr_Result_Img('PPX', @ProcessReult, @EmployeeID,@AppraisalYear,@AppraisalType ) + '</a>' 
							end 
    
       else if @ActionType ='ApprYear'
			set @rValue = '<a title="View ' + @TeacherName + '`s ' + @AppraisalYear + ' appraisal Process Detail" href="javascript:OpenAppraisal(''' 
						+ @Para +  ''')">' +  @AppraisalYear + '</a>'

       else if @ActionType ='ApprName'
			set @rValue = '<a title="View ' + @TeacherName + '(' +  @EmployeeID + ') Process Detail" ' + 'href="javascript:OpenHistory(''' 
						+ @Para  +  ''')">' + @TeacherName + '</a>' 
						 
 

	set @rValue =  isnull(@rValue,'No Actions') 
	   
	return @rValue
END  
  


 





