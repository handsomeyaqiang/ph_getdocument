
��ȡָ����������C��ϸ�˻���
select a.ACCOUNT_ID -- ������
,a.REPAY_DAY -- ������
,case when date(a.OVERDUE_DATE)='1900-01-01' then 0 else DATEDIFF('2019-09-15',date(a.OVERDUE_DATE)) end as overdue_days -- ��������
,a.END_DAY -- �����ʱ��
,a.ACCOUNT_STATE_CD -- ����״̬
,a.rest_principal + a.over_due_principal as rest_principal -- ʣ�౾��
,d.GROUP_NAME -- ��ǰ�������
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

��ȡָ����������M1��M2�˻���
select a.ACCOUNT_ID -- ������
,a.REPAY_DAY -- ������
,case when date(a.OVERDUE_DATE)='1900-01-01' then 0 else DATEDIFF('2019-09-15',date(a.OVERDUE_DATE)) end as overdue_days -- ��������
,a.END_DAY -- �����ʱ��
,a.ACCOUNT_STATE_CD -- ����״̬
,a.rest_principal + a.over_due_principal as rest_principal -- ʣ�౾��
,d.GROUP_NAME -- ��ǰ�������
from dwa.a_ln_account_da a
left join dim.d_dim_org_inf d
on a.RECOVER_STORE_ID = d.GROUP_ID
where
timestampdiff(day,a.overdue_date,'2019-09-15') between 1 and 59  -- �ж�����M1 
                 and a.overdue_date<>'2019-09-15' 
                 and a.system_flg='UCREDIT' 
                 and a.thirdParty <> 1
and a.RECOVER_STORE_ID in (4242,4243,4244,4245,4246,4247,4248)


-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
(�ѿ��ŵ�)��ȡ��ĩ��C�˻���ϸ��Ϣ
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
��ȡ��ĩ��C�˻���ϸ��Ϣ
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
��ȡ�������������������5��ĩ��C�˻���ϸ
SELECT a.lend_request_id,a.recover_area_name,a.recover_city_name,a.recover_store_name,b.phases,a.rest_pricinal,a.channel_name,a.product_type_name,a.repay_date,a.employeeNumber,a.employeeName
FROM app.p_ln_normal_account_dtl_di a
left join dwa.a_ln_account_da b
on b.ACCOUNT_ID = a.lend_request_id
WHERE report_date='2019-05-31'
and recover_city_name = '��������'

-------------------------------------------------------------------------------
�ͻ������Ļ���״̬
SELECT lendrequest_id,repayday,state
FROM ods.o_thread_lend_portfolio_plans_a p 

where p.phase >0 
and  repayday = '2019-07-01'

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
��ȡ��������
select planId,lendRequest_id
,case when type = 'NOT_LATE_REPAYMENT' then 'ծȨ����'
      when type = 'M1_DEDUCTION' then 'M1����'
      when type = 'M1_DEDUCTION_AREA' then 'M1����'
      when type = 'LOAN_COMMON_DEDUCTION' then '������Ϣ����'
      when type = 'PSEUDO_OVERDUE_CORRECT' then 'α���ھ���'
      when type = 'FINANCE_DEDUCTION' then '����������'
      when type = 'BATCH_DEDUCTION' then '��������'
      when type = 'AUTO_DEDUCTION_IN_7DAYS' then '�����Զ�����'
      when type = 'LOAN_STOP_DEDUCTION' then '��ֹ�ſ����'
      when type in ('EARLY_REPAYMENT_PAY','EARLY_REPAYMENT') then '��ǰ�������'
