 

-- Drop proc dbo.EPA_sys_Title2
CREATE Procedure [dbo].[EPA_sys_StoreProcedureName]
	(	@Action		varchar(100) ='AppraisalCategory',
		@ClassName	varchar(100) ='AppraisalManage' 
	)

 
AS
set nocount on
BEGIN 
	if exists (select * from  [dbo].[EPA_sys_SPNameAndParameters]  where ClassName = @ClassName and [Action] = @Action)
			select top 1 ltrim(rtrim(SPName)) + ' ' + ltrim(rtrim([Parameters])) 
			from [dbo].[EPA_sys_SPNameAndParameters]  where ClassName = @ClassName and [Action] = @Action		
 	else
				 
			select  'No SP Yet' as rValue
  
END

