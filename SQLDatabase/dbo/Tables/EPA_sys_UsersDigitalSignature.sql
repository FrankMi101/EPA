CREATE TABLE [dbo].[EPA_sys_UsersDigitalSignature] (
    [Employee_ID]       VARCHAR (20)  NOT NULL,
    [DateTimeStamp]     VARCHAR (50)  NULL,
    [Digital_Signature] VARCHAR (250) NULL,
    [UserID]            VARCHAR (30)  NULL,
    [FirstName]         VARCHAR (50)  NULL,
    [LastName]          VARCHAR (50)  NULL,
    [lu_function]       VARCHAR (50)  NULL,
    [lu_date]           SMALLDATETIME NULL,
    [lu_user]           VARCHAR (20)  NULL,
    CONSTRAINT [PK_upa_sys_UsersDigitalSignature] PRIMARY KEY CLUSTERED ([Employee_ID] ASC)
);

