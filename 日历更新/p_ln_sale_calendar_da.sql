-- 年初p_ln_sale_calendar_da表初始化，按月更新
-- cur_month 2020-01-01/2020-01-31
-- last_month 2019-12-01/2019-12-31
insert into app.p_ln_sale_calendar_da
select t2.DATE
,t2.business_day
,t2.workdayth
,t2.workdays
,t2.workdayth/t2.workdays as workday_precent
,case when t2.workdayth = 0 then tb3.data_dt
        when t2.workdayth = 1 then tb2.data_dt
        when t2.workdayth = 2 then tb1.data_dt
      when t2.workdayth >= 3 then t7.DATE end as prethreeday
,case when t2.workdayth = 0 then tb4.data_dt
        when t2.workdayth = 1 then tb3.data_dt
        when t2.workdayth = 2 then tb2.data_dt
        when t2.workdayth = 3 then tb1.data_dt
       when t2.workdayth >= 4 then t8.DATE end as prefourday
,t2.nextworkday
,case when t2.is_lastday = 1 then t2.lastmonthday else  ifnull(t3.data_dt,t4.data_dt) end
,case when t2.workdayth = 0 then tb5.data_dt
        when t2.workdayth = 1 then tb4.data_dt
        when t2.workdayth = 2 then tb3.data_dt
        when t2.workdayth = 3 then tb2.data_dt
        when t2.workdayth = 4 then tb1.data_dt
       when t2.workdayth >= 5 then t9.DATE end as prefiveday
