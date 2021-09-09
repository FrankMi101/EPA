













 
     

 


-- ==================================================================================
-- Author:		Frank Mi
-- Create date: Decmber 09, 2017  
--              Enhanced by Frank @ 2018/05/19 add demand undo sign off
-- Description:   sign off signature
-- ==================================================================================
 
 
CREATE proc [dbo].[EPA_Appr_AppraisalProcess_SignOffSignature]  -- 'Supervisory','mif','20182019','0529','00042640','Appraisal1','NTP','SUM95','SO','Frank Mi','2018/05/05','Sign Off','1'
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8) = null,  
	@SchoolCode		varchar(8) = null,
	@EmployeeID		varchar(10) = null,
	@SessionID		varchar(20)= null ,
	@Category		varchar(10) = null,
	@ItemCode		varchar(10)= null, 
	@UserRole		varchar(20)= null,
	@SignOffType	varchar(30) = null,
	@SignOffName	varchar(50) = null,  
	@SignOffDate	varchar(30) = null,  
	@SignOffAction	varchar(50) = null,
	@EnforceSignOff varchar(10) = null  
	 
as

set nocount on 

if @SignOffName is null
	begin
	    if @Operate ='DemandUserRole'
			begin
				if exists(select * from    dbo.EPA_Appr_SignOff_Demand where   school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Respons_UserID is null  and Category = @Category)
					select top 1 isnull(SignOff_Type,'')
					from dbo.EPA_Appr_SignOff_Demand where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Respons_UserID is null  and Category = @Category
				else
					select '' as rValue 
			end
	    else if @Operate ='NoticeAction'
			begin
			   if exists (select * from   dbo.EPA_Appr_SignOff_Demand where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Respons_UserID is null  and Category = @Category)
					select top 1 rtrim(isnull(SignOff_action,''))
					from dbo.EPA_Appr_SignOff_Demand                  
					where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode  and   Respons_UserID is null   and Category = @Category -- and SignOff_Type = @UserRole
			   else if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @UserRole   and Category = @Category)
					select top 1 rtrim(isnull(SignOff_action,''))
					from dbo.EPA_Appr_SignOff where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @UserRole  and Category = @Category
				else
					select 'Sign Off' as rVal
			end
		else if @Operate ='Appraisal'	
		  	begin
				if exists(select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category)
					select top 1 isnull(SignOff_action,'')
					from dbo.EPA_Appr_SignOff where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category
				else
					select 'Sign Off' as rVal

			end			 
		else
			if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType and [Signature] != ''  and Category = @Category)
				select isnull([Signature],'')
				from dbo.EPA_Appr_SignOff 
				where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType and [Signature] != ''  and Category = @Category
			else 
				select '' as [Sginature]
	end
