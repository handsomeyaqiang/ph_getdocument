-- 146	个贷南区
-- 343	合肥区域
-- 月末C值
select a.report_date
,sum(a.rest_pricinal) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147
group by a.report_date;
-- 个贷南区
select a.report_date
,sum(a.rest_pricinal) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.city_id=146
group by a.report_date;
-- 合肥市
select a.report_date
,sum(a.rest_pricinal) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.region_name='合肥市'
group by a.report_date;

-- 合肥区域
select d.STORE_NAME
,a.report_date
,sum(a.rest_pricinal) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID  =343
group by d.STORE_NAME,a.report_date;


-- 合肥区域 门店
select d.GROUP_NAME
,a.report_date
,sum(a.rest_pricinal) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID  =343
group by d.GROUP_NAME,a.report_date;

-- 月末小C值（MOB8）
select a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147
group by a.report_date;



 select a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.city_id=146
group by a.report_date;


 select a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.region_name='合肥市'
group by a.report_date;


select d.STORE_NAME,a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID  =343
group by d.STORE_NAME,a.report_date;


 select d.GROUP_NAME
,a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID  =343
group by d.GROUP_NAME,a.report_date;



-- 进件数 通过数 拒绝数 通过率
select t.REPORT_DATE
,t.segment_name
,sum(t.CUM_INPUT_CNT)     as   '累计进件数'
,sum(t.CUM_APPROVE_CNT )/(sum(t.CUM_APPROVE_CNT )+sum(t.CUM_CREDIT_REJECT_CNT ))
from app.p_ln_sale_index_daily_da  t
where t.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and segment_name='TOTAL'
group by t.REPORT_DATE,t.segment_name;



select t.REPORT_DATE
,t.segment_name
,sum(t.CUM_INPUT_CNT)     as   '累计进件数'
,sum(t.CUM_APPROVE_CNT )/(sum(t.CUM_APPROVE_CNT )+sum(t.CUM_CREDIT_REJECT_CNT ))
from app.p_ln_sale_index_daily_da  t
where t.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and BRANCH_NAME='个贷南区'
group by t.REPORT_DATE,t.segment_name;

select t.REPORT_DATE
,sum(t.CUM_INPUT_CNT)     as   '累计进件数'
,sum(t.CUM_APPROVE_CNT )/(sum(t.CUM_APPROVE_CNT )+sum(t.CUM_CREDIT_REJECT_CNT ))
from app.p_ln_sale_index_daily_da  t
join dim.d_dim_org_inf b
on t.BRANCH_CD=b.GROUP_ID
where t.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.region_name='合肥市'
group by t.REPORT_DATE;





select b.STORE_NAME,t.REPORT_DATE
,sum(t.CUM_INPUT_CNT)     as   '累计进件数'
,sum(t.CUM_APPROVE_CNT )/(sum(t.CUM_APPROVE_CNT )+sum(t.CUM_CREDIT_REJECT_CNT ))
from app.p_ln_sale_index_daily_da  t
join dim.d_dim_org_inf b
on t.BRANCH_CD=b.GROUP_ID
where t.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.CITY_ID=146 and b.STORE_ID  =343
group by b.STORE_NAME,t.REPORT_DATE;


select t.BRANCH_NAME,t.REPORT_DATE
,sum(t.CUM_INPUT_CNT)     as   '累计进件数'
,sum(t.CUM_APPROVE_CNT )/(sum(t.CUM_APPROVE_CNT )+sum(t.CUM_CREDIT_REJECT_CNT ))
from app.p_ln_sale_index_daily_da  t
join dim.d_dim_org_inf b
on t.BRANCH_CD=b.GROUP_ID
where t.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.CITY_ID=146 and b.STORE_ID   =343
group by t.BRANCH_NAME,t.REPORT_DATE

--  C_M1 C_M2

select REPORT_DATE
,C_M1_AMT
,C_M2_AMT
FROM app.p_ln_overdue_daily_di
where REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and SEGMENT_NAME='TOTAL'
order by REPORT_DATE;


select REPORT_DATE
,BRANCH_NAME
,C_M1_AMT
,C_M2_AMT
FROM app.p_ln_overdue_daily_di
where REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and BRANCH_CD =146
order by REPORT_DATE;

