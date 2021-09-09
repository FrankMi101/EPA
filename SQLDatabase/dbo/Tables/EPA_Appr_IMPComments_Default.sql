CREATE TABLE [dbo].[EPA_Appr_IMPComments_Default] (
    [IDs]         INT           IDENTITY (1, 1) NOT NULL,
    [Criteria]    VARCHAR (250) NULL,
    [lu_function] VARCHAR (50)  NULL,
    [lu_date]     SMALLDATETIME NULL,
    [lu_user]     VARCHAR (20)  NULL
);

