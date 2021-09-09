CREATE TABLE [dbo].[EPA_sys_StandardCode] (
    [IDS]       INT           IDENTITY (1, 1) NOT NULL,
    [Orderby]   VARCHAR (3)   NOT NULL,
    [ListType]  VARCHAR (20)  NULL,
    [ListValue] VARCHAR (20)  NULL,
    [ListText]  VARCHAR (300) NULL,
    CONSTRAINT [PK_EPA_sys_StandardCode] PRIMARY KEY CLUSTERED ([IDS] ASC)
);


GO
CREATE NONCLUSTERED INDEX [EPA_sys_StandardCode_index]
    ON [dbo].[EPA_sys_StandardCode]([ListType] ASC, [ListValue] ASC, [Orderby] ASC);

