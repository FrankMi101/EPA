


 -- drop function  dbo.EPA_getMenusLink
 
CREATE FUNCTION [dbo].[EPA_getMenusLink]
(@AppCode varchar(30),
@Model varchar(30),
@CategoryID varchar(20),
@GroupID varchar(20),
@ItemID varchar(20),
@TitleID varchar(30) 
)
RETURNS varchar(300)
AS 
  BEGIN
  		declare @rValue varchar(300)
				declare @strHref varchar(100)
				declare @Para varchar(200)
				set @strHref = 	'<A title ="Entry Title" href="javascript:openMenuEditPage'
				set @Para = '('''  + @CategoryID + ''',''' + @GroupID + ''',''' + @ItemID+ ''',''' + @TitleID+ ''')">'
 				if @Model ='Design'
					if exists (select * from dbo.EPA_sys_FunctionMenus  where TitleID = @TitleID and Appraisal_Code = @appCode ) --CategotyID = @CategoryID and GroupID = @GroupID and ItemID = @ItemID and Appraisal_Code = @appCode)
							select top 1 @rValue =  rtrim(@strHref)+ rtrim(@Para) + Title + '</A>'
							from dbo.EPA_sys_FunctionMenus 
							where TitleID = @TitleID and Appraisal_Code = @appCode --CategotyID = @CategoryID and GroupID = @GroupID and ItemID = @ItemID and Appraisal_Code = @appCode
					else
							select @rValue =  rtrim(@strHref)+ rtrim(@Para) + @TitleID + '</A>'
			 
				else
					if exists (select * from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID  and Appraisal_Code = @appCode)
							select top 1 @rValue =  '<A  title=" ' + isnull(Title2,Title) + '" href="Loading.aspx?pID=' + PageID + '" target="' + isnull(TargetID,'main') + '">' + Title  + '</A>'
							from dbo.EPA_sys_FunctionMenus where TitleID = @TitleID   and Appraisal_Code = @appCode
					else
							select @rValue =  rtrim(@strHref)+ rtrim(@Para) + @TitleID + '</A>'




		set @rValue = isnull(@rValue,@TitleID) 

		RETURN(@rValue)
 END

  

