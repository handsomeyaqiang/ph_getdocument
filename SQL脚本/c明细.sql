
获取指定管理中心C明细账户：
select a.ACCOUNT_ID -- 进件号
,a.REPAY_DAY -- 还款日
,case when date(a.OVERDUE_DATE)='1900-01-01' then 0 else DATEDIFF('2019-09-15',date(a.OVERDUE_DATE)) end as overdue_days -- 逾期天数
,a.END_DAY -- 还款到期时间
,a.ACCOUNT_STATE_CD -- 进件状态
,a.rest_principal + a.over_due_principal as rest_principal -- 剩余本金
,d.GROUP_NAME -- 当前管理机构
from dwa.a_ln_account_da a
left join dim.d_dim_org_inf d
on a.RECOVER_STORE_ID = d.GROUP_ID
where 
timestampdiff(day,if(a.overdue_date='1900-01-01','2019-09-15',a.overdue_date),'2019-09-15')=0  
                 and a.end_day>='2019-09-15' 
                 and a.rest_principal + a.over_due_principal>0
                 and if(a.inadvance_repay_date='1900-01-01','9999-12-31',a.inadvance_repay_date)>'2019-09-15' 
                 and a.system_flg='UCREDIT'
                 and a.thirdParty <> 1
and a.RECOVER_STORE_ID in (4242,4243,4244,4245,4246,4247,4248)

获取指定管理中心M1和M2账户：
select a.ACCOUNT_ID -- 进件号
,a.REPAY_DAY -- 还款日
,case when date(a.OVERDUE_DATE)='1900-01-01' then 0 else DATEDIFF('2019-09-15',date(a.OVERDUE_DATE)) end as overdue_days -- 逾期天数
,a.END_DAY -- 还款到期时间
,a.ACCOUNT_STATE_CD -- 进件状态
,a.rest_principal + a.over_due_principal as rest_principal -- 剩余本金
,d.GROUP_NAME -- 当前管理机构
from dwa.a_ln_account_da a
left join dim.d_dim_org_inf d
on a.RECOVER_STORE_ID = d.GROUP_ID
where
timestampdiff(day,a.overdue_date,'2019-09-15') between 1 and 59  -- 判断逾期M1 
                 and a.overdue_date<>'2019-09-15' 
                 and a.system_flg='UCREDIT' 
                 and a.thirdParty <> 1
and a.RECOVER_STORE_ID in (4242,4243,4244,4245,4246,4247,4248)


-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
(已开门店)获取月末的C账户明细信息
SELECT a.lend_request_id as lend_request_id
,a.recover_area_name as recover_area_name
,a.recover_city_name as recover_city_name
,a.recover_store_name as recover_sotre_name
,a.repay_date as repay_date
,a.rest_pricinal as rest_pricinal
,channel.fundSource as fundsource
FROM  app.p_ln_normal_account_dtl_di a
left join dwa.a_ln_account_da b
on b.ACCOUNT_ID = a.lend_request_id
left JOIN dim.d_dim_org_inf org
on org.GROUP_ID = b.RECOVER_GROUP_ID
left join ods.o_thread_lend_request_channels_a channel 
on b.channel_id=channel.id
WHERE report_date='2019-07-31' and org.ENABLED = 1
ORDER BY recover_area_name,recover_area_name,recover_city_name,recover_sotre_name
-------------------------------------------------------------------------------
获取月末的C账户明细信息
SELECT a.lend_request_id as lend_request_id
,a.recover_area_name as recover_area_name
,a.recover_city_name as recover_city_name
,a.recover_store_name as recover_sotre_name
,a.repay_date as repay_date
,a.rest_pricinal as rest_pricinal
,channel.fundSource as fundsource
FROM  app.p_ln_normal_account_dtl_di a
left join dwa.a_ln_account_da b
on b.ACCOUNT_ID = a.lend_request_id
left JOIN dim.d_dim_org_inf org
on org.GROUP_ID = b.RECOVER_GROUP_ID
left join ods.o_thread_lend_request_channels_a channel 
on b.channel_id=channel.id
WHERE report_date='2019-07-31'
ORDER BY recover_area_name,recover_area_name,recover_city_name,recover_sotre_name

