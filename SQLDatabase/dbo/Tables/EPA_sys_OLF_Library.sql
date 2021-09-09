CREATE TABLE [dbo].[EPA_sys_OLF_Library] (
    [TreeLevel] INT           NULL,
    [Level1]    INT           NULL,
    [Level2]    INT           NULL,
    [Level3]    INT           NULL,
    [Level4]    INT           NULL,
    [Notes]     VARCHAR (500) NULL
);


GO
CREATE NONCLUSTERED INDEX [EPA_sys_OLF_Library_index]
    ON [dbo].[EPA_sys_OLF_Library]([Level1] ASC, [Level2] ASC, [Level3] ASC, [Level4] ASC);

