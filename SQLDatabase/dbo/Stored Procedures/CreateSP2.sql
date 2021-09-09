create proc dbo.CreateSP2
as 

declare @procname nvarchar(255) = 'myProcedure',
            @sql nvarchar(max) 
   begin
  
		set @sql = 'create table ##' + @procname + ' ('
           select      @sql = @sql + '[' + r.name + '] ' +  r.system_type_name + ','
            from        sys.procedures AS p
            cross apply sys.dm_exec_describe_first_result_set_for_object(p.object_id, 0) AS r
            where       p.name = @procname

            set @sql = substring(@sql,1,len(@sql)-1) + ')'

            execute (@sql)
            execute('insert ##' + @procname + ' exec ' + @procname)
    end
--	select * from sys.procedures