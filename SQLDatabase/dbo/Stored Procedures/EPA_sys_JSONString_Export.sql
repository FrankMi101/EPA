 CREATE proc dbo.EPA_sys_JSONString_Export
 as
select 
P.Appraisal_Process as [Code], P.Appraisal_ProcessStep as [Step],P.Appraisal_ProcessName as [Name],
Detail.Appraisal_Code as [DCode],Detail.Appraisal_Text as [DName], Detail.Content_Page as [Page]
from
[dbo].[EPA_sys_appraisalProcess] as P
inner join [dbo].[EPA_sys_Appraisal_Definition] as Detail on P.Appraisal_Code = Detail.Appraisal_Category and P.Appraisal_Process = Detail.Appraisal_Area
where P.Appraisal_Code ='TPA'
for JSON AUTO


select distinct P.Appraisal_Process as [Code],  P.Appraisal_ProcessStep as [Step], P.Appraisal_ProcessName as [Name],
 ( select  Detail.Appraisal_Code as [DCode],Detail.Appraisal_Text as [DName], Detail.Content_Page as [Page]
   from [dbo].[EPA_sys_Appraisal_Definition] as Detail
   Where P.Appraisal_Code = Detail.Appraisal_Category and P.Appraisal_Process = Detail.Appraisal_Area
    FOR JSON PATH ) as Detail
from  [dbo].[EPA_sys_appraisalProcess] as P
where P.Appraisal_Code ='TPA'
order by step
FOR JSON PATH


declare @Category as table
(Category varchar(10),
CName varchar(100))
insert into @Category
select distinct  Appraisal_Area, Appraisal_Text
from [dbo].[EPA_sys_Appraisal_Definition]
where Appraisal_Category ='TPA'  and len(Appraisal_Code) = 3 

declare @Area as table
(Area varchar(10),
 Code varchar(20),
 AName varchar(100))
insert into @Area
select distinct  Appraisal_Area, left(Appraisal_Code,4), 'Appraisal Sub' as Appraisal_Text
from [dbo].[EPA_sys_Appraisal_Definition]
where Appraisal_Category ='TPA'   and len(Appraisal_Code) >= 4


declare @Items as table
(Area	varchar(10),
 SubC	varchar(10),
 Code	varchar(20),
 IName varchar(100),
 IPage varchar(50))
insert into @Items
select distinct  Appraisal_Area, left(Appraisal_Code,4), Appraisal_Code, Appraisal_Text, Content_Page
from [dbo].[EPA_sys_Appraisal_Definition]
where Appraisal_Category ='TPA'    and len(Appraisal_Code) = 5
 

 
select   Category.Category,  Category.CName as [Name],
	(select    Area.Area, Area.Code, Area.AName as [Name],
	   (select   Item.Code, Item.IName, item.IPage
		from @Items as Item
		where Item.Area = Area.Area and Item.SubC = Area.Code
		FOR JSON PATH ) as Item
	from @Area as Area
	Where Category.Category = Area.Area  
	FOR JSON PATH ) as Area
from  @Category  as Category  
FOR JSON PATH

select * from [dbo].[EPA_sys_Appraisal_Definition]