-------------------------------------------------------------------------------
获取管理区域是苏州区域的5月末的C账户明细
SELECT a.lend_request_id,a.recover_area_name,a.recover_city_name,a.recover_store_name,b.phases,a.rest_pricinal,a.channel_name,a.product_type_name,a.repay_date,a.employeeNumber,a.employeeName
FROM app.p_ln_normal_account_dtl_di a
left join dwa.a_ln_account_da b
on b.ACCOUNT_ID = a.lend_request_id
WHERE report_date='2019-05-31'
and recover_city_name = '苏州区域'

-------------------------------------------------------------------------------
客户进件的还款状态
SELECT lendrequest_id,repayday,state
FROM ods.o_thread_lend_portfolio_plans_a p 

where p.phase >0 
and  repayday = '2019-07-01'

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
获取进件类型
select planId,lendRequest_id
,case when type = 'NOT_LATE_REPAYMENT' then '债权清理'
      when type = 'M1_DEDUCTION' then 'M1减免'
      when type = 'M1_DEDUCTION_AREA' then 'M1减免'
      when type = 'LOAN_COMMON_DEDUCTION' then '个贷本息减免'
      when type = 'PSEUDO_OVERDUE_CORRECT' then '伪逾期纠正'
      when type = 'FINANCE_DEDUCTION' then '非审批减免'
      when type = 'BATCH_DEDUCTION' then '批量减免'
      when type = 'AUTO_DEDUCTION_IN_7DAYS' then '七日自动减免'
      when type = 'LOAN_STOP_DEDUCTION' then '终止放款减免'
      when type in ('EARLY_REPAYMENT_PAY','EARLY_REPAYMENT') then '提前结清减免'
else type
end as type 
,'个贷' as channel_detail
,'个贷' as channel
from Finance_Deduction_Requests 
where state = 'APPROVED'
and date(createTime) >= '2019-08-01'
and date(createTime) <= '2019-08-31'
and type not in ('EARLY_REPAYMENT_PAY','EARLY_REPAYMENT');
-------------------------------------------------------------------------------
获取M1减免用户
select planId as plan_id,date(createTime) as operateTime
from Finance_Deduction_Requests 
where state = 'APPROVED'
and date(createTime) >= '2019-07-01'
and date(createTime) <= '2019-09-30'
and type in ('M1_DEDUCTION','M1_DEDUCTION_AREA')
ORDER BY operateTime;
-------------------------------------------------------------------------------
p_ln_normal_account_dtl_m1_20190731 是获取的M1减免用户，根据还款计划plan_id关联到
进件，根据进件得到该进件的相关信息
select  p7.lendRequest_id, m7.operateTime,b.recover_store_name
from mid.p_ln_normal_account_dtl_m1_20190731 m7
left join  ods.o_thread_lend_portfolio_plans_a p7 
on p7.id  = m7.plan_id
and p7.repayDay between '2019-05-01' and '2019-07-31'
left join ods.o_thread_lend_portfolio_repay_records_a r7 on r7.plan_id = p7.id 
left join app.p_ln_normal_account_dtl_di  b
on b.lend_request_id = p7.lendRequest_id

