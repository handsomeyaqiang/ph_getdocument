select '2020-09-26' as REPORT_DATE
,lad.LEND_REQUEST_ID
,lad.STATE_CD
,lad.CREDIT_STATE_CD
,case when date(lad.ACCEPT_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.ACCEPT_TIME end as ACCEPT_TIME
,case when date(lad.CREATE_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.CREATE_TIME end as CREATE_TIME
,case when date(lad.SUBMIT_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.SUBMIT_TIME end as SUBMIT_TIME
,ld.CUSTOMER_ID
,lad.GROUP_ID
,lad.STORE_ID
,lad.CITY_ID
,lad.AREA_ID
,lad.SELLER_ID
,lad.SERVICER_ID
,lad.POST_SERVICER_ID
,lad.APPLIED_PRODUCT_ID
,lad.APPLIED_PRODUCT_TYPE_CD
,lad.APPLIED_PRODUCT_NATURE_CD
,lad.LOAN_PRODUCT_ID
,lad.PRODUCT_TYPE_CD
,lad.PRODUCT_NATURE_CD
,lad.LEND_CHANNEL_CD
,lad.LEND_CHANNEL_TYPE_CD
,lad.LEND_PURPOSE
,lad.CUSTOMER_NATURE
,lad.ORIGIN
,lad.fundSource
,lad.is_union
,lad.is_main_union
,lad.is_calculate
,lad.union_lrid
,lad.main_union_lrid
,case when date(lad.INITIAL_AUDIT_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.INITIAL_AUDIT_TIME end as INITIAL_AUDIT_TIME
,case when date(lad.BEGIN_AUDIT_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.BEGIN_AUDIT_TIME end as BEGIN_AUDIT_TIME
,case when date(lad.FINAL_AUDIT_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.FINAL_AUDIT_TIME end as FINAL_AUDIT_TIME
,lad.AUDIT_RATE
,case when date(lad.REVIEW_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.REVIEW_TIME end as REVIEW_TIME
,lad.REVIEWED
,lad.EXPEDITION_FEE
,lad.EXPEDITIONSTATE
,case when date(lad.APPROVAL_BEGIN_DATE) = '1900-01-01' then '1990-01-01 00:00:00' else lad.APPROVAL_BEGIN_DATE end as APPROVAL_BEGIN_DATE
,case when date(lad.APPROVAL_END_DATE) = '1900-01-01' then '1990-01-01 00:00:00' else lad.APPROVAL_END_DATE end as APPROVAL_END_DATE
,lad.APPROVAL_AMOUNT
,lad.total_approve_amount
,lad.split_approve_amount
,case when date(lad.REJECT_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.REJECT_TIME end as REJECT_TIME
,case when date(lad.GIVE_UP_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.GIVE_UP_TIME end as GIVE_UP_TIME
,lad.MAIN_REASON_CD
,case when date(lad.CREDIT_REJECTED_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.CREDIT_REJECTED_TIME end as CREDIT_REJECTED_TIME
,lad.CREDIT_REJECTED_CD
,case when date(lad.BRANCH_REJECTED_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.BRANCH_REJECTED_TIME end as BRANCH_REJECTED_TIME
,lad.BRANCH_REJECTED_USER_ID
,case when date(lad.submitLoanTime) = '1900-01-01' then '1990-01-01 00:00:00' else lad.submitLoanTime end as submitLoanTime
,case when date(lad.finalAuditOverTime) = '1900-01-01' then '1990-01-01 00:00:00' else lad.finalAuditOverTime end as finalAuditOverTime
,case when date(lad.SIGNED_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else lad.SIGNED_TIME end as SIGNED_TIME
,lad.SIGNED_AMOUNT
,lad.AMOUNT
,lad.SIGNED_BRANCH
,lad.adapt_amount
,ld.PHASES
,case when date(ld.LOAN_DATE) = '1900-01-01' then '1990-01-01 00:00:00' else ld.LOAN_DATE end as LOAN_DATE
,case when date(ld.ACTUAL_LOAN_DATE) = '1900-01-01' then '1990-01-01 00:00:00' else ld.ACTUAL_LOAN_DATE end as ACTUAL_LOAN_DATE
,case when date(ld.DRAW_CASH_TIME) = '1900-01-01' then '1990-01-01 00:00:00' else ld.DRAW_CASH_TIME end as DRAW_CASH_TIME
,ld.DRAW_CASH_STATE
,case when date(ld.ACTUAL_PAYMENT_DATE) = '1900-01-01' then '1990-01-01 00:00:00' else ld.ACTUAL_PAYMENT_DATE end as ACTUAL_PAYMENT_DATE
,case when date(ld.FINAL_CHECK_DATE) = '1900-01-01' then '1990-01-01 00:00:00' else ld.FINAL_CHECK_DATE end as FINAL_CHECK_DATE
,case when date(ld.END_DAY) = '1900-01-01' then '1990-01-01' else ld.END_DAY end as END_DAY
,ld.REPAY_DAY
,case when date(ld.FIRST_REPAY_DATE) = '1900-01-01' then '1990-01-01' else ld.FIRST_REPAY_DATE end as FIRST_REPAY_DATE
,case when date(ld.OVERDUE_DATE) = '1900-01-01' then '1990-01-01' else ld.OVERDUE_DATE end as OVERDUE_DATE
,case when date(ld.FIRST_OVERDUE_DATE) = '1900-01-01' then '1990-01-01' else ld.FIRST_OVERDUE_DATE end as FIRST_OVERDUE_DATE
,ld.PUT_AMOUNT
,ld.RECEIVE_AMOUNT
,ld.REST_PRINCIPAL
,ld.INTEREST_AMOUNT
,ld.OVER_DUE_PRINCIPAL
,ld.REST_INTEREST_AMOUNT
,ld.MGMTFEE_AMOUNT
,ld.REST_MGM_TFEE_AMOUNT
,ld.OTHER_FEES_AMOUNT
,ld.MONTHLY_INTEREST_RATE
,ld.MGMT_FEE_RATE
,ld.FEE_RATE
,ld.ledgers_feeRate
,ld.PENALTY_INTEREST_RATE
,ld.CURRENT_PHASE
,ld.REPAYED_PHASE
,ld.REST_PHASES
,ld.MONTHLY_REPAY
,ld.CA_CONTRACT_IDN
,ld.REPAY_ACCOUNT_INFO_ID
,case when date(ld.INADVANCE_REPAY_DATE) = '1900-01-01' then '1990-01-01' else ld.INADVANCE_REPAY_DATE end as INADVANCE_REPAY_DATE
,ld.INADVANCE_REPAY_GATHERED
,ld.INADVANCE_REPAY_REST_PRINCIPAL
,ld.INADVANCE_REPAY_BONUS
,ld.INADVANCE_REPAY_PHASE
,ld.CYCLE_REPAYING_LEND_REQUEST_ID
,ld.is_80compensate
,ld.over_due_repaytotal_amt
,atb.lender_id
,atb.ecif_acc_id
,atb.acc_status
,ld.RECOVER_GROUP_ID
,ld.RECOVER_STORE_ID
,ld.RECOVER_CITY_ID
,ld.RECOVER_AREA_ID
,atb.overdue_total_amt
,case when date(atb.overdue_day) = '1900-01-01' then '1990-01-01 00:00:00' else atb.overdue_day end as overdue_day
,atb.overdue_days
,atb.overdue_m
,case when date(atb.overdue_first) = '1900-01-01' then '1990-01-01 00:00:00' else atb.overdue_first end as overdue_first
,atb.over_due_repaid_amt
,atb.over_due_repaid_cnt
,atb.repayPrincipal
,atb.repayInterest
,atb.repay_cnt
,atb.over_due_fee_interest
,atb.over_due_fee_penalty
,atb.over_due_fee_managment
,atb.over_due_charge
,atb.repayModel
,atb.all_in_amount_a
,atb.all_in_amount_b
,atb.is_sold
,atb.sold_date
,atb.count_flow_back
,atb.if_phase_0
,atb.0_phase_repayDay
,atb.0_phase_state
,atb.0_phase_overdue_days
,atb.0_phase_liquidated_fee
,atb.0_phase_repayAll
from dwa.a_ln_apply_da lad
LEFT JOIN dwa.a_ln_account_da ld on lad.LEND_REQUEST_ID = ld.ACCOUNT_ID
LEFT JOIN daihou.p_daihou_acc_total_base_a atb on atb.report_date = '2020-09-26' and atb.source_id = lad.LEND_REQUEST_ID limit 2260000,10000




create table if not exists dwa.a_ln_apply_ck on cluster cluster_1\
(REPORT_DATE String\
,LEND_REQUEST_ID Int32\
,STATE_CD String\
,CREDIT_STATE_CD String\
,ACCEPT_TIME DateTime\
,CREATE_TIME DateTime\
,SUBMIT_TIME DateTime\
,CUSTOMER_ID Nullable(Int32)\
,GROUP_ID Int32\
,STORE_ID Int32\
,CITY_ID Int32\
,AREA_ID Int32\
,SELLER_ID String\
,SERVICER_ID String\
,POST_SERVICER_ID String\
,APPLIED_PRODUCT_ID Int32\
,APPLIED_PRODUCT_TYPE_CD String\
,APPLIED_PRODUCT_NATURE_CD String\
,LOAN_PRODUCT_ID Int32\
,PRODUCT_TYPE_CD String\
,PRODUCT_NATURE_CD String\
,LEND_CHANNEL_CD Int32\
,LEND_CHANNEL_TYPE_CD String\
,LEND_PURPOSE String\
,CUSTOMER_NATURE String\
,ORIGIN String\
,fundSource Nullable(String)\
,is_union Nullable(Int8)\
,is_main_union Nullable(Int8)\
,is_calculate Nullable(Int8)\
,union_lrid Int32\
,main_union_lrid Int32\
,INITIAL_AUDIT_TIME DateTime\
,BEGIN_AUDIT_TIME DateTime\
,FINAL_AUDIT_TIME DateTime\
,AUDIT_RATE Int32\
,REVIEW_TIME DateTime\
,REVIEWED Int8\
,EXPEDITION_FEE Decimal(20,4)\
,EXPEDITIONSTATE String\
,APPROVAL_BEGIN_DATE DateTime\
,APPROVAL_END_DATE DateTime\
,APPROVAL_AMOUNT Decimal(20,4)\
,total_approve_amount Decimal(20,4)\
,split_approve_amount Decimal(20,4)\
,REJECT_TIME DateTime\
,GIVE_UP_TIME DateTime\
,MAIN_REASON_CD Int32\
,CREDIT_REJECTED_TIME DateTime\
,CREDIT_REJECTED_CD Int32\
,BRANCH_REJECTED_TIME DateTime\
,BRANCH_REJECTED_USER_ID String\
,submitLoanTime DateTime\
,finalAuditOverTime Nullable(DateTime)\
,SIGNED_TIME DateTime\
,SIGNED_AMOUNT Decimal(20,4)\
,AMOUNT Decimal(20,4)\
,SIGNED_BRANCH String\
,adapt_amount Nullable(Decimal(16,2))\
,PHASES Nullable(Int32)\
,LOAN_DATE Nullable(DateTime)\
,ACTUAL_LOAN_DATE Nullable(DateTime)\
,DRAW_CASH_TIME Nullable(DateTime)\
,DRAW_CASH_STATE Nullable(String)\
,ACTUAL_PAYMENT_DATE Nullable(DateTime)\
,FINAL_CHECK_DATE Nullable(DateTime)\
,END_DAY Nullable(Date)\
,REPAY_DAY Nullable(Int32)\
,FIRST_REPAY_DATE Nullable(Date)\
,OVERDUE_DATE Nullable(Date)\
,FIRST_OVERDUE_DATE Nullable(Date)\
,PUT_AMOUNT Nullable(Decimal(20,2))\
,RECEIVE_AMOUNT Nullable(Decimal(20,2))\
,REST_PRINCIPAL Nullable(Decimal(20,2))\
,INTEREST_AMOUNT Nullable(Decimal(20,2))\
,OVER_DUE_PRINCIPAL Nullable(Decimal(20,2))\
,REST_INTEREST_AMOUNT Nullable(Decimal(20,2))\
,MGMTFEE_AMOUNT Nullable(Decimal(20,2))\
,REST_MGM_TFEE_AMOUNT Nullable(Decimal(20,2))\
,OTHER_FEES_AMOUNT Nullable(Decimal(20,2))\
,MONTHLY_INTEREST_RATE Nullable(Decimal(20,6))\
,MGMT_FEE_RATE Nullable(Decimal(20,6))\
,FEE_RATE Nullable(Decimal(10,4))\
,ledgers_feeRate Nullable(Decimal(16,4))\
,PENALTY_INTEREST_RATE Nullable(Decimal(20,6))\
,CURRENT_PHASE Nullable(Int32)\
,REPAYED_PHASE Nullable(Int32)\
,REST_PHASES Nullable(Int32)\
,MONTHLY_REPAY Nullable(Decimal(12,2))\
,CA_CONTRACT_IDN Nullable(String)\
,REPAY_ACCOUNT_INFO_ID Nullable(Int32)\
,INADVANCE_REPAY_DATE Nullable(Date)\
,INADVANCE_REPAY_GATHERED Nullable(Int32)\
,INADVANCE_REPAY_REST_PRINCIPAL Nullable(Decimal(10,0))\
,INADVANCE_REPAY_BONUS Nullable(Decimal(10,0))\
,INADVANCE_REPAY_PHASE Nullable(Int32)\
,CYCLE_REPAYING_LEND_REQUEST_ID Nullable(Int32)\
,is_80compensate Nullable(Int32)\
,over_due_repaytotal_amt Nullable(Decimal(20,2))\
,lender_id Nullable(Int32)\
,ecif_acc_id Nullable(Int32)\
,acc_status Nullable(Int32)\
,RECOVER_GROUP_ID Nullable(Int32)\
,RECOVER_STORE_ID Nullable(Int32)\
,RECOVER_CITY_ID Nullable(Int32)\
,RECOVER_AREA_ID Nullable(Int32)\
,overdue_total_amt Nullable(Decimal(20,4))\
,overdue_day Nullable(DateTime)\
,overdue_days Nullable(Int32)\
,overdue_m Nullable(Int32)\
,overdue_first Nullable(DateTime)\
,over_due_repaid_amt Nullable(Decimal(20,4))\
,over_due_repaid_cnt Nullable(Decimal(20,4))\
,repayPrincipal Nullable(Decimal(20,4))\
,repayInterest Nullable(Decimal(20,4))\
,repay_cnt Nullable(Decimal(20,4))\
,over_due_fee_interest Nullable(Decimal(20,4))\
,over_due_fee_penalty Nullable(Decimal(20,4))\
,over_due_fee_managment Nullable(Decimal(20,4))\
,over_due_charge Nullable(Decimal(20,4))\
,repayModel Nullable(String)\
,all_in_amount_a Nullable(Decimal(20,4))\
,all_in_amount_b Nullable(Decimal(20,4))\
,is_sold Nullable(Int32)\
,sold_date Nullable(Date)\
,count_flow_back Nullable(Int32)\
,if_phase_0 Nullable(Int32)\
,phase_0_repayDay Nullable(Date)\
,phase_0_state Nullable(String)\
,phase_0_overdue_days Nullable(Int32)\
,phase_0_liquidated_fee Nullable(Decimal(16,2))\
,phase_0_repayAll Nullable(Decimal(17,2))\
)ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/a_ln_apply_ck', '{replica}')\
PARTITION BY (REPORT_DATE)\
ORDER By (REPORT_DATE,LEND_REQUEST_ID);\

create table if not exists dwa.a_ln_apply_ck_dist ON CLUSTER cluster_1 \
as dwa.a_ln_apply_ck \
ENGINE = Distributed(cluster_1, dwa, a_ln_apply_ck, rand());