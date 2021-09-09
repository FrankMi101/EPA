

 


 -- Drop proc dbo.EPA_sys_ProfileCopyContent
CREATE Procedure [dbo].[EPA_sys_ProfileCopyContent]
 	(   @UserID		varchar(30) ='upaUser',
		@CopyFrom	varchar(10) ='UPA',
		@CopyTo		varchar(10) =null,
		@CopyItem 	varchar(30) = null 
	)
AS
BEGIN   
	set nocount on
    if @CopyItem ='All'
       begin
		   EXEC dbo.EPA_sys_ProfileCopyContent @UserID,@CopyFrom,@CopyTo,'ProcessSetup'
		   EXEC dbo.EPA_sys_ProfileCopyContent @UserID,@CopyFrom,@CopyTo,'ProcessDetailSetup'
		   EXEC dbo.EPA_sys_ProfileCopyContent @UserID,@CopyFrom,@CopyTo,'RoleSetup'
		   EXEC dbo.EPA_sys_ProfileCopyContent @UserID,@CopyFrom,@CopyTo,'CycleSetup' 
		   EXEC dbo.EPA_sys_ProfileCopyContent @UserID,@CopyFrom,@CopyTo,'DomainSetup' 
		   EXEC dbo.EPA_sys_ProfileCopyContent @UserID,@CopyFrom,@CopyTo,'CompetencySetup' 
		   EXEC dbo.EPA_sys_ProfileCopyContent @UserID,@CopyFrom,@CopyTo,'LookForsSetup' 
		end
	if @CopyItem ='LookForsSetup' 
       begin
			if not exists (select * from dbo.EPA_sys_appraisalDomainCompetencyLookFors where Appraisal_Code  = @CopyTo)
				insert into dbo.EPA_sys_appraisalDomainCompetencyLookFors
					([Appraisal_Code],  [Appraisal_Domain] , [Appraisal_Competency],[Appraisal_LookFors],[Appraisal_LookForsName] , [Comments], [LookFors_Sign], [Active], lu_function,lu_date, lu_user)
				select @CopyTo,   [Appraisal_Domain] , [Appraisal_Competency], [Appraisal_LookFors], [Appraisal_LookForsName],  [Comments], replace([LookFors_Sign], @CopyFrom,@CopyTo), [Active],  app_name(),getdate(),@UserID 
				from dbo.EPA_sys_appraisalDomainCompetencyLookFors
				where Appraisal_Code = @CopyFrom
				order by IDs
           if not exists ( select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @CopyTo and PageID = @CopyItem ) 
				insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,lu_Function,lu_Date,lu_User)
				select @CopyTo,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,app_name(),getdate(),@UserID
				from dbo.EPA_sys_appraisalTitleHelp 
				where ApplicationID =@CopyFrom and PageID = @CopyItem  
				order by IDs
		end
if @CopyItem ='CompetencySetup'
       begin
			if not exists (select * from dbo.EPA_sys_appraisalDomainCompetency where Appraisal_Code  = @CopyTo)
				insert into dbo.EPA_sys_appraisalDomainCompetency
					([Appraisal_Code],  [Appraisal_Domain] , [Appraisal_Competency],[Appraisal_CompetencyName] , [Comments], [Competency_Sign], [Active], lu_function,lu_date, lu_user)
				select @CopyTo,   [Appraisal_Domain] , [Appraisal_Competency],[Appraisal_CompetencyName],  [Comments], replace([Competency_Sign], @CopyFrom,@CopyTo), [Active],  app_name(),getdate(),@UserID 
				from dbo.EPA_sys_appraisalDomainCompetency
				where Appraisal_Code = @CopyFrom
				order by IDs
           if not exists ( select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @CopyTo and PageID = @CopyItem ) 
				insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,lu_Function,lu_Date,lu_User)
				select @CopyTo,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,app_name(),getdate(),@UserID
				from dbo.EPA_sys_appraisalTitleHelp 
				where ApplicationID =@CopyFrom and PageID = @CopyItem  
				order by IDs
		end
if @CopyItem ='DomainSetup'
       begin
			if not exists (select * from dbo.EPA_sys_appraisalDomain where Appraisal_Code  = @CopyTo)
				insert into dbo.EPA_sys_appraisalDomain
					([Appraisal_Code],  [Appraisal_Domain] , [Appraisal_DomainName] ,[Domain_Code], [Comments], [Domain_Sign], [Active], lu_function,lu_date, lu_user)
				select @CopyTo,   [Appraisal_Domain] , [Appraisal_DomainName] ,[Domain_Code], [Comments], replace([Domain_Sign], @CopyFrom,@CopyTo) , [Active],  app_name(),getdate(),@UserID 
				from dbo.EPA_sys_appraisalDomain
				where Appraisal_Code = @CopyFrom
				order by IDs
           if not exists ( select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @CopyTo and PageID = @CopyItem ) 
				insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,lu_Function,lu_Date,lu_User)
				select @CopyTo,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,app_name(),getdate(),@UserID
				from dbo.EPA_sys_appraisalTitleHelp 
				where ApplicationID =@CopyFrom and PageID = @CopyItem  
				order by IDs
		end