select REPORT_DATE
,sum(M1_REST_PRINCIPAL)/sum(NORMAL_T1_REST_PRINCIPAL) c_m1
,sum(M2_PRINCIPAL)/sum(NORMAL_T2_REST_PRINCIPAL) c_m2
FROM app.p_ln_overdue_daily_di a
join dim.d_dim_org_inf b
on a.BRANCH_CD=b.GROUP_ID
where REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.region_name='合肥市'
group by  REPORT_DATE;

select b.STORE_NAME
,REPORT_DATE
,sum(M1_REST_PRINCIPAL)/sum(NORMAL_T1_REST_PRINCIPAL) c_m1
,sum(M2_PRINCIPAL)/sum(NORMAL_T2_REST_PRINCIPAL) c_m2
FROM app.p_ln_overdue_daily_di a
join dim.d_dim_org_inf b
on a.BRANCH_CD=b.GROUP_ID
where REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.CITY_ID=146 and b.STORE_ID  =343
group by b.STORE_NAME,REPORT_DATE


select b.GROUP_NAME
,REPORT_DATE
,sum(M1_REST_PRINCIPAL)/sum(NORMAL_T1_REST_PRINCIPAL) c_m1
,sum(M2_PRINCIPAL)/sum(NORMAL_T2_REST_PRINCIPAL) c_m2
FROM app.p_ln_overdue_daily_di a
join dim.d_dim_org_inf b
on a.BRANCH_CD=b.GROUP_ID
where REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.CITY_ID=146 and b.STORE_ID  =343
group by  b.GROUP_NAME,REPORT_DATE



-- 流入 催回
select t.REPORT_DATE
,t.BRANCH_NAME
,t.CUM_C_M1_ACCOUNT_CNT
,t.CUM_C_M1_BACK_ACCOUNT_CNT 
FROM app.p_ln_overdue_daily_di t
where REPORT_DATE  -- ='2019-07-31'
in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and t.SEGMENT_NAME='TOTAL';

select t.REPORT_DATE
,t.BRANCH_NAME
,t.CUM_C_M1_ACCOUNT_CNT
,t.CUM_C_M1_BACK_ACCOUNT_CNT 
FROM app.p_ln_overdue_daily_di t
where REPORT_DATE  -- ='2019-07-31'
in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and t.BRANCH_CD=146;

select a.REPORT_DATE
,SUM(a.C_M1_ACCOUNT_CNT)/SUM(a.C_ACCOUNT_CNT)  
,SUM(a.C_M1_BACK_ACCOUNT_CNT)/SUM(a.C_M1_ACCOUNT_CNT) 
from app.p_ln_overdue_index_day_di a
join dim.d_dim_org_inf b
on a.BRANCH_CD=b.GROUP_ID
where a.REPORT_DATE -- ='2019-07-31'
in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.region_name='合肥市'
group by a.REPORT_DATE;

select b.STORE_NAME,a.REPORT_DATE
,SUM(a.C_M1_ACCOUNT_CNT)/SUM(a.C_ACCOUNT_CNT)  
,SUM(a.C_M1_BACK_ACCOUNT_CNT)/SUM(a.C_M1_ACCOUNT_CNT) 
from app.p_ln_overdue_index_day_di a
join dim.d_dim_org_inf b
on a.BRANCH_CD=b.GROUP_ID
where a.REPORT_DATE -- ='2019-07-31'
in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.CITY_ID=146 and b.STORE_ID =343
group by b.STORE_NAME,a.REPORT_DATE;

select b.GROUP_NAME
,a.REPORT_DATE
,SUM(a.C_M1_ACCOUNT_CNT)/SUM(a.C_ACCOUNT_CNT)  
,SUM(a.C_M1_BACK_ACCOUNT_CNT)/SUM(a.C_M1_ACCOUNT_CNT) 
from app.p_ln_overdue_index_day_di a
join dim.d_dim_org_inf b
on a.BRANCH_CD=b.GROUP_ID
where a.REPORT_DATE -- ='2019-07-31'
in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and b.AREA_ID=147 and b.CITY_ID=146 and b.STORE_ID  =343
group by b.GROUP_NAME,a.REPORT_DATE;

-- 签约率
企划 -- 放款率 -- 按金额-放款率-月报
104 /opt/app/dmp/sched/jobs
mid_sign_lv_ln.py 个贷
mid_sign_lv_area.py 大区
mid_sign_lv_city.py 城市
mid_sign_lv_store.py 区域
mid_sign_lv_group.py 门店

