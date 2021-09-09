

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 1, 2020 
-- Description:	get and update EPA title and help 
-- ==================================================================================
--				[dbo].[EPA_sys_HelpTitleContentSP] 'Read','mif','LTO','All','Summary1','Title'  
CREATE Procedure [dbo].[EPA_sys_HelpTitleContentSP]  
 	(	@Operate		varchar(30)= null,	
		@UserID			varchar(50) ='upaUser',
		@Category		varchar(10) ='UPA',
		@Area			varchar(20) = 'Sys-Profile', 
		@Code			varchar(20) = null, 
		@ContentType	varchar(20) = null, 
		@Value			varchar(2000) = null 
 	)

 
AS
 
-- select * from      EPA_sys_HelpTitleContent    order by ids  where  contentType ='Help' and  category ='TPA' and area ='ManageList'
  


BEGIN 
	if @Value is null
		begin
			if exists (select * from dbo.EPA_sys_HelpTitleContent  where  Category = @Category and Area = @Area and ItemCode = @Code and ContentType = @ContentType)
				 select top 1 isnull(ContentText, '')  
				 from  dbo.EPA_sys_HelpTitleContent 
				 where  Category = @Category and Area = @Area and ItemCode = @Code and ContentType = @ContentType 		
 			else if @ContentType = 'Title'
				begin
					if exists ( select *  from [dbo].[EPA_sys_Appraisal_Definition] where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code)
						select top 1 isnull(Appraisal_Text, 'No Title')  
						from [dbo].[EPA_sys_Appraisal_Definition] where Appraisal_Category = @Category and Appraisal_Area = @Area and Appraisal_Code = @Code
					else
						select  @ContentType + ' content text of '   +  @Category + ' ' +  @Area + ' ' + @Code    as rValue
				end
			else
 				select    case   @ContentType  when 'SubTitle' then  ''
											   when 'Message' then ''
											    else  @ContentType + ' content text of '   +  @Category + ' ' +  @Area + ' ' + @Code  end as rValue
 
		end
	else
		begin
			begin try
			   begin tran
					if exists (select * from dbo.EPA_sys_HelpTitleContent  where   Category = @Category and Area = @Area and ItemCode = @Code and ContentType = @ContentType )
						update dbo.EPA_sys_HelpTitleContent set ContentText = @Value
						where  Category = @Category and Area = @Area and ItemCode = @Code and ContentType = @ContentType 	 	
					else
						insert into dbo.EPA_sys_HelpTitleContent
								(Category,Area, ItemCode, ContentType,ContentText,lu_user,lu_function,lu_date)
						values (@Category,@Area,@Code,	@ContentType, @Value   ,@UserID, app_name(),getdate())

			   commit tran	
					Select 'Successfully' as rValue
		   end try
		   begin catch
			   Rollback tran
			   Select 'Failed' as rValue		
		   end catch
	 end
END

