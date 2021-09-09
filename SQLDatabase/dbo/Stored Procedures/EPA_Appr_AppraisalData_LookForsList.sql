








 
	    

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: April 3, 2018 
-- Description:	get lookfors by Domain competency 
-- ==================================================================================
--  [dbo].[EPA_Appr_AppraisalData_LookForsList]    'Get','mif','20172018','0529','00010558','Appraisal1','TPA','SUM','SUM51','1','2', '0','Appraiser' ,'Appraiser' ,'0','2018/4/3','1','0'
CREATE proc [dbo].[EPA_Appr_AppraisalData_LookForsList]    
	@Operate		varchar(30),
	@UserID			varchar(30),
	@SchoolYear		varchar(8)= null,  
	@SchoolCode		varchar(8)= null,  
	@EmployeeID		varchar(20)= null,
	@SessionID		varchar(20)= null,  
	@Category		varchar(10)= null ,
	@Area			varchar(10)= null ,
	@ItemCode		varchar(10)= null ,
	@DomainID		varchar(10)= null,  
	@CompetencyID	varchar(10)= null,
	@LookForsID		varchar(10)= null,
	@ActionRole		varchar(10) =null,
	@ObjRole		varchar(10) =null,
	@LogDate		varchar(10)= null,
	@LogCheck		varchar(1) = null, 
	@AllowView		varchar(1) = null, 
	@Comments		varchar(500) = null 

  
as

set nocount on 
 if  @LogDate is null
     begin
 
		 declare @LookFors as table
				(LookForsID int,
				 LookFors varchar(250),
 				 LogDate varchar(20),
				 LogCheck bit,
				 [Action]  varchar(150))

				 insert into @LookFors
				 select 	       
				  Appraisal_LookFors as LookForsID,
				  Appraisal_LookForsName as   LookFors,
				  dbo.EPA_getEvidenceLogDate(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,@ObjRole, @DomainID,@CompetencyID, L.Appraisal_LookFors) as  LogDate,
				  dbo.EPA_getEvidenceLogCheck(@SchoolYear, @SchoolCode,@EmployeeID,@SessionID,@ObjRole, @DomainID,@CompetencyID, L.Appraisal_LookFors) as   LogCheck,
				  '' as [Action]
				 -- ROW_NUMBER() OVER(ORDER BY  LookForsID ) AS RowNo  
				from  [dbo].[EPA_sys_appraisalDomainCompetencyLookFor] as L
 				where  Appraisal_Domain = @DomainID and Appraisal_Competency = @CompetencyID
				union  
				select LookForsID, Comments as LookFors,
				   dbo.DateF(LogDate,'YYYYMMDD'),LogCheck,
				   	  '<a href="#" title="click on button to delete this record of LookFors' + ' " >'  +   dbo.EPA_getImageIcon('Delete')  + '</a>'  as [Action]
				--   ROW_NUMBER() OVER(ORDER BY  LookForsID ) AS RowNo 
				from   [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
				where  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID = @CompetencyID  and LookForsID > 200 and WorkRole = @ObjRole
			 
				select *,   ROW_NUMBER() OVER(ORDER BY  LookForsID ) AS RowNo 
				from @LookFors
				order by RowNo
 
    end
else
   begin
   		 
   		begin try
		   begin tran
				if @Operate ='Delete'
					begin
						delete [dbo].[EPA_Appr_LookFors_EvidenceLog_chose] 
						WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID = @LookforsID and WorkRole = @ActionRole 
	
					end
		        else if @Operate = 'AddNew'
					begin
						declare @newLookForID int  
						set @newLookForID = 0
						set @newLookForID = (select top 1 LookForsID from [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
											 where  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and WorkRole = @ActionRole and LookForsID > 150
											 order by LookForsID DESC)

						if isnull(@newLookForID,0) < 200
						   set @newLookForID =  201
						else 
						    set @newLookForID =  @newLookForID + 1

						insert into  [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
							   (school_year, school_code,employeeID, SessionID, ItemCode, DomainID,CompetencyID, LookForsID,WorkRole,LogDate,LogCheck,AllowView, Comments,  lu_function,lu_date,lu_user) 		
						values (@SchoolYear, @SchoolCode,@EmployeeID,@SessionID, @ItemCode, @DomainID,@CompetencyID, @newLookForID,@ActionRole, getdate(),@LogCheck,@AllowView, 'write your comments here', app_name(),getdate(),@UserID)		

					end
				else if exists (select * from  [dbo].[EPA_Appr_LookFors_EvidenceLog_chose] --where EmployeeID ='00010558'
					WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID = @LookforsID and WorkRole = @ActionRole )
					update [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]  
					set LogDate = @LogDate ,LogCheck = @LogCheck , Comments = isnull(@Comments,''), lu_date=getdate(), lu_user =@UserID, lu_function =app_name()
					WHERE  School_Year =@SchoolYear and School_code  = @SchoolCode and EmployeeID =@EmployeeID and SessionID =@SessionID  and DomainID =@DomainID and CompetencyID =@CompetencyID and LookForsID = @LookforsID and WorkRole = @ActionRole 
				else
					insert into  [dbo].[EPA_Appr_LookFors_EvidenceLog_chose]
						   (school_year, school_code,employeeID, SessionID, ItemCode, DomainID,CompetencyID, LookForsID, Comments , WorkRole,LogDate,LogCheck,AllowView, lu_function,lu_date,lu_user) 		
					values (@SchoolYear, @SchoolCode,@EmployeeID,@SessionID, @ItemCode, @DomainID,@CompetencyID, @LookforsID,'', @ActionRole, @LogDate,@LogCheck,@AllowView, app_name(),getdate(),@UserID)		

		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
   end



 --  select * from[dbo].[EPA_Appr_LookFors_EvidenceLog_chose]  where EmployeeID ='00014245' and SessionID ='Appraisal2'