select final_audit_time
,oeg_name
,sum(case when tn='T3' then lv else 0 END ) T3
,sum(case when tn='T7' then lv else 0 END ) as T7
,sum(case when tn='T30' then lv else 0 END ) as T30
from mid.mid_sign_lv 
 where oeg_name  like '合肥区域' and oeg_name  like '个贷南区' and oeg_name  like '合肥市' and oeg_name  like '个贷'
-- where oeg_name not like '合肥区域' and oeg_name not like '个贷南区' and oeg_name not like '合肥市' and oeg_name not like '个贷'
group by final_audit_time,oeg_name
order by oeg_name,final_audit_time;

-- 小M1
select a.REPORT_DATE
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.RESTPRINCIPAL else 0 END) /1000
from app.p_ln_overdue_detail_di a
join dwa.a_ln_account_da b
on a.ACCOUNT_ID=b.ACCOUNT_ID
join dim.d_dim_org_inf d
on b.RECOVER_STORE_ID=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.ACCOUNT_ID=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and a.OVER_DUE_DAYS>0 and a.OVER_DUE_DAYS<30 
and d.AREA_ID =147
group by a.REPORT_DATE;



select a.REPORT_DATE
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.RESTPRINCIPAL else 0 END) /1000
from app.p_ln_overdue_detail_di a
join dwa.a_ln_account_da b
on a.ACCOUNT_ID=b.ACCOUNT_ID
join dim.d_dim_org_inf d
on b.RECOVER_STORE_ID=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.ACCOUNT_ID=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and a.OVER_DUE_DAYS>0 and a.OVER_DUE_DAYS<30 
and d.AREA_ID =147 and d.CITY_ID=146
group by a.REPORT_DATE;




select a.REPORT_DATE
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.RESTPRINCIPAL else 0 END) /1000
from app.p_ln_overdue_detail_di a
join dwa.a_ln_account_da b
on a.ACCOUNT_ID=b.ACCOUNT_ID
join dim.d_dim_org_inf d
on b.RECOVER_STORE_ID=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.ACCOUNT_ID=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and a.OVER_DUE_DAYS>0 and a.OVER_DUE_DAYS<30 
and d.AREA_ID =147 and d.region_name='合肥市'
group by a.REPORT_DATE;

select d.STORE_NAME
,a.REPORT_DATE
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.RESTPRINCIPAL else 0 END) /1000
from app.p_ln_overdue_detail_di a
join dwa.a_ln_account_da b
on a.ACCOUNT_ID=b.ACCOUNT_ID
join dim.d_dim_org_inf d
on b.RECOVER_STORE_ID=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.ACCOUNT_ID=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and a.OVER_DUE_DAYS>0 and a.OVER_DUE_DAYS<30 
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID  =343
group by d.STORE_NAME,a.REPORT_DATE;


select d.GROUP_NAME
,a.REPORT_DATE
,sum(case when IFNULL(lpp.phase,0)-1 <=8 then a.RESTPRINCIPAL else 0 END) /1000
from app.p_ln_overdue_detail_di a
join dwa.a_ln_account_da b
on a.ACCOUNT_ID=b.ACCOUNT_ID
join dim.d_dim_org_inf d
on b.RECOVER_STORE_ID=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.ACCOUNT_ID=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.REPORT_DATE in ('2018-01-31','2018-02-28','2018-03-31','2018-04-30','2018-05-31','2018-06-30','2018-07-31','2018-08-31','2018-09-30','2018-10-31','2018-11-30','2018-12-31','2019-01-31','2019-02-28','2019-03-31','2019-04-30','2019-05-31','2019-06-30','2019-07-31')
and a.OVER_DUE_DAYS>0 and a.OVER_DUE_DAYS<30 
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID  =343
group by d.GROUP_NAME,a.REPORT_DATE;

-- 小C
select a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=7 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 
group by a.report_date;

select a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=7 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.CITY_ID=146
group by a.report_date;


select a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=7 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.region_name='合肥市'
group by a.report_date;


select d.STORE_NAME
,a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=7 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID  =343
group by d.STORE_NAME,a.report_date;

select d.GROUP_NAME
,a.report_date
,sum(a.rest_pricinal) /1000
,sum(case when IFNULL(lpp.phase,0)-1 <=7 then a.rest_pricinal else 0 END) /1000
from app.p_ln_normal_account_dtl_di a 
join dim.d_dim_org_inf d
on a.recover_store_id=d.GROUP_ID
left join ods.o_thread_lend_portfolio_plans_a lpp
on a.lend_request_id=lpp.lendRequest_id and lpp.repayDay>a.report_date and lpp.repayDay<= LAST_DAY(DATE_ADD(a.report_date,INTERVAL 1 day)) and lpp.phase>0
where a.report_date>='2018-01-31' and a.report_date<='2019-07-31'
and d.AREA_ID =147 and d.CITY_ID=146 and d.STORE_ID = 343
group by d.GROUP_NAME,a.report_date;


