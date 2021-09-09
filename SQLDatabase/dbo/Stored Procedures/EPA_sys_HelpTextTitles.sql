


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 25, 2017 
-- Description:	get appraisal left menu items based on the category, area and employee ID
-- ==================================================================================

CREATE Procedure [dbo].[EPA_sys_HelpTextTitles]
 	( @Operate		varchar(30),
	  @UserID		varchar(30) ='upaUser',
  	  @Category		varchar(10) = 'Sys-Profile', 
	  @Area			varchar(20) = null, 
	  @Code			varchar(10) = null, 
	  @Title		varchar(200) = null, 
	  @SubTitle		varchar(500) = null 
 	)

 
AS
 
  
BEGIN 
	if @Title is null
		begin
			if exists (select * from [dbo].[EPA_sys_Appraisal_Titles]   where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
				set @Title = (select top 1 
				   Case @Operate when 'Title' then 	isnull(Title, 'Title of ' + @Category + ' ' +  @Area + ' ' + @Code)  
				   else isnull(SubTitle, ' Sub Title  of ' + @Category + ' ' +  @Area + ' ' + @Code ) end
 				   from  dbo.EPA_sys_Appraisal_Titles  where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)			
 			else
			    if exists (select * from [dbo].[EPA_sys_Appraisal_Definition] where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
				   set @Title = (select top 1  case @Operate when 'Title' then  Appraisal_Text else '' end
								 from [dbo].[EPA_sys_Appraisal_Definition] where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
            else
				set @Title = case @Operate when 'Title' then 'Title of ' +  @Category + ' ' +  @Area + ' ' + @Code	 else '' end  

			select  @Title as rValue
 
		end
	else
	  begin
		  begin try
	    
				if exists (select * from dbo.EPA_sys_Appraisal_Titles where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
					update dbo.EPA_sys_Appraisal_Titles
					set Title = @Title, SubTitle =@SubTitle
					where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code
				else
					insert into dbo.EPA_sys_Appraisal_Titles
							( Appraisal_Category,Appraisal_Area, Appraisal_Code, Title, SubTitle,lu_User,lu_Function, lu_Date)
					values(	@Category,@Area, @Code,	@Title ,@SubTitle ,@UserID, app_name(),getdate())

              select 'Successful' as rValue
		   end try
		   begin catch
		       Rollback tran
		      select 'Failed' as rValue
		   end catch
	   end
END







