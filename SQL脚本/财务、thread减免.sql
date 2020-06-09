/*减免类型、发起方,财务减免表*/
select 
plan_id,lend_id
,case when type = 'NOT_LATE_REPAYMENT' then '债权清理'
      when type = 'M1_DEDUCTION' then 'M1减免'
      when type = 'LOAN_COMMON_DEDUCTION' then '个贷本息减免'
      when type = 'PSEUDO_OVERDUE_CORRECT' then '伪逾期纠正'
      when type = 'FINANCE_DEDUCTION' then '非审批减免'
      when type = 'BATCH_DEDUCTION' then '批量减免'
      when type = 'AUTO_DEDUCTION_IN_7DAYS' then '七日自动减免'
      when type = 'LOAN_STOP_DEDUCTION' then '终止放款减免'
end as type 
,case when channel = 'ATL_EXT' then '贷后处置'
when channel = 'ATL_OS' then '贷后委外'
when channel = 'ATL_OV' then '贷后外访'
when channel = 'ATL_PU' then '贷后电催'
when channel = 'LOAN' then '个贷'
when channel = 'LOAN_DEBTCL' then '个贷债权清理'
when channel = 'LOAN_OTH' then '个贷其他'
when channel = 'SYSTEM' then '系统'
else '其他' end as channel_detail
,case when channel = 'SYSTEM' then '系统'
      when channel like 'LOAN%' then '个贷'
      when channel like 'ATL%' then '贷后'
else '其他' end as channel
from derate_record
where date(create_time) >= '2020-02-01'
and date(create_time) <= '2020-02-29'
and state = 'SUCCESS';

/*减免类型、发起方，个贷减免表*/
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
and date(createTime) >= '2020-02-01'
and date(createTime) <= '2020-02-29'
and type not in ('EARLY_REPAYMENT_PAY','EARLY_REPAYMENT');