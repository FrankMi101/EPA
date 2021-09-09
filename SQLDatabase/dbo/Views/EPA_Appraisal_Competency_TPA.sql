
CREATE view [dbo].[EPA_Appraisal_Competency_TPA]
WITH SCHEMABINDING
as 
select  C.Appraisal_Domain as DomainID,C.Appraisal_Competency as CompetencyID, D.Appraisal_DomainName as DomainName,C.Appraisal_CompetencyName as CompetencyName, C.Evidence_Level
 from 	dbo.EPA_sys_appraisalDomainCompetency as C
inner join   dbo.EPA_sys_appraisalDomain as D  on C.Appraisal_Code =D.Appraisal_Code and C.Appraisal_Domain =D.Appraisal_Domain
where C.Appraisal_Code ='EPA'  
union
select  '6' as DomainID,'20' as CompetencyID, 'Additional Competencies' as DomainName,'' as CompetencyName, '16' as Evidence_Level
