


-- drop function dbo.DateF

CREATE FUNCTION [dbo].[DateF](@vDate datetime, @vType varchar(20))
RETURNS varchar(15) 
AS  
BEGIN 
declare @vYY varchar(4)
declare @vMM Varchar(2)
declare @vMMM Varchar(5)
declare @vDD varchar(2)
declare @rValue varchar(15)
if @vDate is not null
    begin 
		   if @vType ='MMMDDYYYY'
                begin
					set @vYY = year(@vDate)
					set @vDD = day(@vDate)
					set @vMMM= case month(@vDate)            
  								when 1 then 'Jan.'
  								when 2 then 'Feb.'
  								when 3 then 'March'
  								when 4 then 'Apr.'
  								when 5 then 'May'
  								when 6 then 'June'
  								when 7 then 'July'
  								when 8 then 'Aug.'
  								when 9 then 'Sept.'
  								when 10 then 'Oct.'
  								when 11 then 'Nov.'
  								when 12 then 'Dec.'
											else   'No' end
					if  @vDD >9 	
						set @vDD = cast(@vDD as char(2))
					else
						set @vDD = '0' + Cast(@vDD as char(1))

             	 set @rValue =  rtrim(@vMMM) + ' '+ @vDD + ', ' + @vYY  
			                  
        	   end  
          if @vType ='YYYYMMDD'
                begin
					set @vYY = year(@vDate)
					set @vMM = month(@vDate)
					set @vDD = day(@vDate)
					if  @vMM >9  	set @vMM = cast(@vMM as char(2))
					else  		set @vMM = '0' + cast(@vMM as char(1))
					if  @vDD >9 	set @vDD = cast(@vDD as char(2))
					else 		set @vDD = '0' + Cast(@vDD as char(1))
             					set @rValue = @vYY +'/' +@vMM + '/'+@vDD
			                  
        	   end  
     	 if @vType ='YYYY-MM-DD'
                begin
					set @vYY = year(@vDate)
					set @vMM = month(@vDate)
					set @vDD = day(@vDate)
					if  @vMM >9  	set @vMM = cast(@vMM as char(2))
					else  		set @vMM = '0' + cast(@vMM as char(1))
					if  @vDD >9 	set @vDD = cast(@vDD as char(2))
					else 		set @vDD = '0' + Cast(@vDD as char(1))
             					set @rValue = @vYY +'-' +@vMM + '-'+@vDD
			                  
    		   end  

          if @vType ='YYYYMM'
                begin
					set @vYY = year(@vDate)
					set @vMM = month(@vDate)
					set @vDD = day(@vDate)
					if  @vMM >9  	set @vMM = cast(@vMM as char(2))
					else  		set @vMM = '0' + cast(@vMM as char(1))
					if  @vDD >9 	set @vDD = cast(@vDD as char(2))
					else 		set @vDD = '0' + Cast(@vDD as char(1))
             					set @rValue =  @vYY  +'/' +@vMM 
        		 end
         if @vType ='YYMM'
                begin
					set @vYY = year(@vDate)
					set @vMM = month(@vDate)
					set @vDD = day(@vDate)
					if  @vMM >9  	set @vMM = cast(@vMM as char(2))
					else  		set @vMM = '0' + cast(@vMM as char(1))
					if  @vDD >9 	set @vDD = cast(@vDD as char(2))
					else 		set @vDD = '0' + Cast(@vDD as char(1))
             					set @rValue = right(@vYY,2) +'/' +@vMM 
        	   end    
         if @vType ='MMDD'
            begin
				set @vYY = year(@vDate)
				set @vMM = month(@vDate)
				set @vDD = day(@vDate)
				if  @vMM >9  	set @vMM = cast(@vMM as char(2))
				else  		set @vMM = '0' + cast(@vMM as char(1))
				if  @vDD >9 	set @vDD = cast(@vDD as char(2))
				else 		set @vDD = '0' + Cast(@vDD as char(1))
             		set @rValue =  @vMM  +'/' +@vDD 
        	 end    

        if @vType ='Month'  
            set @rValue= case month(@vDate)            
  			when 1 then 'Jan.'
  			when 2 then 'Feb.'
  			when 3 then 'March'
  			when 4 then 'Apr.'
  			when 5 then 'May'
  			when 6 then 'June'
  			when 7 then 'July'
  			when 8 then 'Aug.'
  			when 9 then 'Sept.'
  			when 10 then 'Oct.'
  			when 11 then 'Nov.'
  			when 12 then 'Dec.'
                        else   'No' end
--            set @rValue= case month(@vDate)            
--  			when 1 then 'January'
--  			when 2 then 'February'
--  			when 3 then 'March'
--  			when 4 then 'April'
--  			when 5 then 'May'
--  			when 6 then 'June'
--  			when 7 then 'July'
--  			when 8 then 'August'
--  			when 9 then 'September'
--  			when 10 then 'October'
--  			when 11 then 'November'
--  			when 12 then 'December'
--                        else  'No' end
        if @vType ='MonthS'  
            set @rValue= case month(@vDate)            
  			when 1 then 'Jan.'
  			when 2 then 'Feb.'
  			when 3 then 'March'
  			when 4 then 'Apr.'
  			when 5 then 'May'
  			when 6 then 'June'
  			when 7 then 'July'
  			when 8 then 'Aug.'
  			when 9 then 'Sept.'
  			when 10 then 'Oct.'
  			when 11 then 'Nov.'
  			when 12 then 'Dec.'
                        else   'No' end

        if @vType = 'WeekDay'
             set @rValue=  datepart(dw, @vDate)                 
     if @vType = 'Week'
             set @rValue= case datepart(dw, @vDate)            
    			when 1 then 'Sunday'
  			when 2 then 'Monday'
  			when 3 then 'Tuesday'
  			when 4 then 'Wednesday'
  			when 5 then 'Thursday'
  			when 6 then 'Friday'
  			when 7 then 'Saturday'
 			else  'No' end
 	if @vType = 'WeekS'
             set @rValue= case datepart(dw, @vDate)            
    			when 1 then 'Sun'
  			when 2 then 'Mon'
  			when 3 then 'Tue'
  			when 4 then 'Wed'
  			when 5 then 'Thu'
  			when 6 then 'Fri'
  			when 7 then 'Sat'
 			else  'No' end
	if @vType = 'Week3'
             set @rValue= case datepart(dw, @vDate)            
    			when 1 then 'Sun'
  			when 2 then 'Mo'
  			when 3 then 'Tue'
  			when 4 then 'We'
  			when 5 then 'Thu'
  			when 6 then 'Fri'
  			when 7 then 'Sat'
 			else  'No' end
  	if @vType = 'Week2'
             set @rValue= case datepart(dw, @vDate)            
    			when 1 then 'Su'
  			when 2 then 'M'
  			when 3 then 'Tu'
  			when 4 then 'W'
  			when 5 then 'Th'
  			when 6 then 'Fr'
  			when 7 then 'Sa'
 			else  'No' end

    end
else
    set @rValue =''
 
  return @rValue
end