-- 门店拒贷比例
select substr(t1.final_audit_time,1,7)
,sum(case when t1.state_cd = 'BRANCH_REJECTED' then t1.SIGNED_AMOUNT else 0 END)/sum(t1.SIGNED_AMOUNT)
from dwa.a_ln_apply_da t1 
join dim.d_dim_org_inf d
on t1.STORE_ID=d.GROUP_ID
           WHERE t1.state_cd IN ('BRANCH_REJECTED','SIGNOFF_AWAIT','REVIEWING','SIGNOFF_CANCELLED','GIVE_UP','LOAN_APPROVE_AWAIT',
'LOAN_PAY_REJECT','LOAN_REJECTED','LOAN_AWAIT','REPAYING','IN_ADVANCE_REPAID','REPAID','EXTENDED')
and t1.final_audit_time>='2018-01-01' and t1.final_audit_time <'2019-08-01'
and d.AREA_ID =147 
       group by substr(t1.final_audit_time,1,7);

select substr(t1.final_audit_time,1,7)
,sum(case when t1.state_cd = 'BRANCH_REJECTED' then t1.SIGNED_AMOUNT else 0 END)/sum(t1.SIGNED_AMOUNT)
from dwa.a_ln_apply_da t1 
join dim.d_dim_org_inf d
on t1.STORE_ID=d.GROUP_ID
           WHERE t1.state_cd IN ('BRANCH_REJECTED','SIGNOFF_AWAIT','REVIEWING','SIGNOFF_CANCELLED','GIVE_UP','LOAN_APPROVE_AWAIT',
'LOAN_PAY_REJECT','LOAN_REJECTED','LOAN_AWAIT','REPAYING','IN_ADVANCE_REPAID','REPAID','EXTENDED')
and t1.final_audit_time>='2018-01-01' and t1.final_audit_time <'2019-08-01'
and d.AREA_ID =147 and d.CITY_ID = 146
       group by substr(t1.final_audit_time,1,7);

select substr(t1.final_audit_time,1,7)
,sum(case when t1.state_cd = 'BRANCH_REJECTED' then t1.SIGNED_AMOUNT else 0 END)/sum(t1.SIGNED_AMOUNT)
from dwa.a_ln_apply_da t1 
join dim.d_dim_org_inf d
on t1.STORE_ID=d.GROUP_ID
           WHERE t1.state_cd IN ('BRANCH_REJECTED','SIGNOFF_AWAIT','REVIEWING','SIGNOFF_CANCELLED','GIVE_UP','LOAN_APPROVE_AWAIT',
'LOAN_PAY_REJECT','LOAN_REJECTED','LOAN_AWAIT','REPAYING','IN_ADVANCE_REPAID','REPAID','EXTENDED')
and t1.final_audit_time>='2018-01-01' and t1.final_audit_time <'2019-08-01'
and d.AREA_ID =147 and d.CITY_ID = 146 and d.region_name='合肥市'
       group by substr(t1.final_audit_time,1,7);

select substr(t1.final_audit_time,1,7)
,sum(case when t1.state_cd = 'BRANCH_REJECTED' then t1.SIGNED_AMOUNT else 0 END)/sum(t1.SIGNED_AMOUNT)
from dwa.a_ln_apply_da t1 
join dim.d_dim_org_inf d
on t1.STORE_ID=d.GROUP_ID
           WHERE t1.state_cd IN ('BRANCH_REJECTED','SIGNOFF_AWAIT','REVIEWING','SIGNOFF_CANCELLED','GIVE_UP','LOAN_APPROVE_AWAIT',
'LOAN_PAY_REJECT','LOAN_REJECTED','LOAN_AWAIT','REPAYING','IN_ADVANCE_REPAID','REPAID','EXTENDED')
and t1.final_audit_time>='2018-01-01' and t1.final_audit_time <'2019-08-01'
and d.AREA_ID =147 and d.CITY_ID = 146 and d.STORE_ID = 343
       group by substr(t1.final_audit_time,1,7);

