#!/usr/bin/env python
#-*- coding:utf-8 -*-
import sys,re,os
import urllib2
import urllib
reload(sys)
sys.setdefaultencoding('utf8')
sys.path.append('/opt/app/dmp/ucredit')
from data.util.Time import Time
from datetime import datetime, timedelta
from data.db.DictDb import dictetl
from data.db.DBhandle import DBhandle


data_dt=Time.date_format(sys.argv[1].split('.')[0].split('_')[-1]) if len(sys.argv)>1 else Time.yesterday()

condition_query = """
select  count(1) as monitor_cnt
from daihou.daihou_day_monitor_config_01 t1
inner join 
(
select 
hour(now()) as monitor_hour
,sum(case when substr(b.`name`,1,8)='e_daihou' and b.state='DONE' then 1 else 0 end) as done_task_type3
,sum(case when substr(b.`name`,1,10)='gen_daihou' and b.state='DONE' then 1 else 0 end) as done_task_type2
,sum(case when substr(b.`name`,1,8)<>'e_daihou' and substr(b.`name`,1,10)<>'gen_daihou' and b.state='DONE' then 1 else 0 end) as done_task_type1
from ( select `name` from db_datamgrcfg.sched_job
where `group`='amq' and `enable` =1
and `name` not in ('gen_daihou_mt_customer_account_his','p_mid_amq_rrd_app_da','p_thread_loan_amp_date_da') ) a
join db_datamgrcfg.sched_job_record b
on a.`name` =b.`name` 
group by hour(now()) )t2 on t1.monitor_hour = t2.monitor_hour
where ifnull(t2.done_task_type1,0) < t1.done_task_type1
or  ifnull(t2.done_task_type2,0) < t1.done_task_type2
or  ifnull(t2.done_task_type3,0) < t1.done_task_type3;
"""

SQL1="""
select concat(GROUP_CONCAT(run_desc),',详见邮件')
from (
select 1 as id
,concat(case when substr(b.`name`,1,8)='e_daihou' then '3推送任务'
      when substr(b.`name`,1,10) = 'gen_daihou' then '2推送数据计算'
      else '1基础数据计算' end 
,'-',sum(case when b.state='DONE' and b.tx_time = replace(DATE_SUB(CURDATE(),INTERVAL 1 day),'-','') then 1 else 0 end) ,'/',count(1) ) run_desc
from ( select `name` from db_datamgrcfg.sched_job
where `group`='amq' and `enable` =1
and `name` not in ('gen_daihou_mt_customer_account_his','p_mid_amq_rrd_app_da','p_thread_loan_amp_date_da') ) a
join db_datamgrcfg.sched_job_record b
on a.`name` =b.`name` 
group by case when substr(b.`name`,1,8)='e_daihou' then '3推送任务'
      when substr(b.`name`,1,10) = 'gen_daihou' then '2推送数据计算'
      else '1基础数据计算' end ) t
group by id
"""
sqls=map(lambda r:r[1],sorted([(int(k.split('SQL')[1]),v) for k,v in locals().items() if k.startswith('SQL')],key=lambda r:r[0]))
def excSql(sql):
    dbcur = DBhandle(dictetl)
    res = dbcur.execute(sql)
    dbcur.close()
    return res

def selectSql(sql):
    dbcur = DBhandle(dictetl)
    res = dbcur.select(sql)
    dbcur.close()
    return res[0][0]

def main():
    time=str(datetime.now()).replace('-','').replace(' ','.')
    print '['+time+']--------------Start Run Job'
    condition_cnt = selectSql(condition_query)
    if condition_cnt:
	    for sql in sqls:
	        res_count = ''
	        if sql:
	            res_count=selectSql(sql)
	            print str(res_count.encode('utf8'))
	            url = 'http://push.ucredit.com/push/templatePush'
	            descreptionParam = u'["%s,警"]' % res_count
	            descreptionParam = descreptionParam.encode('utf8')
	            mobile = u'15010657470,13581872311,18500039980,13581778526,13231863595,18101220376,13810048039,13520272395,13720427061,15639928163'
	            #mobile = u'13581778526'
	            data = {'businessId': '201809101609548323836050', 'templateId': '85',
	                    'mobile': mobile, 'descreptionParam': descreptionParam}
	            data_urlencode = urllib.urlencode(data)
	            smsurl = urllib2.Request(url=url, data=data_urlencode)
	            r=urllib2.urlopen(smsurl)
	            r.read()
    else:
    		print '任务正常。'
    		'''
    		url = 'http://push.ucredit.com/push/templatePush'
    		descreptionParam = u'["任务正常。"]'
    		descreptionParam = descreptionParam.encode('utf8')
    		mobile = u'13581778526'
    		data = {'businessId': '201809101609548323836050', 'templateId': '85','mobile': mobile, 'descreptionParam': descreptionParam}
    		data_urlencode = urllib.urlencode(data)
    		smsurl = urllib2.Request(url=url, data=data_urlencode)
    		r=urllib2.urlopen(smsurl)
    		r.read()
    		'''
    print '['+time+']--------------Finish Process JOB'

if __name__ == '__main__':
    main()
