


-- Drop proc dbo.EPA_sys_MenuItemName
CREATE Procedure [dbo].[EPA_sys_MenuItemName]
 	( @Operate		varchar(30),
	  @UserID		varchar(30) ='upaUser',
  	  @Category		varchar(10) = 'TPA', 
	  @Area			varchar(20) = null, 
	  @Code			varchar(10) = null 
	)
AS
BEGIN 
	set nocount on 
	if @Area is null
	    select top 1 Appraisal_Text  from [dbo].[EPA_sys_Appraisal_Definition] where Appraisal_Category = @Category  and Area_Step is not null
	else if @Code is null
		select top 1 Appraisal_Text from [dbo].[EPA_sys_Appraisal_Definition] where Appraisal_Category = @Category  and  Appraisal_Area = @Area  and Area_Step is not null
    else
		begin
			if exists (select * from [dbo].[EPA_sys_Appraisal_Titles]where Appraisal_Category = @Category  and  Appraisal_Area = @Area  and Appraisal_Code =  @Code )
				select top 1 Title from [dbo].[EPA_sys_Appraisal_Titles] where Appraisal_Category = @Category  and  Appraisal_Area = @Area  and Appraisal_Code =  @Code 
			else
				select top 1 Appraisal_Text from [dbo].[EPA_sys_Appraisal_Definition] where Appraisal_Category = @Category  and  Appraisal_Area = @Area  and Appraisal_Code =  @Code 
		end
END
		