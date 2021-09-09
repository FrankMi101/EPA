



 

 
-- ==================================================================================
-- Author:		Frank Mi
-- Create date: June 04, 2020 
-- Description:	get list image icon
-- ================================================================================== 

CREATE FUNCTION [dbo].[EPA_getImageIcon]
(@Type	varchar(30) )

RETURNS varchar(100)
AS 
  BEGIN
		declare @rValue varchar(100) 
    if @Type = 'Save'
		set @rValue =  '<img border="0" width="20" height="20" src="../images/save.png" />'
    else if @Type = 'Delete'
		set @rValue =  '<img border="0" width="20" height="20" src="../images/delete.png" />'
    else if @Type = 'Edit'
		set @rValue =   '<img border="0" width="23" height="23" src="../images/Edit.png" />'
    else if @Type = 'Edit2'
		set @rValue =  '<img border="0" width="23" height="23" src="../images/Edit2.jpg" />'
    else if @Type = 'Action'
		set @rValue =  '<img border="0" width="23" height="23" src="../images/action.png" />'
    else if @Type = 'Action2'
		set @rValue =  '<img border="0" width="23" height="23" src="../images/action2.png" />'
    else if @Type = 'Note'
		set @rValue =  '<img border="0" width="23" height="23" src="../images/Note.png" />'
    else if @Type = 'Notice'
		set @rValue =   '<img border="0" width="23" height="23" src="../images/Notice.png" />'
    else if @Type = 'LookFors'
	    set @rValue = '<img border="0" width="40" height="23" src="../images/lookFor.png" />'
  return rtrim(ltrim(isnull(@rValue,'')))



 END

  






