






 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: November 29, 2017 
-- Description:	Comments Bank operation
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_sys_CommentsBankOperation]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Type			varchar(20)= null,  
	@Owner			varchar(20)= null,  
	@Value			varchar(1000)= null,
	@IDs			varchar(10) = null 
as

set nocount on 

if @Value is null
   begin
		 declare @imgAction varchar(200)
		 set @imgAction = '<img title="recovery selected comments to working content" src="../images/Chinaz7.ico" border="0" width="25" height="25" />'

		select 
			 @imgAction   as [Action],   
			 shared,
			 comments ,
			 IDs,
	 		  ROW_NUMBER() OVER(ORDER BY  IDs   ) AS RowNo 
		 
		from   dbo.EPA_sys_CommentsBank 
		where  [Type] = @Type  and [Owner] = @Owner and Status ='1'
		order by RowNo  
	end
else
	if exists (select * from dbo.EPA_sys_CommentsBank 	where  [Type] = @Type  and [Owner] = @Owner  and IDs = @IDs )
	     update  dbo.EPA_sys_CommentsBank 
		 set comments = @Value
		 	where  [Type] = @Type  and [Owner] = @Owner  and IDs = @IDs 
     else
		 insert into  dbo.EPA_sys_CommentsBank 
		  (DomainID,Type,Owner,Shared,Comments,Status,lu_function,lu_date,lu_user )
		 values ('0', @Type,@Owner,@Operate,@Value,'1',app_name(),getdate(),@UserID)



 


