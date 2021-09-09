









 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: July 17, 2020 
-- Description:	get appraisal Text user comments snippet
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalData_TextUserSnippet]    -- '0','mif','20172018','0528','00010452','Session1','PPA' 
 	@Operate			varchar(10)= null,  
	@UserID				varchar(30)= null,  
	@CategoryID			varchar(10)= null,
	@AreaID				varchar(10)= null,
 	@ItemCode			varchar(10)= null,
	@DomainID			int= null,
 	@CompetencyID		int= null,
 	@RowNo				int= null,
 	@Comments			varchar(1000)= null 
	
as

set nocount on  
 if @Operate ='Get'
	begin
		if exists( select * from  [dbo].[EPA_sys_Appraisal_UserCommentsSnippet] where [UserID]=@UserID and [CategoryID] =@CategoryID and [AreaID]= @AreaID and [ItemCode] = @ItemCode and [DomainID] = @DomainID and [CompetencyID] = @CompetencyID and [RowNo] =@RowNo)
				select top 1 Comments
				from  [dbo].[EPA_sys_Appraisal_UserCommentsSnippet] 
				where [UserID]=@UserID and [CategoryID] =@CategoryID and [AreaID]= @AreaID and [ItemCode] = @ItemCode and [DomainID] = @DomainID and [CompetencyID] = @CompetencyID and [RowNo] =@RowNo 
		else
			select 'No Comments Snippet yet'
	end
else
	 begin
		begin try
		   begin tran
				if exists( select * from  [dbo].[EPA_sys_Appraisal_UserCommentsSnippet] where [UserID]=@UserID and [CategoryID] =@CategoryID and [AreaID]= @AreaID and [ItemCode] = @ItemCode and [DomainID] = @DomainID and [CompetencyID] = @CompetencyID and [RowNo] =@RowNo)
					update [dbo].[EPA_sys_Appraisal_UserCommentsSnippet]
					set Comments  = @Comments , lu_function = app_name(), lu_date = getdate(),lu_user = @UserID
					where [UserID]=@UserID and [CategoryID] =@CategoryID and [AreaID]= @AreaID and [ItemCode] = @ItemCode and [DomainID] = @DomainID and [CompetencyID] = @CompetencyID and [RowNo] =@RowNo
                else
					begin		    
						Insert into [dbo].[EPA_sys_Appraisal_UserCommentsSnippet]
						([UserID],[CategoryID],[AreaID],[ItemCode],[DomainID],[CompetencyID],[RowNo],[Comments],lu_user,lu_function, lu_date)
						values(@UserID, @CategoryID,@AreaID,@ItemCode, @DomainID,@CompetencyID,@RowNo,@Comments,@UserID, app_name(), getdate())
					end
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
  end
   
    
