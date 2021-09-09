

-- Drop proc dbo.EPA_sys_getListsValue 'UpLoadCategory'
CREATE Procedure [dbo].[EPA_sys_getListsValue]
 	(	@Type		varchar(30) = 'upaUser',
		@listValue		varchar(20) =null,
		@listText		varchar(300) = null, 
		@Orderby		int = null,
		@IDs			int = null 
	)

 
AS
BEGIN 
	set nocount on
	if @listValue is null
		begin
		   if exists(select * from dbo.EPA_sys_StandardCode where ListType = @Type)
				select listValue as myValue, listText  as myText
				from  dbo.EPA_sys_StandardCode
				where ListType = @Type
				order by Orderby
			else
				begin
					if @Type ='AppraisalType'
						select Appraisal_Code as myValue, Appraisal_Name  as myText
						from  dbo.EPA_sys_appraisalType 
						order by IDs
				end

		end
	else
		if exists (select * from dbo.EPA_sys_StandardCode where IDs =@IDs)
			update dbo.EPA_sys_StandardCode
			set ListValue = @listValue, ListText = @listText
		else
	 		insert into  dbo.EPA_sys_StandardCode
					(Orderby,ListType,ListValue,ListText)
			values	(@Orderby, @Type,@listValue,@listText)
  
 END 
 

