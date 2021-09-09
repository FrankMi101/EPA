CREATE PROCEDURE usingTableName --'EPA_Org_Schools'
  @TableName NVARCHAR(128) 
AS 
BEGIN 
  SET NOCOUNT ON
  DECLARE @Sql NVARCHAR(MAX)

SET @Sql = N'SELECT TOP 10 * INTO #Temp_Table_One 
              FROM ' + 'dbo.'+ QUOTENAME(@TableName)
          + N' SELECT * FROM #Temp_Table_One '

 EXECUTE sp_executesql @Sql
END