if @CopyItem ='ProcessSetup'
       begin
			if not exists (select * from dbo.EPA_sys_appraisalProcess where Appraisal_Code  = @CopyTo)
				insert into dbo.EPA_sys_appraisalProcess
					([Appraisal_Code],[Appraisal_Process],[Appraisal_ProcessStep], [Appraisal_ProcessName],[Appraisal_ProcessSign],[Comments],[Active_sign], lu_function,lu_date, lu_user)
				select @CopyTo, [Appraisal_Process],[Appraisal_ProcessStep], [Appraisal_ProcessName],replace([Appraisal_ProcessSign],@CopyFrom,@CopyTo) ,[Comments],[Active_sign], app_name(),getdate(),@UserID 
				from dbo.EPA_sys_appraisalProcess
				where Appraisal_Code = @CopyFrom
				order by IDs
           if not exists ( select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @CopyTo and PageID = @CopyItem ) 
				insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,lu_Function,lu_Date,lu_User)
				select @CopyTo,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,app_name(),getdate(),@UserID
				from dbo.EPA_sys_appraisalTitleHelp 
				where ApplicationID =@CopyFrom and PageID = @CopyItem  
				order by IDs
		end
	if @CopyItem ='ProcessDetailSetup'
       begin
			if not exists (select * from dbo.EPA_sys_appraisalProcessDetail where Appraisal_Code  = @CopyTo)
				insert into dbo.EPA_sys_appraisalProcessDetail
					([Appraisal_Code],[Appraisal_Process],[Appraisal_ProcessStep], [Appraisal_ProcessDetail],[Appraisal_ProcessDetailName], [Appraisal_ProcessDetailNameLong],[Appraisal_ProcessDetailIndicator], [Comments], [Appraisal_ProcessSign],[Active_sign], lu_function,lu_date, lu_user)

				select @CopyTo, [Appraisal_Process],[Appraisal_ProcessStep], [Appraisal_ProcessDetail],[Appraisal_ProcessDetailName], [Appraisal_ProcessDetailNameLong],[Appraisal_ProcessDetailIndicator], [Comments], replace([Appraisal_ProcessSign],@CopyFrom,@CopyTo),[Active_sign], app_name(),getdate(),@UserID 
	 
				from dbo.EPA_sys_appraisalProcessDetail
				where Appraisal_Code = @CopyFrom
				order by IDs
           if not exists ( select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @CopyTo and PageID = @CopyItem ) 
				insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,lu_Function,lu_Date,lu_User)
				select @CopyTo,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,app_name(),getdate(),@UserID
				from dbo.EPA_sys_appraisalTitleHelp 
				where ApplicationID =@CopyFrom and PageID = @CopyItem  
				order by IDs		end
 	if @CopyItem ='RoleSetup'
		begin
			if not exists (select * from dbo.EPA_sys_appraisalRole where Appraisal_Code  = @CopyTo)
				insert into dbo.EPA_sys_appraisalRole
					(Appraisal_Code,[Role], [Full_Name],[Role_Code],[Comments],[Active_sign], lu_function,lu_date, lu_user)
				select @CopyTo,     [Role], [Full_Name],[Role_Code],[Comments],[Active_sign], app_name(),getdate(),@UserID 
				from dbo.EPA_sys_appraisalRole
				where Appraisal_Code = @CopyFrom
				order by IDs
           if not exists ( select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @CopyTo and PageID = @CopyItem ) 
				insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,lu_Function,lu_Date,lu_User)
				select @CopyTo,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,app_name(),getdate(),@UserID
				from dbo.EPA_sys_appraisalTitleHelp 
				where ApplicationID =@CopyFrom and PageID = @CopyItem  
				order by IDs
		end
 	if @CopyItem ='CycleSetup'
		begin
			if not exists (select * from dbo.EPA_sys_appraisalCycle where Appraisal_Code  = @CopyTo)
				insert into dbo.EPA_sys_appraisalCycle
					( Appraisal_Code,[Cycle], [Full_Name],[Cycle_Code],[Comments],[Active_sign],  lu_function,lu_date, lu_user)
				select @CopyTo,     [Cycle], [Full_Name],[Cycle_Code],[Comments],[Active_sign], app_name(),getdate(),@UserID 
				from dbo.EPA_sys_appraisalCycle
				where Appraisal_Code = @CopyFrom
				order by IDs
           if not exists ( select * from dbo.EPA_sys_appraisalTitleHelp where ApplicationID = @CopyTo and PageID = @CopyItem ) 
				insert into dbo.EPA_sys_appraisalTitleHelp
					(ApplicationID,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,lu_Function,lu_Date,lu_User)
				select @CopyTo,CategoryID,PageID, ItemID, Title,  Title2,Help_Text,ShowHelp,app_name(),getdate(),@UserID
				from dbo.EPA_sys_appraisalTitleHelp 
				where ApplicationID =@CopyFrom and PageID = @CopyItem  
				order by IDs
		end

END    

 

