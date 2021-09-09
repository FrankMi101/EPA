





 

-- ==================================================================================
-- Author:		Frank Mi
-- Create date: June 04, 2020
-- Description:	get and update application Users
-- ==================================================================================
 
CREATE proc [dbo].[EPA_sys_SystemItemsList]   
	@Operate		varchar(30),
	@UserID			varchar(30),
	@Category		varchar(20)= null,
	@Area			varchar(20)= null,
	@IDs			varchar(10) = null,
	@Code			varchar(30) = null,
	@Name			varchar(200) =null,
	@Comments		varchar(250) =null,
	@Active			bit = null,
	@Orders			varchar(10) = null,
	@KeyPoint		varchar(50) = null

as

set nocount on 
 begin
    if @Area ='Phase' EXEC dbo.EPA_sys_SystemItemsList_Phase @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@Orders,@KeyPoint
    if @Area ='Rate'   EXEC dbo.EPA_sys_SystemItemsList_Rating @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@Orders,@KeyPoint
    if @Area ='Steps'  EXEC dbo.EPA_sys_SystemItemsList_Steps @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@Orders,@KeyPoint
    if @Area ='Cycle'  EXEC dbo.EPA_sys_SystemItemsList_Cycle @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@Orders,@KeyPoint
    if @Area ='Process' EXEC dbo.EPA_sys_SystemItemsList_Process @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@Orders,@KeyPoint
end
	 



