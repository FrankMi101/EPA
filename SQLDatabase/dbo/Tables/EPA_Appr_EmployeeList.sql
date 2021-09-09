CREATE TABLE [dbo].[EPA_Appr_EmployeeList] (
    [IDs]               INT           IDENTITY (1, 1) NOT NULL,
    [UserID]            VARCHAR (30)  NULL,
    [Appraisal_year]    VARCHAR (8)   NOT NULL,
    [Unit_ID]           VARCHAR (8)   NOT NULL,
    [Employee_ID]       VARCHAR (20)  NULL,
    [Appraisal_Status]  VARCHAR (20)  NULL,
    [Appraisal_type]    VARCHAR (20)  NULL,
    [Appraisal_Cycle]   VARCHAR (20)  NULL,
    [Appraisal_Role]    VARCHAR (50)  NULL,
    [StartDate]         SMALLDATETIME NULL,
    [EndDate]           SMALLDATETIME NULL,
    [ALP_Result]        VARCHAR (50)  NULL,
    [Appraisal_1]       VARCHAR (50)  NULL,
    [Appraisal_2]       VARCHAR (50)  NULL,
    [Appraisal_3]       VARCHAR (50)  NULL,
    [Appraisal_4]       VARCHAR (50)  NULL,
    [Appraisal_Result]  VARCHAR (50)  NULL,
    [Appraisal_Process] VARCHAR (50)  NULL,
    [SessionFinalRite]  VARCHAR (10)  NULL,
    [EvidenceLevel]     VARCHAR (2)   NULL,
    [Appraiser]         VARCHAR (30)  NULL,
    [Mentor]            VARCHAR (50)  NULL,
    [Assignment]        VARCHAR (200) NULL,
    [Comments]          VARCHAR (250) NULL,
    [TimeType]          VARCHAR (10)  NULL,
    [lu_function]       VARCHAR (50)  NULL,
    [lu_date]           SMALLDATETIME NULL,
    [lu_user]           VARCHAR (20)  NULL
);


GO
CREATE CLUSTERED INDEX [EPA_Appr_EmployeeList_indexCluster]
    ON [dbo].[EPA_Appr_EmployeeList]([Appraisal_year] ASC, [Unit_ID] ASC, [Employee_ID] ASC, [Appraisal_type] ASC);


GO
CREATE NONCLUSTERED INDEX [EPA_Appr_EmployeeList_index_YearUserID]
    ON [dbo].[EPA_Appr_EmployeeList]([Appraisal_year] ASC, [UserID] ASC);

