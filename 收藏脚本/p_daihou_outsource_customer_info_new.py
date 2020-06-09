#!/usr/bin/python
#coding=utf-8
import os
import sys
sys.path.append(os.environ['DMP_HOME']+'/ucredit')
from data.util.Time import Time
from datetime import datetime, timedelta
from data.db.DictDb import new_ecif
from data.db.DictDb import amque
#from data.db.DictDb import agent
from data.db.DBhandle import DBhandle
import MySQLdb

data_dt=Time.date_format(sys.argv[1].split('.')[0].split('_')[-1]) if len(sys.argv)>1 else Time.yesterday()

# 数仓数据库插入数据
def insertmanySql(sql,source_data):
	conn = MySQLdb.connect(host=new_ecif['host'], user=new_ecif['user'],passwd=new_ecif['passwd'], db=new_ecif['db'],port=new_ecif['port'], charset='utf8')
	cursor = conn.cursor()
	res = cursor.executemany(sql,list(source_data))
	conn.commit()
	cursor.close()
	conn.close()
	return res

# 数仓数据库执行
def extSql(sql):
    dbcur = DBhandle(new_ecif)
    res = dbcur.execute(sql)
    dbcur.close()
    return res

# 数仓数据库查询数据
def selectSql(sql):
    dbcur = DBhandle(new_ecif)
    res = dbcur.select(sql)
    dbcur.close()
    return res
   
    
# amque数据库查询
def amqueselectSql(sql):
    dbcur = DBhandle(amque)
    res = dbcur.select(sql)
    dbcur.close()
    return res
# 获取客户id列表
def get_OrderSeq_list(sql):
	customer_tup = selectSql(sql)
	customer_list = []
	for i in range(0,len(customer_tup)):
		customer_list.append(str(customer_tup[i][0]))
	OrderSeq_list = ",".join(customer_list) 
	return OrderSeq_list

#查询客户逾期20以上，月末账龄为2的客户
query_customer_cnt = '''
select count(1) as cnt
from ecif.f_customer_daily_openning a
where a.date = CURDATE()
and a.over_due_days>=21 and a.over_due_days<90;
 '''
query_customer = '''
select a.customer_id 
from ecif.f_customer_daily_openning a
where a.date = CURDATE()
and a.over_due_days>=21 and a.over_due_days<90
limit %d,%d
 '''

#去AMQUE系统查询地址信息，是否欺诈，是否待委外
query_obj_1 = '''
select a.id as cust_id
,a.customer_code
,substr(house.detail_address,1,10) as houseadd
,substr(work.detail_address,1,10) as workadd
,substr(home.detail_address,1,10) as homeadd
,case when lb.label_id in (6,13,27,28,23) then 1 else 0 end as mark
,case when seg.customer_code is not null then 1 else 0 end as toOS
,tsi.segment_name
,curdate() as report_date
from t_customer a
left join t_segment_info tsi on tsi.id = a.segment_id
LEFT JOIN amque.t_customer_label_info lb ON lb.cust_id = a.id
left join (
select cus.customer_code
from amque.t_customer cus
left join amque.t_segment_info seg on seg.id = cus.segment_id
left join amque.t_collection_unit u on u.id = seg.unit_id
where u.unit_category = 2 and u.unit_name like ('%%待委外%%')
group by cus.customer_code)seg on seg.customer_code = a.customer_code
left join (
select cust_id,max(case when address_type = 578 then a.id else 0 end) as house_id 
,max(case when address_type = 579 then a.id else 0 end) as work_id 
,max(case when address_type = 580 then a.id else 0 end) as home_id 
from amque.t_customer_address_info a
inner join amque.t_customer b on a.cust_id = b.id and b.customer_code in (%s)
where is_available = 'Y' group by cust_id)address on address.cust_id = a.id
left join amque.t_customer_address_info house on house.id = address.house_id
left join amque.t_customer_address_info work on work.id = address.work_id
left join amque.t_customer_address_info home on home.id = address.home_id
left join amque.t_cust_seg_variable b on b.attr_id = 32 and b.var_value = 'ture' and a.id = b.cust_id
left join (SELECT oc.cust_id
FROM amque.t_out_source_batch ob
LEFT JOIN amque.t_out_source_cus oc ON oc.out_source_batch_id = ob.id
WHERE oc.status IN (774,854,856) AND ob.end_date >= curdate()
group by oc.cust_id)ot on ot.cust_id = a.id
where a.customer_code in (%s) 
and b.cust_id is null
and not exists (select t.cust_id from (
select cust_id from t_customer_label_info 
where label_id in (4,5,6,17,27,28,37,38,39)
group by cust_id)t where t.cust_id = a.id)
-- and a.is_out_assigned ='N'
and ot.cust_id is null;
'''

if __name__ == '__main__':
	customer_cnt = selectSql(query_customer_cnt)
	print customer_cnt[0][0]
	if customer_cnt[0][0] > 0:
		truncate_sql_1 = "truncate table app.p_daihou_outvisit_customer_new_da"
		print truncate_sql_1
		delete_cnt = extSql(truncate_sql_1)
	print customer_cnt
	i = 0
	j = 0
	while j < customer_cnt[0][0]:
		i = j
		j = j + 5000
		query_job_first = query_customer % (i,5000)
		print query_job_first
		customer_id = get_OrderSeq_list(query_job_first)
		query_obj = query_obj_1 % (customer_id,customer_id)
		source_data_1 = amqueselectSql(query_obj)
		if source_data_1:
			insert_sql_1 = "insert into app.p_daihou_outvisit_customer_new_da (cust_id,customer_code,houseadd,workadd,homeadd,mark,toOS,segment_name,report_date) values (%s,%s,%s,%s,%s,%s,%s,%s,%s);"
			insert_cnt = insertmanySql(insert_sql_1,source_data_1)
			print '插入数据%d条' % insert_cnt
		else:
			print '查询amque外访客户数据为空。'