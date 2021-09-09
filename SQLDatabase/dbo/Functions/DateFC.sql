

--drop function dbo.DateFC

CREATE FUNCTION [dbo].[DateFC](@vDate Varchar(30), @vType varchar(20))
RETURNS datetime 
AS  
BEGIN 
	declare @vYY varchar(4)
	declare @vMM Varchar(2)
	declare @vDD varchar(2)
	declare @rValue varchar(15)
	declare @dValue datetime
if @vDate is null
   set @dValue = CONVERT (datetime, '2000/01/01')
else if @vDate =''
      set @dValue =null
else if len(@vDate)= 8   
      begin
		set @vYY = substring(@vDate,1,4)
		set @vMM = substring(@vDate,5,2)
		set @vDD = substring(@vDate,7,2)
		set @rValue = @vYY +'/' +@vMM + '/'+@vDD
		set @dValue = CONVERT (datetime, @rValue)
   	end  
else if  len(@vDate) < 10   
     set @dValue = null  
else 
    begin 
        if @vType ='YYYYMMDD'
            begin
				set @vYY = left(@vDate,4)
				set @vMM = substring(@vDate,6,2)
				set @vDD = substring(@vDate,9,2)
                set @rValue = @vYY +'/' +@vMM + '/'+@vDD
        	 end  
    	else if @vType ='YMD'
                begin
					set @vYY = substring(@vDate,1,4)
					set @vMM = substring(@vDate,5,2)
					set @vDD = substring(@vDate,7,2)
                	set @rValue = @vYY +'/' +@vMM + '/'+@vDD
       	 		end  
       	else if @vType ='DDMMYYYY'
            begin
				set @vYY = substring(@vDate,7,4)
				set @vMM = substring(@vDate,4,2)
				set @vDD = left(@vDate,2)
               	set @rValue = @vYY +'/' +@vMM + '/'+@vDD
       	 	end   	
    	else if @vType ='MMDDYYYY'
      		begin
     			set @vYY = substring(@vDate,7,4)
				set @vMM = left(@vDate,2)
				set @vDD = substring(@vDate,4,2)
               	set @rValue = @vYY +'/' +@vMM + '/'+@vDD             
      		end
        set @dValue = CONVERT (datetime, @rValue)
      end
return @dValue
end
 
