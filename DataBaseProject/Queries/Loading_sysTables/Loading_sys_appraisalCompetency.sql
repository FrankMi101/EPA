 IF EXISTS (SELECT * FROM [dbo].[upa_sys_appraisalCompetency]  )
	BEGIN
		DELETE [dbo].[upa_sys_appraisalCompetency]
	END
GO
 
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','1','1','upaCompetency1','Teachers demonstrate commitment to the well-being and development of all pupils.', '',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','1','2','upaCompetency2','Teachers are dedicated in their efforts to teach and support pupil learning. and achievement.', '',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','1','3','upaCompetency3','Teachers treat all pupils equitably and with respect.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','1','4','upaCompetency4','Teachers provide an environment for learning that encourages pupils to be problem-solvers, decision-makers, life-long learners and contributing members of a changing society.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','2','5','upaCompetency5','Teachers know their subject matter, the Ontario curriculum, and education-related legislation.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','2','6','upaCompetency6','Teachers know a variety of effective teaching and assessment practices.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','2','7','upaCompetency7','Teachers know a variety of effective classroom management strategies.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','2','8','upaCompetency8','Teachers know how pupils learn and factors that influence pupil learning and achievement.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','3','9','upaCompetency9','Teachers use their professional knowledge and understanding of pupils, curriculum, legislation, teaching practices and classroom management strategies to promote the learning and achievement of their pupils.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','3','10','upaCompetency10','Teachers communicate effectively with pupils, parents and colleagues.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','3','11','upaCompetency11','Teachers conduct ongoing assessment of their pupils'' progress, evaluate their achievement and report results to pupils and parents regularly.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','3','12','upaCompetency12','Teachers adapt and refine teaching practices through continuous learning and reflection, using a variety of sources and resources.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','3','13','upaCompetency13','Teachers use appropriate technology in their teaching practices and related professional responsibilities.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','4','14','upaCompetency14','Teachers collaborate with other teachers and school colleagues to create and sustain learning communities in their classrooms and in their schools.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','4','15','upaCompetency15','Teachers work with professionals, parents and members of the community to enhance pupil learning, pupil achievement and school programs.','',app_name(),getdate(),'upaUser')
GO
INSERT INTO upa_sys_appraisalCompetency
(Appraisal_Code,Appraisal_Domain,Appraisal_Competency,Competency_Sign,Appraisal_CompetencyName,comments,lu_function,lu_date,lu_User)
VALUES ('UPA','5','16','upaCompetency16','Teachers engage in ongoing professional learning and apply it to improve their teaching practice.','',app_name(),getdate(),'upaUser')
GO

 