from (
select t.DATE
,t.business_day
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year  ) as workdays
,DATE_SUB(t.date,INTERVAL 3 day) as prethreeday
,DATE_SUB(t.date,INTERVAL 4 day) as prefourday
,DATE_SUB(t.date,INTERVAL 5 day) as prefiveday
,(select min(t1.date) from ods.o_metadata_t_md_calendar_a t1 where t1.month >= t.month and t1.month <= t.month + 1 and t1.year = t.year and t1.date > t.date and t1.business_day = 1) as nextworkday
,last_day(DATE_SUB(t.DATE,INTERVAL 1 month)) as lastmonthday
,case when t.date = t.last_day_in_month then 1 else 0 end as is_lastday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2020-01-31')t2
left join 
(select workdayth,min(data_dt) as data_dt from app.p_ln_sale_calendar_da  
where data_dt between '2019-12-01' and '2019-12-31'
group by workdayth)t3 on t3.workdayth = case when t2.workdayth = 0 then 1 else t2.workdayth end
left join 
(select workdayth,min(data_dt) as data_dt from app.p_ln_sale_calendar_da  
where data_dt between '2019-12-01' and '2019-12-31'
and workdayth = workdays
group by workdayth)t4 on 1=1
left join 
(select workdays - workdayth + 1,min(data_dt) as data_dt from app.p_ln_sale_calendar_da  
where data_dt between '2019-12-01' and '2019-12-31'
and workdays - workdayth + 1 = 1
group by workdays - workdayth + 1)tb1 on  1 =1
left join 
(select workdays - workdayth + 1,min(data_dt) as data_dt from app.p_ln_sale_calendar_da  
where data_dt between '2019-12-01' and '2019-12-31'
and workdays - workdayth + 1 = 2
group by workdays - workdayth + 1)tb2 on  1 =1
left join 
(select workdays - workdayth + 1,min(data_dt) as data_dt from app.p_ln_sale_calendar_da  
where data_dt between '2019-12-01' and '2019-12-31'
and workdays - workdayth + 1 = 3
group by workdays - workdayth + 1)tb3 on  1 =1
left JOIN
(select workdays - workdayth + 1,min(data_dt) as data_dt from app.p_ln_sale_calendar_da  
where data_dt between '2019-12-01' and '2019-12-31'
and workdays - workdayth + 1 = 4
group by workdays - workdayth + 1)tb4 on  1 =1
left JOIN
(select workdays - workdayth + 1,min(data_dt) as data_dt from app.p_ln_sale_calendar_da  
where data_dt between '2019-12-01' and '2019-12-31'
and workdays - workdayth + 1 = 5
group by workdays - workdayth + 1)tb5 on  1 =1
left join (
select workdayth,min(date) as date
from 
(
select t.DATE
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2020-01-31')
c group by workdayth)t7 on t7.workdayth = t2.workdayth - 2
left join (
select workdayth,min(date) as date
from 
(
select t.DATE
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2020-01-31')
c group by workdayth)t8 on t8.workdayth = t2.workdayth - 3
left join (
select workdayth,min(date) as date
from 
(
select t.DATE
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2020-01-31')
c group by workdayth)t9 on t9.workdayth = t2.workdayth - 4
;





-- 年初d_dim_date_same_period表初始化
insert into dim.d_dim_date_same_period
select 
t.DATE
,t.first_date
,t.workdayth
,ifnull(t1.DATE,tb1.DATE)
,ifnull(t1.first_date,tb1.first_date)
,ifnull(t1.workdayth,tb1.maxworkday) 
,ifnull(t2.DATE,tb2.DATE)
,ifnull(t2.first_date,tb2.first_date)
,ifnull(t2.workdayth,tb2.maxworkday) 
,ifnull(t3.DATE,tb3.DATE)
,ifnull(t3.first_date,tb3.first_date)
,ifnull(t3.workdayth,tb3.maxworkday) 
,ifnull(t4.DATE,tb4.DATE)
,ifnull(t4.first_date,tb4.first_date)
,ifnull(t4.workdayth,tb4.maxworkday) 
,ifnull(t5.DATE,tb5.DATE)
,ifnull(t5.first_date,tb5.first_date)
,ifnull(t5.workdayth,tb5.maxworkday) 
,ifnull(t6.DATE,tb6.DATE)
,ifnull(t6.first_date,tb6.first_date)
,ifnull(t6.workdayth,tb6.maxworkday) 
,ifnull(t7.DATE,tb7.DATE)
,ifnull(t7.first_date,tb7.first_date)
,ifnull(t7.workdayth,tb7.maxworkday) 
,ifnull(t8.DATE,tb8.DATE)
,ifnull(t8.first_date,tb8.first_date)
,ifnull(t8.workdayth,tb8.maxworkday) 
,ifnull(t9.DATE,tb9.DATE)
,ifnull(t9.first_date,tb9.first_date)
,ifnull(t9.workdayth,tb9.maxworkday) 
,ifnull(t10.DATE,tb10.DATE)
,ifnull(t10.first_date,tb10.first_date)
,ifnull(t10.workdayth,tb10.maxworkday) 
,ifnull(t11.DATE,tb11.DATE)
,ifnull(t11.first_date,tb11.first_date)
,ifnull(t11.workdayth,tb11.maxworkday) 
,ifnull(t12.DATE,tb12.DATE)
,ifnull(t12.first_date,tb12.first_date)
,ifnull(t12.workdayth,tb12.maxworkday) 
from (select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2021-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t1 on t1.first_date = DATE_SUB(t.first_date,INTERVAL 1 month) and t1.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t2 on t2.first_date = DATE_SUB(t.first_date,INTERVAL 2 month) and t2.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t3 on t3.first_date = DATE_SUB(t.first_date,INTERVAL 3 month) and t3.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t4 on t4.first_date = DATE_SUB(t.first_date,INTERVAL 4 month) and t4.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t5 on t5.first_date = DATE_SUB(t.first_date,INTERVAL 5 month) and t5.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t6 on t6.first_date = DATE_SUB(t.first_date,INTERVAL 6 month) and t6.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t7 on t7.first_date = DATE_SUB(t.first_date,INTERVAL 7 month) and t7.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t8 on t8.first_date = DATE_SUB(t.first_date,INTERVAL 8 month) and t8.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t9 on t9.first_date = DATE_SUB(t.first_date,INTERVAL 9 month) and t9.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t10 on t10.first_date = DATE_SUB(t.first_date,INTERVAL 10 month) and t10.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t11 on t11.first_date = DATE_SUB(t.first_date,INTERVAL 11 month) and t11.workdayth = t.workdayth
left join (
select t.DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,(select sum(business_day) from ods.o_metadata_t_md_calendar_a t1 where t1.month = t.month and t1.year = t.year and t1.date <= t.date ) as workdayth
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1)t12 on t12.first_date = DATE_SUB(t.first_date,INTERVAL 12 month) and t12.workdayth = t.workdayth

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb1 on tb1.first_date = DATE_SUB(t.first_date,INTERVAL 1 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb2 on tb2.first_date = DATE_SUB(t.first_date,INTERVAL 2 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb3 on tb3.first_date = DATE_SUB(t.first_date,INTERVAL 3 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb4 on tb4.first_date = DATE_SUB(t.first_date,INTERVAL 4 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb5 on tb5.first_date = DATE_SUB(t.first_date,INTERVAL 5 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb6 on tb6.first_date = DATE_SUB(t.first_date,INTERVAL 6 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb7 on tb7.first_date = DATE_SUB(t.first_date,INTERVAL 7 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb8 on tb8.first_date = DATE_SUB(t.first_date,INTERVAL 8 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb9 on tb9.first_date = DATE_SUB(t.first_date,INTERVAL 9 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb10 on tb10.first_date = DATE_SUB(t.first_date,INTERVAL 10 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb11 on tb11.first_date = DATE_SUB(t.first_date,INTERVAL 11 month) 

left join (
select max(t.DATE) as DATE
,CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01') as first_date
,count(1) as maxworkday
from ods.o_metadata_t_md_calendar_a t
where t.date >= '2020-01-01'
and t.date <= '2021-12-31'
and t.business_day = 1
group by CONCAT(DATE_FORMAT(t.DATE,'%Y-%m'),'-01'))tb12 on tb12.first_date = DATE_SUB(t.first_date,INTERVAL 12 month) 








