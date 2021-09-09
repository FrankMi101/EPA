
 create proc dbo.Extract_SSRS_ReportaNameAndColumns
 as 

 Select * from sys.tables
 /*

WITH XMLNAMESPACES  ( DEFAULT 'http://schemas.microsoft.com/sqlserver/reporting/2008/01/reportdefinition', 'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS rd )

SELECT ReportName  = name
     ,DataSetName  = x.value('(@Name)[1]', 'VARCHAR(250)') 
    ,DataSourceName = x.value('(Query/DataSourceName)[1]','VARCHAR(250)')
    ,CommandText  = x.value('(Query/CommandText)[1]','VARCHAR(250)')
   ,Fields   = df.value('(@Name)[1]','VARCHAR(250)')
   ,DataField  = df.value('(DataField)[1]','VARCHAR(250)')
   ,DataType  = df.value('(rd:TypeName)[1]','VARCHAR(250)')
   ,ConnectionString = x.value('(ConnectionProperties/ConnectString)[1]','VARCHAR(250)')
 FROM ( SELECT C.Name,CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML
      FROM dbo.Catalog C
     WHERE C.Content is not null
      AND C.Type = 2  and PAth like ('/TAMReports%') -- add by Frank
   ) a
 CROSS APPLY reportXML.nodes('/Report/DataSets/DataSet') r ( x )
 CROSS APPLY x.nodes('Fields/Field') f(df) 
ORDER BY name
 


WITH XMLNAMESPACES ( DEFAULT 'http://schemas.microsoft.com/sqlserver/reporting/2016/01/reportdefinition', 'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS rd )
SELECT ReportName  = name
     ,DataSetName  = x.value('(@Name)[1]', 'VARCHAR(250)') 
    ,DataSourceName = x.value('(Query/DataSourceName)[1]','VARCHAR(250)')
    ,CommandText  = x.value('(Query/CommandText)[1]','VARCHAR(250)')
   ,Fields   = df.value('(@Name)[1]','VARCHAR(250)')
   ,DataField  = df.value('(DataField)[1]','VARCHAR(250)')
   ,DataType  = df.value('(rd:TypeName)[1]','VARCHAR(250)')
   --,ConnectionString = x.value('(ConnectionProperties/ConnectString)[1]','VARCHAR(250)')
 FROM ( SELECT C.Name,CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML
      FROM ReportServer.dbo.Catalog C
     WHERE C.Content is not null
      AND C.Type = 2
   ) a
 CROSS APPLY reportXML.nodes('/Report/DataSets/DataSet') r ( x )
 CROSS APPLY x.nodes('Fields/Field') f(df) 
ORDER BY name
*/