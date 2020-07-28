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
select sum(is_done) as monitor_cnt 
from (
select 
a.`name`
,case when a.`name` in ('s_thread_lend_portfolio_plans_i','s_thread_lend_portfolio_repay_records_i') and CURRENT_TIME() >= '02:30:00'  and b.end_time is null then 1 
        when a.`name` in ('a_ln_apply_da') and CURRENT_TIME() >= '01:30:00'  and b.end_time is null then 1 
        when a.`name` in ('a_ln_account_da') and CURRENT_TIME() >= '03:30:00'  and b.end_time is null then 1
        when a.`name` in ('o_thread_lend_portfolio_plans_a','o_thread_lend_portfolio_repay_records_a') and CURRENT_TIME() >= '03:30:00'  and b.end_time is null then 1 
      else 0 end as is_done
from ( select `name` from db_datamgrcfg.sched_job
where `name` in ('a_ln_apply_da','a_ln_account_da','o_thread_lend_portfolio_plans_a','o_thread_lend_portfolio_repay_records_a','s_thread_lend_portfolio_plans_i','s_thread_lend_portfolio_repay_records_i') ) a
join db_datamgrcfg.sched_job_record b on a.`name` =b.`name` 
)t
where is_done > 0;
"""

SQL1="""
select concat(GROUP_CONCAT(`name`),'任务延迟') as undone_job
from (
select 
a.`name`
,case when a.`name` in ('s_thread_lend_portfolio_plans_i','s_thread_lend_portfolio_repay_records_i') and CURRENT_TIME() >= '02:30:00'  and b.end_time is null then 1 
        when a.`name` in ('a_ln_apply_da') and CURRENT_TIME() >= '01:30:00'  and b.end_time is null then 1 
        when a.`name` in ('a_ln_account_da') and CURRENT_TIME() >= '03:30:00'  and b.end_time is null then 1
        when a.`name` in ('o_thread_lend_portfolio_plans_a','o_thread_lend_portfolio_repay_records_a') and CURRENT_TIME() >= '03:30:00'  and b.end_time is null then 1 
      else 0 end as is_done
from ( select `name` from db_datamgrcfg.sched_job
where `name` in ('a_ln_apply_da','a_ln_account_da','o_thread_lend_portfolio_plans_a','o_thread_lend_portfolio_repay_records_a','s_thread_lend_portfolio_plans_i','s_thread_lend_portfolio_repay_records_i') ) a
join db_datamgrcfg.sched_job_record b on a.`name` =b.`name` 
)t
where is_done > 0
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
	            mobile = u'15010657470,13581872311,18500039980,13581778526,13810048039,13520272395,15639928163'
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
