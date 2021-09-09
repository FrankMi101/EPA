

-- =====================================================================================
-- Author:		Frank Mi
-- Create date: March 9, 2020  
-- Description:	 create SQL mail profile
-- =====================================================================================



CREATE proc [dbo].[Create_SQLMail_Setup]
as 
 
-- SQL Email control Table  
   -- 		select * from   update  dbo.sysmail_account set display_name = 'Social Worker SErvices'   where account_id =2

-- Step 1 work on the MDDB 
--  use msdb
 
-- Step 2 Creat a emial account

EXECUTE msdb.dbo.sysmail_add_account_sp
    @account_name = 'EPA Public Account',
    @description = 'Mail account for use by all database users to send a SQL mail.',
    @email_address = 'EPA.master@tcdsb.org',
    @replyto_address = 'EPA.master@tcdsb.org',
    @display_name = 'EPA.Reminder@tcdsb.org',
    @mailserver_name = 'intramail.tcdsb.org' ;

--  Step 3 Create a Database Mail profile

EXECUTE msdb.dbo.sysmail_add_profile_sp
    @profile_name = 'EPA Public Profile',
    @description = 'Profile used for administrative EPA mail.' ;

--  Step 4 Add the account to the profile

EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
    @profile_name = 'EPA Public Profile',
    @account_name = 'EPA Public Account',
    @sequence_number =1 ;

--  Step 5 Grant access to the profile to all users in the msdb database

EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
    @profile_name = 'EPA Public Profile',
    @principal_name = 'public',
    @is_default = 1 ;