where b.report_date='2019-07-31'
-------------------------------------------------------------------------------
获取月末C账户明细，包括三个月内是否是M1减免
select t.lend_request_id
,t.recover_area_name
,t.recover_city_name
,t.recover_store_name
,t.phases
,t.repayed_phase
,t.monthly_repay
,t.rest_pricinal
,t.repay_date
,t.fundsource
,t.overduedays_7
,t.last_update_time_7
,case when t.ism1_7 = 0 then '否' else '是' end as ism1_7
,t.overduedays_6
,t.last_update_time_6
,case when t.ism1_6 = 0 then '否' else '是' end as ism1_6
,t.overduedays_5
,t.last_update_time_5
,case when t.ism1_5 = 0 then '否' else '是' end as ism1_5
 from (SELECT
 a.lend_request_id,a.recover_area_name,a.recover_city_name,a.recover_store_name,b.phases,b.repayed_phase,b.monthly_repay,a.rest_pricinal,a.repay_date,channel.fundsource 


,sum(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-09' then r7.overduedays else 0 end) as overduedays_7
,max(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-09' then substring(r7.last_update_time,12) else '00:00:00' end )  last_update_time_7
,sum(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-09' and DATE_FORMAT(m7.operateTime,'%Y-%m') = '2019-09'and   m7.plan_id is not null then 1 else 0 end ) as ism1_7 

,sum(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-08' then r7.overduedays else 0 end) as overduedays_6
,max(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-08' then substring(r7.last_update_time,12) else '00:00:00' end )  last_update_time_6
,sum(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-08'  and DATE_FORMAT(m7.operateTime,'%Y-%m') = '2019-08' and m7.plan_id is not null then 1 else 0 end ) as ism1_6

,sum(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-07' then r7.overduedays else 0 end) as overduedays_5
,max(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-07' then substring(r7.last_update_time,12) else '00:00:00' end )  last_update_time_5
,sum(case when DATE_FORMAT(p7.repayDay,'%Y-%m') = '2019-07'  and DATE_FORMAT(m7.operateTime,'%Y-%m') = '2019-07' and m7.plan_id is not null then 1 else 0 end )  as ism1_5

FROM app.p_ln_normal_account_dtl_di a
left join dwa.a_ln_account_da b
on b.ACCOUNT_ID = a.lend_request_id
left join  ods.o_thread_lend_request_channels_a channel 
on b.channel_id=channel.id  


left join  ods.o_thread_lend_portfolio_plans_a p7 
on p7.lendRequest_id = a.lend_request_id and p7.repayDay between '2019-07-01' and '2019-09-30'
left join ods.o_thread_lend_portfolio_repay_records_a r7 on r7.plan_id = p7.id 
left join mid.p_ln_normal_account_dtl_m1_20190731 m7 on m7.plan_id = p7.id
WHERE a.report_date='2019-09-30'
 --  and a.lend_request_id = 1381049
group by 
 a.lend_request_id,a.recover_area_name,a.recover_city_name,a.recover_store_name,b.phases,b.repayed_phase,b.monthly_repay,a.rest_pricinal,a.repay_date,channel.fundsource 
) t
 
-------------------------------------------------------------------------------
SELECT a.lend_request_id as lend_request_id
,a.recover_area_name as recover_area_name
,a.recover_city_name as recover_city_name
,a.recover_store_name as recover_sotre_name
,a.curr_phase 
,b.PHASES
-- ,b.REPAYED_PHASE
,b.MONTHLY_REPAY
,a.rest_pricinal as rest_pricinal
,a.repay_date as repay_date
,channel.fundSource as fundsource
FROM  app.p_ln_normal_account_dtl_di a
left join dwa.a_ln_account_da b
on b.ACCOUNT_ID = a.lend_request_id
left JOIN dim.d_dim_org_inf org
on org.GROUP_ID = b.RECOVER_GROUP_ID
left join ods.o_thread_lend_request_channels_a channel 
on b.channel_id=channel.id
WHERE report_date='2019-12-31'
ORDER BY recover_area_name,recover_area_name,recover_city_name,recover_sotre_name

---------------------------------------------------------------
select a.lend_request_id -- 进件号
,a.recover_area_name -- 管理大区
,a.recover_city_name -- 管理城市
,a.recover_store_name -- 管理门店
,a.loan_date -- 放款日期
,lr.PUT_AMOUNT -- 放款额
,lr.ledgers_feeRate -- 费率
,case when lrc.type in ('NEW_PHONE_SALE_UCREDIT') then '直销转电销'
      when lrc.type in ('PHONE_SALE','PHONE_SALE_APP','UXINDAI_PHONE_SALE','NEW_PHONE_SALE','NEW_UXINDAI_PHONE_SALE') then '电销'
 else '直销' end channelName -- 进件渠道
,a.product_type_name -- 产品大类
,null -- 产品细类
,case when lrc.fundSource = 'RENRENDAI' then '人人贷' 
     when lrc.fundSource in ('SHIZUISHAN_BANK_COMPENS','SHIZUISHAN_BANK') then '石嘴山银行'
    when lrc.fundSource in ('SF_GUARANTEE_SHIZUISHAN','SF_GUARANTEE_SHIZUISHAN_COMPENS') then '担保-石嘴山银行'
    when lrc.fundSource in ('GUARANTEE_XWBANK','GUARANTEE_XWBANK_COMPENS') then '新网银行'
    when lrc.fundSource in ('HUARUN_BANK','HUARUN_BANK_COMPENS') then '华润银行'
    when lrc.fundSource in ('QINGDAO_BANK','QINGDAO_BANK_COMPENS') then '青岛银行'
    when lrc.fundSource in ('INSURANCE_GDBANK','INSURANCE_GDBANK_COMPENS') then '人保-光大银行'
		else lrc.fundSource   
    end fundSource -- 资金渠道
,CASE WHEN lr.customer_nature='NEW' THEN  '新客户'
      WHEN lr.customer_nature='CYCLE' THEN  '循环贷客户'
      WHEN lr.customer_nature='DISSATISFY_SUPPLEMENT' THEN  '追加贷客户'
      WHEN lr.customer_nature='SUPPLEMENT' THEN  '追加贷客户'
      WHEN lr.customer_nature='SUPPLEMENT_A' THEN  '追加贷A客户'
      WHEN lr.customer_nature='SUPPLEMENT_B' THEN  '追加贷B客户'
      WHEN lr.customer_nature='SETTLE_LOAN' THEN  '借新还旧客户'
      ELSE '未知客户' END customer_nature -- 客户类型
,ifnull(lpp.phase,0) as CURR_PHASE -- 当前期数
,lr.PHASES -- 总期数
,a.rest_pricinal -- 剩余本金
,null -- 逾期天数
,a.repay_amt -- 每月应还款额
,a.repay_date -- 每月还款日
from app.p_ln_normal_account_dtl_di a
INNER JOIN dim.d_dim_org_inf org on org.GROUP_ID = a.recover_store_id
inner join dwa.a_ln_account_da lr on a.lend_request_id = lr.ACCOUNT_ID
inner join ods.o_thread_lend_request_channels_a lrc on lrc.id = lr.CHANNEL_ID
LEFT JOIN  ods.o_thread_lend_portfolio_plans_a lpp on lpp.lendRequest_id = lr.ACCOUNT_ID and lpp.repayDay between '2019-01-01' and '2019-01-31'
and lpp.phase > 0
where a.report_date = '2019-01-31' and a.recover_area_name not in ('安盛渠道','房贷事业部','友信普惠','创新培训贷');

SELECT a.lend_request_id as lend_request_id
,a.recover_area_name as recover_area_name
,a.recover_city_name as recover_city_name
,a.recover_store_name as recover_sotre_name
,a.curr_phase
,b.PHASES
-- ,b.REPAYED_PHASE
,b.MONTHLY_REPAY
,a.rest_pricinal as rest_pricinal
,substr(date(lpp.repayday),9,10) as repayDay
-- ,channel.fundSource as fundsource
FROM  app.p_ln_normal_account_dtl_di a
left join dwa.a_ln_account_da b
on b.ACCOUNT_ID = a.lend_request_id
left JOIN dim.d_dim_org_inf org
on org.GROUP_ID = b.RECOVER_GROUP_ID
left join ods.o_thread_lend_request_channels_a channel 
on b.channel_id=channel.id
LEFT JOIN ods.o_thread_lend_portfolio_plans_a lpp on lpp.phase = 1 and lpp.lendRequest_id = a.lend_request_id
WHERE report_date='2019-12-31'
ORDER BY recover_area_name,recover_area_name,recover_city_name,recover_sotre_name


