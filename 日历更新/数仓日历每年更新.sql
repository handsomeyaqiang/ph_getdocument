BEGIN
declare p_date date;  
set p_date = '2021-01-01';
WHILE p_date <'2022-01-01' DO
delete from ods.o_metadata_t_md_calendar_a where date= p_date;

insert into ods.o_metadata_t_md_calendar_a(DATE
,`MONTH`
,month_name
,`quarter`
,`YEAR`
,`DAY`
,`week`
,week_name
,week_name_s
,day_in_week
,day_in_month
,day_in_quarter
,day_in_year
,week_in_month
,week_in_quarter
,week_in_year
,month_in_quarter
,month_in_year
,close_day_in_prev_week
,first_day_in_week
,last_day_in_week
,description
,close_day_in_prev_month
,first_day_in_month
,last_day_in_month
,close_day_in_prev_quarter
,first_day_in_quarter
,last_day_in_quarter
,close_day_in_prev_year
,first_day_in_year
,last_day_in_year
,is_month_end
,is_week_end
,is_quarter_end
,is_year_end
,business_day
,internal_business_day)
select p_date as date
,MONTH(p_date) as month
,MONTHNAME(p_date) as month_name
,QUARTER(p_date) as `QUARTER`
,year(p_date) as `year`
,day(p_date) as `day`
,week(p_date) as `week`
,date_format(p_date,'%W') as week_name
,substr(date_format(p_date,'%W'),1,3) as week_name_s
,case when date_format(p_date,'%w')=0 then 7 else date_format(p_date,'%w') END as day_in_week
,DAYOFMONTH(p_date) as day_in_month
,case when p_date >=concat(substr(p_date,1,4),'-01-01') and p_date < concat(substr(p_date,1,4),'-04-01') then DATEDIFF(p_date,concat(substr(p_date,1,4),'-01-01'))+1 
when p_date >=concat(substr(p_date,1,4),'-04-01') and p_date < concat(substr(p_date,1,4),'-07-01') then DATEDIFF(p_date,concat(substr(p_date,1,4),'-04-01'))+1 
when p_date >=concat(substr(p_date,1,4),'-07-01') and p_date < concat(substr(p_date,1,4),'-10-01') then DATEDIFF(p_date,concat(substr(p_date,1,4),'-07-01'))+1 
when p_date >=concat(substr(p_date,1,4),'-10-01') and p_date < DATE_ADD(concat(substr(p_date,1,4),'-12-31'),INTERVAL 1 day) then DATEDIFF(p_date,concat(substr(p_date,1,4),'-10-01'))+1 
else '' END as day_in_quarter
,DAYOFYEAR(p_date) as day_in_year
,0 as week_in_month
,0 as week_in_quarter
,WEEKOFYEAR(p_date) as week_in_year
,ceiling(MONTH(p_date)/3) as month_in_quarter
,MONTH(p_date) as month_in_year
,DATE_SUB(p_date,INTERVAL DAYOFWEEK(DATE_SUB(p_date,INTERVAL 1 day)) day) as close_day_in_prev_week
,DATE_ADD(DATE_SUB(p_date,INTERVAL DAYOFWEEK(DATE_SUB(p_date,INTERVAL 1 day)) day),INTERVAL 1 day) as first_day_in_week
,DATE_ADD(DATE_SUB(p_date,INTERVAL DAYOFWEEK(DATE_SUB(p_date,INTERVAL 1 day)) day),INTERVAL 7 day) as last_day_in_week
,'' as description
,DATE_SUB(concat(substr(p_date,1,7),'-01'),INTERVAL 1 day) as close_day_in_prev_month
,concat(substr(p_date,1,7),'-01') as first_day_in_month
,LAST_DAY(p_date) as last_day_in_month
,case when p_date >=concat(substr(p_date,1,4),'-01-01') and p_date < concat(substr(p_date,1,4),'-04-01') then DATE_SUB(concat(substr(p_date,1,4),'-01-01'),INTERVAL 1 day) 
when p_date >=concat(substr(p_date,1,4),'-04-01') and p_date < concat(substr(p_date,1,4),'-07-01') then concat(substr(p_date,1,4),'-03-31') 
when p_date >=concat(substr(p_date,1,4),'-07-01') and p_date < concat(substr(p_date,1,4),'-10-01') then concat(substr(p_date,1,4),'-06-30') 
when p_date >=concat(substr(p_date,1,4),'-10-01') and p_date < DATE_ADD(concat(substr(p_date,1,4),'-12-31'),INTERVAL 1 day) then concat(substr(p_date,1,4),'-09-30') 
else '' END  as close_day_in_prev_quarter
,case when p_date >=concat(substr(p_date,1,4),'-01-01') and p_date < concat(substr(p_date,1,4),'-04-01') then concat(substr(p_date,1,4),'-01-01') 
when p_date >=concat(substr(p_date,1,4),'-04-01') and p_date < concat(substr(p_date,1,4),'-07-01') then concat(substr(p_date,1,4),'-04-01') 
when p_date >=concat(substr(p_date,1,4),'-07-01') and p_date < concat(substr(p_date,1,4),'-10-01') then concat(substr(p_date,1,4),'-07-01') 
when p_date >=concat(substr(p_date,1,4),'-10-01') and p_date < DATE_ADD(concat(substr(p_date,1,4),'-12-31'),INTERVAL 1 day) then concat(substr(p_date,1,4),'-10-01') 
else '' END as first_day_in_quarter
,case when p_date >=concat(substr(p_date,1,4),'-01-01') and p_date < concat(substr(p_date,1,4),'-04-01') then concat(substr(p_date,1,4),'-03-31') 
when p_date >=concat(substr(p_date,1,4),'-04-01') and p_date < concat(substr(p_date,1,4),'-07-01') then concat(substr(p_date,1,4),'-06-30') 
when p_date >=concat(substr(p_date,1,4),'-07-01') and p_date < concat(substr(p_date,1,4),'-10-01') then concat(substr(p_date,1,4),'-09-30') 
when p_date >=concat(substr(p_date,1,4),'-10-01') and p_date < DATE_ADD(concat(substr(p_date,1,4),'-12-31'),INTERVAL 1 day) then concat(substr(p_date,1,4),'-12-31') 
else '' END as last_day_in_quarter
,DATE_SUB(concat(substr(p_date,1,4),'-01-01'),INTERVAL 1 day) as close_day_in_prev_year
,concat(substr(p_date,1,4),'-01-01') as first_day_in_year
,concat(substr(p_date,1,4),'-12-31') as last_day_in_year
,case when p_date = LAST_DAY(p_date) then 1 else 0 END as is_month_end
,case when date_format(p_date,'%w')=0 then 1 else 0 END as is_week_end
,case when p_date = LAST_DAY(p_date) and MONTH(p_date) in (3,6,9,12) then 1 else 0 END as is_quarter_end
,case when p_date = concat(substr(p_date,1,4),'-12-31') then 1 else 0 END  as is_year_end
,case when date_format(p_date,'%w') in (1,2,3,4,5) then 1 else 0 END as business_day
,0 as internal_business_day;
set p_date = DATE_ADD(p_date,INTERVAL 1 day); 
END WHILE;
END