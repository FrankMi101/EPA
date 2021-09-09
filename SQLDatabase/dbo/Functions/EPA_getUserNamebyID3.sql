
 -- drop function  dbo.tcdsb_TPA_UserName3 'mif','shortName'

CREATE  FUNCTION [dbo].[EPA_getUserNamebyID3]
(	@Type varchar(20) ,
	@UserID varchar(30), 
	@SchoolYear varchar(8) ,
	@SchoolCode varchar(8),
	@AdminID	  varchar(30)
)
RETURNS varchar(150)
AS 
  BEGIN

--  
-- set @UserID = REPLACE(@UserID,'DS','')  some user userID like <dsilval> 


  declare @rValue varchar(150)
  if @Type ='SchoolName'
	  set @rValue =  ( 	select top 1 dbo.tcdsb_TPA_SchoolName(school_code,'Name')   
                      	from dbo.tcdsb_TPA_School_staff   
		      			where School_year = @SchoolYear and (UserID = @UserID or CPNum=  @UserID)  
		      			order by School_year DESC
					 )
  else if (@Type ='shortName') 
    set @rValue =  ( 	select top 1   isnull(FirstName,'') + ' ' + left(isnull(LastName,''),1)
                      	from dbo.tcdsb_TPA_School_staff   
		      			where  UserID = @UserID or CPNum=  @UserID 
		      			order by School_year DESC
		     )	
  else if (@Type ='firstName') or ( @Type ='fName')
    set @rValue =  ( 	select top 1   isnull(FirstName,'')
                      	from dbo.tcdsb_TPA_School_staff   
		      	where   UserID = @UserID or CPNum = @UserID 
		      	order by School_year DESC
		     )	
  else if (@Type = 'lastName') or (@Type ='sName')
      set @rValue =  ( 	select top 1  isnull(LastName,'')
                      	from dbo.tcdsb_TPA_School_staff   
		      	where UserID = @UserID or CPNum = @UserID  
		      	order by School_year DESC
		     )	
  else if @Type ='sNameFirst'

      set @rValue =  ( 	select top 1  isnull(LastName,'')+', ' +  isnull(FirstName,'')
                      	from dbo.tcdsb_TPA_School_staff   
		      	where UserID = @UserID or CPNum = @UserID  
		      	order by School_year DESC
		     )	
  else if @Type ='fNameFirst'
         set @rValue =  (Select  top 1 isnull(FirstName,'')+ ' ' + isnull(LastName,'')  
                      	from dbo.tcdsb_TPA_School_staff   
			where UserID = @UserID or CPNum = @UserID  
			order by School_year  DESC
		     )	
  else if @Type ='sNameAdmin'
		set @rValue =  dbo.tcdsb_TPA_UserName2(@AdminID,'sName',@SchoolYear ) 
        --set @rValue =  (select top 1 dbo.tcdsb_TPA_UserName2(admin,'sName',@SchoolYear )  from dbo.tcdsb_TPA_School_staff   
		      --	where  School_year  = @SchoolYear and (UserID = @UserID or CPNum = @UserID  )
		      --	order by School_year DESC )

 else if @Type ='fNameAdmin'
         set @rValue =  dbo.tcdsb_TPA_UserName2(@AdminID,'fName',@SchoolYear ) 
         --set @rValue =  (select top 1 dbo.tcdsb_TPA_UserName2(admin,'fName',@SchoolYear ) from dbo.tcdsb_TPA_School_staff   
		      	--where  School_year  = @SchoolYear and (UserID = @UserID or CPNum = @UserID  )
		      	--order by School_year DESC )

 else if @Type ='MentorSchool'
        set @rValue =  (select top 1 dbo.tcdsb_TPA_SchoolName(school_code,'Name')
						from dbo.tcdsb_TPA_School_staff   
		      			where  School_year  = @SchoolYear and (UserID = @UserID or CPNum = @UserID  )
		      	order by School_year DESC )

 else if @Type ='Position'
          set @rValue = (select  top 1 isnull(TPA_Position,'Other')
                      	from dbo.tcdsb_TPA_School_staff   
			where  School_year  = @SchoolYear and (UserID = @UserID or CPNum = @UserID  )
			order by School_year  DESC
		     )	
 else if @Type ='UserRole'
          set @rValue = (select  top 1 isnull(TPA_Role,'Other')
                      	from dbo.tcdsb_TPA_School_staff   
			where  School_year  = @SchoolYear and (UserID = @UserID or CPNum = @UserID  )
			order by School_year  DESC
		     )	
else if @Type ='Assignment'
           set @rValue = (select  top 1 isnull(Assignment,'')
                      		from dbo.tcdsb_TPA_School_staff   
			where  School_year  = @SchoolYear and (UserID = @UserID or CPNum = @UserID  )
			order by School_year  DESC
			)
 else if @Type ='eMail'
           set @rValue = (select  top 1 isnull(eMail,'')
                      		from dbo.tcdsb_TPA_School_staff   
			where  UserID = @UserID or CPNum = @UserID  
			order by School_year  DESC
		     )	
    set @rValue = isnull(@rValue,' ') 
 RETURN(@rValue)
 END
 