select d.GROUP_NAME
,substr(t1.final_audit_time,1,7)
,sum(case when t1.state_cd = 'BRANCH_REJECTED' then t1.SIGNED_AMOUNT else 0 END)/sum(t1.SIGNED_AMOUNT)
from dwa.a_ln_apply_da t1 
join dim.d_dim_org_inf d
on t1.STORE_ID=d.GROUP_ID
           WHERE t1.state_cd IN ('BRANCH_REJECTED','SIGNOFF_AWAIT','REVIEWING','SIGNOFF_CANCELLED','GIVE_UP','LOAN_APPROVE_AWAIT',
'LOAN_PAY_REJECT','LOAN_REJECTED','LOAN_AWAIT','REPAYING','IN_ADVANCE_REPAID','REPAID','EXTENDED')
and t1.final_audit_time>='2018-01-01' and t1.final_audit_time <'2019-08-01'
and d.AREA_ID =147 and d.CITY_ID = 146 and d.STORE_ID = 343
       group by d.GROUP_NAME,substr(t1.final_audit_time,1,7);



-- 月均人力
truncate table mid.mid_ln_hr_info;
insert into mid.mid_ln_hr_info
select distinct report_date
,group_id
,group_name
,model
,in_list
,area
,district
,signed
from app.p_ln_personnel_mgmtsystem_report_di a ;

/*select substr(report_date,1,7)
,GROUP_NAME
,avg(in_list) in_list
from (select a.report_date
,b.AREA_NAME as GROUP_NAME
,sum(a.in_list) in_list
from mid.mid_ln_hr_info a
join dim.d_dim_org_inf b
on a.group_id = b.group_id
where a.report_date >='2019-08-01' and a.report_date <='2019-08-28'
and b.AREA_ID=147 and a.signed = '门店' 
group by report_date,b.AREA_NAME ) a
group by  GROUP_NAME,substr(report_date,1,7);*/


select substr(report_date,1,7)
,GROUP_NAME
,avg(in_list) in_list
from (select a.report_date
,b.AREA_NAME as GROUP_NAME
,sum(a.in_list) in_list
from mid.mid_ln_hr_info a
join dim.d_dim_org_inf b
on a.group_id = b.group_id
where a.report_date >='2018-01-01' and a.report_date <'2019-08-01'
and b.AREA_ID=147 and a.signed = '门店' 
group by report_date,b.AREA_NAME ) a
group by  GROUP_NAME,substr(report_date,1,7);

select substr(report_date,1,7)
,GROUP_NAME
,avg(in_list) in_list
from (select a.report_date
,b.CITY_NAME as GROUP_NAME
,sum(a.in_list) in_list
from mid.mid_ln_hr_info a
join dim.d_dim_org_inf b
on a.group_id = b.group_id
where a.report_date >='2018-01-01' and a.report_date <'2019-08-01'
and b.CITY_ID=146 and a.signed = '门店' 
group by report_date,b.CITY_NAME ) a
group by  GROUP_NAME,substr(report_date,1,7);


select substr(report_date,1,7)
,GROUP_NAME
,avg(in_list) in_list
from (select a.report_date
,b.region_name as GROUP_NAME
,sum(a.in_list) in_list
from mid.mid_ln_hr_info a
join dim.d_dim_org_inf b
on a.group_id = b.group_id
where a.report_date >='2018-01-01' and a.report_date <'2019-08-01'
and b.store_id=343 and a.signed = '门店' and b.region_name = '合肥市'
group by report_date,b.region_name ) a
group by  GROUP_NAME,substr(report_date,1,7);

select substr(report_date,1,7)
,GROUP_NAME
,avg(in_list) in_list
from (select a.report_date
,b.STORE_NAME as GROUP_NAME
,sum(a.in_list) in_list
from mid.mid_ln_hr_info a
join dim.d_dim_org_inf b
on a.group_id = b.group_id
where a.report_date >='2018-01-01' and a.report_date <'2019-08-01'
and b.store_id=343 and a.signed = '门店' 
group by report_date,b.STORE_NAME ) a
group by  GROUP_NAME,substr(report_date,1,7);

select substr(report_date,1,7)
,GROUP_NAME
,avg(in_list) in_list
from (select a.report_date
,b.GROUP_NAME
,sum(a.in_list) in_list
from mid.mid_ln_hr_info a
join dim.d_dim_org_inf b
on a.group_id = b.group_id
where a.report_date >='2018-01-01' and a.report_date <'2019-08-01'
and b.store_id=343 and a.signed = '门店'
group by report_date,b.GROUP_NAME ) a
group by  GROUP_NAME,substr(report_date,1,7);

