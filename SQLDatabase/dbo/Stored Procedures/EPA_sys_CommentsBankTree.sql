









 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 22, 2018 
-- Description:	Comments Bank tree
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_sys_CommentsBankTree]    -- '0','mif','Board','0000' 
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Type			varchar(20)= null,  
	@Owner			varchar(20)= null 
as

set nocount on 

 
   begin
       select  '' as [Action], 
	         dbo.EPA_getDomainName(DomainID) as DomainName,
			 Shared,  Comments ,
			 IDs,  DomainID ,left(shared,5) as SharedID,
			 	ROW_NUMBER() OVER(ORDER BY  DomainID, shared, IDs) AS RowNo 
		from   dbo.EPA_sys_CommentsBank 
		where  [Type] = @Type  and [Owner] = @Owner and Status ='1'
		order by RowNo
	end
 

 --select * from        dbo.EPA_sys_CommentsBank -- set Shared ='Unsatisfactory' 
	--	where  [Type] ='Board' --and  right(IDs,1) in ('4','5')
 --order by DomainID ,  shared , IDs