else type
end as type 
,'����' as channel_detail
,'����' as channel
from Finance_Deduction_Requests 
where state = 'APPROVED'
and date(createTime) >= '2019-08-01'
and date(createTime) <= '2019-08-31'
and type not in ('EARLY_REPAYMENT_PAY','EARLY_REPAYMENT');
-------------------------------------------------------------------------------
��ȡM1�����û�
select planId as plan_id,date(createTime) as operateTime
from Finance_Deduction_Requests 
where state = 'APPROVED'
and date(createTime) >= '2019-07-01'
and date(createTime) <= '2019-09-30'
and type in ('M1_DEDUCTION','M1_DEDUCTION_AREA')
ORDER BY operateTime;
-------------------------------------------------------------------------------
p_ln_normal_account_dtl_m1_20190731 �ǻ�ȡ��M1�����û������ݻ���ƻ�plan_id������
���������ݽ����õ��ý����������Ϣ
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
��ȡ��ĩC�˻���ϸ���������������Ƿ���M1����
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
,case when t.ism1_7 = 0 then '��' else '��' end as ism1_7
,t.overduedays_6
,t.last_update_time_6
,case when t.ism1_6 = 0 then '��' else '��' end as ism1_6
,t.overduedays_5
,t.last_update_time_5
,case when t.ism1_5 = 0 then '��' else '��' end as ism1_5
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
select a.lend_request_id -- ������
,a.recover_area_name -- �������
,a.recover_city_name -- �������
,a.recover_store_name -- �����ŵ�
,a.loan_date -- �ſ�����
,lr.PUT_AMOUNT -- �ſ��
,lr.ledgers_feeRate -- ����
,case when lrc.type in ('NEW_PHONE_SALE_UCREDIT') then 'ֱ��ת����'
      when lrc.type in ('PHONE_SALE','PHONE_SALE_APP','UXINDAI_PHONE_SALE','NEW_PHONE_SALE','NEW_UXINDAI_PHONE_SALE') then '����'
 else 'ֱ��' end channelName -- ��������
,a.product_type_name -- ��Ʒ����
,null -- ��Ʒϸ��
,case when lrc.fundSource = 'RENRENDAI' then '���˴�' 
     when lrc.fundSource in ('SHIZUISHAN_BANK_COMPENS','SHIZUISHAN_BANK') then 'ʯ��ɽ����'
    when lrc.fundSource in ('SF_GUARANTEE_SHIZUISHAN','SF_GUARANTEE_SHIZUISHAN_COMPENS') then '����-ʯ��ɽ����'
    when lrc.fundSource in ('GUARANTEE_XWBANK','GUARANTEE_XWBANK_COMPENS') then '��������'
    when lrc.fundSource in ('HUARUN_BANK','HUARUN_BANK_COMPENS') then '��������'
    when lrc.fundSource in ('QINGDAO_BANK','QINGDAO_BANK_COMPENS') then '�ൺ����'
    when lrc.fundSource in ('INSURANCE_GDBANK','INSURANCE_GDBANK_COMPENS') then '�˱�-�������'
		else lrc.fundSource   
    end fundSource -- �ʽ�����
,CASE WHEN lr.customer_nature='NEW' THEN  '�¿ͻ�'
      WHEN lr.customer_nature='CYCLE' THEN  'ѭ�����ͻ�'
      WHEN lr.customer_nature='DISSATISFY_SUPPLEMENT' THEN  '׷�Ӵ��ͻ�'
      WHEN lr.customer_nature='SUPPLEMENT' THEN  '׷�Ӵ��ͻ�'
      WHEN lr.customer_nature='SUPPLEMENT_A' THEN  '׷�Ӵ�A�ͻ�'
      WHEN lr.customer_nature='SUPPLEMENT_B' THEN  '׷�Ӵ�B�ͻ�'
      WHEN lr.customer_nature='SETTLE_LOAN' THEN  '���»��ɿͻ�'
      ELSE 'δ֪�ͻ�' END customer_nature -- �ͻ�����
,ifnull(lpp.phase,0) as CURR_PHASE -- ��ǰ����
,lr.PHASES -- ������
,a.rest_pricinal -- ʣ�౾��
,null -- ��������
,a.repay_amt -- ÿ��Ӧ�����
,a.repay_date -- ÿ�»�����
from app.p_ln_normal_account_dtl_di a
INNER JOIN dim.d_dim_org_inf org on org.GROUP_ID = a.recover_store_id
inner join dwa.a_ln_account_da lr on a.lend_request_id = lr.ACCOUNT_ID
inner join ods.o_thread_lend_request_channels_a lrc on lrc.id = lr.CHANNEL_ID
LEFT JOIN  ods.o_thread_lend_portfolio_plans_a lpp on lpp.lendRequest_id = lr.ACCOUNT_ID and lpp.repayDay between '2019-01-01' and '2019-01-31'
and lpp.phase > 0
where a.report_date = '2019-01-31' and a.recover_area_name not in ('��ʢ����','������ҵ��','�����ջ�','������ѵ��');

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