else
	begin
	    begin try
			declare @Area varchar(3)  
			set @Area =left(@ItemCode,3)
 
		   begin tran
			  if  @SignOffAction ='Sign Off'
					begin
   						if exists (select *  from dbo.EPA_Appr_SignOff  where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType and Category = @Category)
							begin
							    insert into  dbo.EPA_Appr_SignOff_ActionHistory 
									  (School_year, School_code, SessionID, EmployeeID, ItemCode,SignOff_Action, SignOff_Type,signOff_Date,[Signature], Category, lu_function,lu_date,lu_user)		 
								select School_year, School_code, SessionID, EmployeeID, ItemCode,SignOff_Action, SignOff_Type,signOff_Date,[Signature],Category,lu_function,lu_date,lu_user
							    from  dbo.EPA_Appr_SignOff 
								where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType   and Category = @Category

								update dbo.EPA_Appr_SignOff 
								set [Signature] = @SignOffName, Signoff_date = @SignOffDate ,SignOff_Action = @SignOffAction, lu_date = getdate(), lu_User = @UserID, lu_function = app_name() 
								where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category
 							end
						else
							insert into  dbo.EPA_Appr_SignOff
								   (School_year, School_code, SessionID, EmployeeID, ItemCode, SignOff_Action,  SignOff_Type, signOff_Date,[Signature], Category,lu_function,lu_date,lu_user)
							values (@SchoolYear,@SchoolCode, @SessionID, @EmployeeID,@ItemCode, @SignOffAction, @SignOffType, @SignOffDate,@SignOffName,@Category,app_name(),getdate(),@UserID)

						if @EnforceSignOff ='1'
						   begin
						       set @SignOffName ='SO Enforce Sign Off'
							   if exists (select * from dbo.EPA_Appr_SignOff  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = 'Appraisee'  and Category = @Category)
									update dbo.EPA_Appr_SignOff 
									set [Signature] = @SignOffName, Signoff_date = @SignOffDate ,SignOff_Action = @SignOffAction, lu_date = getdate(), lu_User = @UserID, lu_function = app_name() 
									where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = 'Appraisee'  and Category = @Category
							   else
									insert into  dbo.EPA_Appr_SignOff
										(School_year, School_code, SessionID, EmployeeID, ItemCode,SignOff_Action, SignOff_Type,signOff_Date,[Signature], Category,lu_function,lu_date,lu_user)
									values (@SchoolYear,@SchoolCode,@SessionID,@EmployeeID,@ItemCode, @SignOffAction, 'Appraisee',@SignOffDate,@SignOffName,@Category,app_name(),getdate(),@UserID) 
							end

						EXEC dbo.EPA_Appr_AppraisalProcess_CheckViewPermission
							  'ViewPermission',@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area, @ItemCode,@SignOffType,'SignOff'    
					end
               else
			       begin
					  insert into  dbo.EPA_Appr_SignOff_ActionHistory 
							(School_year, School_code, SessionID, EmployeeID, ItemCode,SignOff_Action, SignOff_Type,signOff_Date,[Signature], Category, lu_function,lu_date,lu_user)		 
					  select School_year, School_code, SessionID, EmployeeID, ItemCode,SignOff_Action, SignOff_Type,signOff_Date,[Signature],Category,lu_function,lu_date,lu_user
					  from  dbo.EPA_Appr_SignOff 
					  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category

					  update  dbo.EPA_Appr_SignOff 
					  set  SignOff_Action = @SignOffAction, lu_date = getdate(), lu_User = @UserID, lu_function = app_name()
					  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category

					  if @SignOffAction ='Undo Sign Off'
						  update  dbo.EPA_Appr_SignOff 
						  set  [Signature] = '', Signoff_date ='', lu_date = getdate(), lu_User = @UserID, lu_function = app_name()
						  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category
					  else if @SignOffAction ='Demand Undo Sign Off'  
						  begin
								if not exists(select * from dbo.EPA_Appr_SignOff_Demand where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category and SignOff_Action = @SignOffAction) 	
									insert into dbo.EPA_Appr_SignOff_Demand
										(School_year, School_code, SessionID, EmployeeID, ItemCode, SignOff_Action, SignOff_Type,signOff_Date,[Signature], Category,lu_function,lu_date,lu_user)
									values (@SchoolYear,@SchoolCode, @SessionID, @EmployeeID, @ItemCode, @SignOffAction, @SignOffType,@SignOffDate,@SignOffName,@Category,app_name(),getdate(),@UserID)
						 end
					  else if @SignOffAction ='Recall Undo Sign Off'  
						  begin
								update  dbo.EPA_Appr_SignOff 
								set SignOff_Action = 'Sign Off', lu_date = getdate(), lu_User = @UserID, lu_function = app_name()
								where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category and SignOff_Action = @SignOffAction
						        
								if  exists(select * from dbo.EPA_Appr_SignOff_Demand where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category and SignOff_Action = 'Demand Undo Sign Off') 	
									update  dbo.EPA_Appr_SignOff_Demand
									set SignOff_Action =@SignOffAction
									where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and SignOff_Type = @SignOffType  and Category = @Category and SignOff_Action = 'Demand Undo Sign Off'
 						 end
					 else if @SignOffAction = 'Authorize Undo Sign Off' 						      
						 begin
							  update  dbo.EPA_Appr_SignOff 
							  set  [Signature] = '', Signoff_date ='', lu_date = getdate(), lu_User = @UserID, lu_function = app_name()
							  where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Category = @Category

	 						  if exists(select * from dbo.EPA_Appr_SignOff_Demand where school_year = @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Category = @Category and  Respons_UserID is null and SignOff_Action ='Demand Undo Sign Off')	
								  update dbo.EPA_Appr_SignOff_Demand
								  set Respons_UserID  = @UserID, Respons_Role = @UserRole, Respons_date = getdate(),lu_date = getdate(), lu_User = @UserID, lu_function = app_name()
								  where school_year =   @SchoolYear and SessionID = @SessionID and EmployeeID =  @EmployeeID and ItemCode = @ItemCode and Category = @Category and  Respons_UserID is null  and SignOff_Action ='Demand Undo Sign Off'	 
						end
				 end
			  if @ItemCode = 'SUM95' EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResult]    @Operate,@SignOffAction,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode
			  if @ItemCode = 'STR95' EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResultNTP] @Operate,@SignOffAction,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode
			  if @ItemCode = 'ALP95' EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResultALP] @Operate,@SignOffAction,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode
			  if @ItemCode = 'AGP95' EXEC [dbo].[EPA_Appr_AppraisalProcess_UpdateResultALP] @Operate,@SignOffAction,@UserID, @SchoolYear,@SchoolCode, @EmployeeID,@SessionID,@Category, @Area, @ItemCode
			   

		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
	end

/*
	  begin try
		   begin tran
				{} 
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch

	 
*/





