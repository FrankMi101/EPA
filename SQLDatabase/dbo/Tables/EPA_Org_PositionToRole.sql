CREATE TABLE [dbo].[EPA_Org_PositionToRole] (
    [Employee_Position] VARCHAR (150) NULL,
    [Appraisal_Role]    VARCHAR (150) NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EPA_Org_PositionToRole_index_unique]
    ON [dbo].[EPA_Org_PositionToRole]([Employee_Position] ASC);

