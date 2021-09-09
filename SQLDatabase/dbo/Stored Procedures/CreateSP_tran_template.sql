
create proc [dbo].[CreateSP_tran_template]
as 

	begin
		begin try
			 --	{ SQL statements  }
	 
			Select 'Successfully' as rValue
       end try
	   begin catch
			   Select 'Failed' as rValue		
	   end catch
  end


   begin
		begin try
		   begin tran
			   --	{ SQL statements  }
		   commit tran	
				Select 'Successfully' as rValue
       end try
	   begin catch
           Rollback tran
		   Select 'Failed' as rValue		
	   end catch
  end
