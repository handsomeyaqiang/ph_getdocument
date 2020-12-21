第一步，在集群里创建一个副本表
CREATE TABLE if not exists dwa.a_ln_account_da on cluster cluster_1\
(\
    `ACCOUNT_ID` Int32,\
    `CUSTOMER_ID` Int32,\
    `GROUP_ID` Int32,\
    `STORE_ID` Int32,\
    `CITY_ID` Int32,\
    `AREA_ID` Int32,\
    `RECOVER_GROUP_ID` Int32,\
    `RECOVER_STORE_ID` Int32,\
    `RECOVER_CITY_ID` Int32,\
    `RECOVER_AREA_ID` Int32,\
    `SELLER_ID` String,\
    `customer_service_id` Nullable(String),\
    `CHANNEL_ID` Int32,\
    `PRODUCT_CD` String,\
    `PRODUCT_TYPE_CD` String,\
    `RRD_PRODUCT_NAME` String,\
    `PRODUCT_NATURE_CD` String,\
    `nick_name` Nullable(String),\
    `SIGNED_TIME` DateTime,\
    `LOAN_DATE` DateTime,\
    `ACTUAL_LOAN_DATE` DateTime,\
    `ACTUAL_PAYMENT_DATE` DateTime,\
    `FINAL_CHECK_DATE` DateTime,\
    `END_DAY` Date,\
    `FIRST_OVERDUE_DATE` Date,\
    `OVERDUE_DATE` Date,\
    `M6_DATE` Date,\
    `FIRST_REPAY_DATE` Date,\
    `REPAY_DAY` Int32,\
    `entrust_date` Nullable(Date),\
    `DRAW_CASH_TIME` DateTime,\
    `DRAW_CASH_STATE` String,\
    `REF_ID` Nullable(String),\
    `SIGNED_AMOUNT` String,\
    `PUT_AMOUNT` String,\
    `RECEIVE_AMOUNT` String,\
    `REST_PRINCIPAL` String,\
    `OVER_DUE_PRINCIPAL` String,\
    `INTEREST_AMOUNT` String,\
    `REST_INTEREST_AMOUNT` String,\
    `MGMTFEE_AMOUNT` String,\
    `REST_MGM_TFEE_AMOUNT` String,\
    `OTHER_FEES_AMOUNT` String,\
    `MONTHLY_INTEREST_RATE` String,\
    `MGMT_FEE_RATE` String,\
    `FEE_RATE` String,\
    `PENALTY_INTEREST_RATE` String,\
    `CURRENT_PHASE` Int32,\
    `curr_phase_m` Nullable(Int32),\
    `REST_PHASES` Int32,\
    `PHASES` Int32,\
    `REPAYED_PHASE` Int32,\
    `MONTHLY_REPAY` Nullable(String),\
    `CA_CONTRACT_IDN` String,\
    `REPAY_ACCOUNT_INFO_ID` Int32,\
    `INADVANCE_REPAY_DATE` Date,\
    `INADVANCE_REPAY_GATHERED` Int32,\
    `INADVANCE_REPAY_REST_PRINCIPAL` String,\
    `INADVANCE_REPAY_BONUS` String,\
    `INADVANCE_REPAY_PHASE` Int32,\
    `CYCLE_REPAYING_LEND_REQUEST_ID` Int32,\
    `RESERVE_RATE` String,\
    `CUSTOMER_NATURE` String,\
    `FULL_BONUS` Int8,\
    `LAST_REPAY_DATE` Date,\
    `ACCOUNT_STATE_CD` String,\
    `origin` Nullable(String),\
    `loan_purpose` Nullable(String),\
    `signedCompany` Nullable(String),\
    `SYSTEM_FLG` String,\
    `LAST_UPDATE_DATE` DateTime,\
    `thirdParty` Nullable(Int32),\
    `signedBranch` Nullable(String),\
    `amount` Nullable(String),\
    `rest_principal_no_inadvance` Nullable(String),\
    `curr_phase` Nullable(Int32),\
    `fundTime` Nullable(DateTime),\
    `fundstate` Nullable(String),\
    `ledgers_feeRate` Nullable(String),\
    `is_calculate` Nullable(Int8),\
    `is_union` Nullable(Int8),\
    `is_main_union` Nullable(Int8),\
    `union_lrid` Int32,\
    `total_approve_amount` String,\
    `split_approve_amount` String,\
    `main_union_lrid` Int32,\
    `postServicer_id` Nullable(String),\
    `is_80compensate` Nullable(Int32),\
    `over_due_repaytotal_amt` Nullable(String)\
)\
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/a_ln_account_da', '{replica}')\
ORDER BY (ACCOUNT_ID, SYSTEM_FLG)\
SETTINGS index_granularity = 8192\

第二步，集群里创建一个分布式表指向本地表
CREATE TABLE dwa.a_ln_account_da_dist ON CLUSTER cluster_1 \
as dwa.a_ln_account_da \
ENGINE = Distributed(cluster_1, dwa, a_ln_account_da, rand());
第三步，插入数据到分布式表中
insert into dwa.a_ln_account_da_dist select * from mysql('172.16.2.142:3309','dwa','a_ln_account_da','diaodu','zjKSt0QQrEIMsjm');