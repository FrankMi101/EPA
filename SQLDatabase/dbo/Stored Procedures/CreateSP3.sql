CREATE proc dbo.CreateSP3
as 
DECLARE @storeProcname NVARCHAR(MAX) = ''

SET @storeProcname = 'myStoredProc'

DECLARE @strSQL AS VARCHAR(MAX) = 'CREATE TABLE myTableName '

SELECT @strSQL = @strSQL+STUFF((
SELECT ',' +name+' ' + system_type_name 
FROM sys.dm_exec_describe_first_result_set_for_object (OBJECT_ID(@storeProcname),0)
FOR XML PATH('')
),1,1,'(') + ')'

EXEC (@strSQL)

--INSERT INTO myTableName
--EXEC ('myStoredProc @param1=1, @param2=2')

--SELECT * FROM myTableName

--DROP TABLE myTableName