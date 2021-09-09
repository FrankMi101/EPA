CREATE TABLE [dbo].[EPA_Appr_SignOff] (
    [School_Year]    VARCHAR (8)   NOT NULL,
    [School_Code]    VARCHAR (8)   NOT NULL,
    [EmployeeID]     VARCHAR (20)  NOT NULL,
    [SessionID]      VARCHAR (20)  NOT NULL,
    [ItemCode]       VARCHAR (10)  NOT NULL,
    [Category]       VARCHAR (10)  NOT NULL,
    [SignOff_Type]   VARCHAR (20)  NOT NULL,
    [SignOff_Action] VARCHAR (30)  NOT NULL,
    [SignOff_Date]   VARCHAR (30)  NULL,
    [Signature]      VARCHAR (50)  NULL,
    [DigitalKey]     VARCHAR (250) NULL,
    [lu_function]    VARCHAR (50)  NULL,
    [lu_date]        SMALLDATETIME NULL,
    [lu_user]        VARCHAR (20)  NULL,
    CONSTRAINT [PK_EPA_Appr_SignOff_1] PRIMARY KEY CLUSTERED ([School_Year] ASC, [School_Code] ASC, [EmployeeID] ASC, [SessionID] ASC, [ItemCode] ASC, [Category] ASC, [SignOff_Type] ASC)
);

