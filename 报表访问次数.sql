select a.name_1
,a.name_2
,a.name_3
,a.name_4
,a.reportname
,max(ifnull(c.visit_cnt,0)) as visit_cnt_total
,sum(case when b.log_month = '2019-03' then b.visit_cnt else 0 end ) as visit_cnt_03
,sum(case when b.log_month = '2019-04' then b.visit_cnt else 0 end ) as visit_cnt_04
,sum(case when b.log_month = '2019-05' then b.visit_cnt else 0 end ) as visit_cnt_05
,sum(case when b.log_month = '2019-06' then b.visit_cnt else 0 end ) as visit_cnt_06
,sum(case when b.log_month = '2019-07' then b.visit_cnt else 0 end ) as visit_cnt_07
,sum(case when b.log_month = '2019-08' then b.visit_cnt else 0 end ) as visit_cnt_08
,sum(case when b.log_month = '2019-09' then b.visit_cnt else 0 end ) as visit_cnt_09
,sum(case when b.log_month = '2019-10' then b.visit_cnt else 0 end ) as visit_cnt_10
,sum(case when b.log_month = '2019-11' then b.visit_cnt else 0 end ) as visit_cnt_11
,sum(case when b.log_month = '2019-12' then b.visit_cnt else 0 end ) as visit_cnt_12
,sum(case when b.log_month = '2020-01' then b.visit_cnt else 0 end ) as visit_cnt_2001
,sum(case when b.log_month = '2020-02' then b.visit_cnt else 0 end ) as visit_cnt_2002
,max(ifnull(c.user_cnt,0)) as user_cnt_total
,sum(case when b.log_month = '2019-03' then b.user_cnt else 0 end ) as user_cnt_03
,sum(case when b.log_month = '2019-04' then b.user_cnt else 0 end ) as user_cnt_04
,sum(case when b.log_month = '2019-05' then b.user_cnt else 0 end ) as user_cnt_05
,sum(case when b.log_month = '2019-06' then b.user_cnt else 0 end ) as user_cnt_06
,sum(case when b.log_month = '2019-07' then b.user_cnt else 0 end ) as user_cnt_07
,sum(case when b.log_month = '2019-08' then b.user_cnt else 0 end ) as user_cnt_08
,sum(case when b.log_month = '2019-09' then b.user_cnt else 0 end ) as user_cnt_09
,sum(case when b.log_month = '2019-10' then b.user_cnt else 0 end ) as user_cnt_10
,sum(case when b.log_month = '2019-11' then b.user_cnt else 0 end ) as user_cnt_11
,sum(case when b.log_month = '2019-12' then b.user_cnt else 0 end ) as user_cnt_12
,sum(case when b.log_month = '2020-01' then b.user_cnt else 0 end ) as user_cnt_2001
,sum(case when b.log_month = '2020-02' then b.user_cnt else 0 end ) as user_cnt_2002
,a.reportletPath
,a.description
from app.p_report_cpt_info_01 a
left join (select tname
,DATE_FORMAT(log_date,'%Y-%m') as log_month 
,sum(visit_cnt) as visit_cnt
,count(DISTINCT username) as user_cnt
from app.p_report_visit_log_info_00
where log_date >= '2019-03-01'
group by tname
,DATE_FORMAT(log_date,'%Y-%m'))b on  a.reportletPath = b.tname
left join (select tname
,sum(visit_cnt) as visit_cnt
,count(DISTINCT username) as user_cnt
from app.p_report_visit_log_info_00
where log_date >= '2019-03-01'
group by tname)c on  a.reportletPath = c.tname
where a.name_1 = '财务管理报表' 
group by a.name_1
,a.name_2
,a.name_3
,a.name_4
,a.reportname
,a.reportletPath
,a.description