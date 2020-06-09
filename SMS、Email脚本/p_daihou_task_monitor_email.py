#!/usr/bin/env python
#-*- coding:utf-8 -*-
import sys,re,os
sys.path.append('/opt/app/dmp/ucredit')
from data.util.Time import Time
from data.util.Wrapper import looper
from data.util.Mail import HTML,send_mail
from data.util.Mail import HTML,send_attach_mail
from data.db.DBhandle import DBhandle
from data.db.DictDb import dictetl
import xlwt


data_dt=Time.date_format(sys.argv[1].split('.')[0].split('_')[-1]) if len(sys.argv)>1 else Time.yesterday()

sql1="""
select case when substr(b.`name`,1,8)='e_daihou' then '3推送任务'
      when substr(b.`name`,1,10) = 'gen_daihou' then '2推送数据计算'
      else '1基础数据计算' end as '任务分类'
,count(1) as '总任务数'
,sum(case when b.state='DONE' and b.tx_time = replace(DATE_SUB(CURDATE(),INTERVAL 1 day),'-','') then 1 else 0 end) as '完成数'
,sum(case when b.state='RUNNING' and b.tx_time = replace(DATE_SUB(CURDATE(),INTERVAL 1 day),'-','') then 1 else 0 end) as '运行数'
,sum(case when b.state='FAILED' and b.tx_time = replace(DATE_SUB(CURDATE(),INTERVAL 1 day),'-','') then 1 else 0 end) as '失败数'
from ( select `name` from db_datamgrcfg.sched_job
where `group`='amq' and `enable` =1
and `name` not in ('gen_daihou_mt_customer_account_his','p_mid_amq_rrd_app_da','p_thread_loan_amp_date_da') ) a
join db_datamgrcfg.sched_job_record b
on a.`name` =b.`name` 
group by case when substr(b.`name`,1,8)='e_daihou' then '3推送任务'
      when substr(b.`name`,1,10) = 'gen_daihou' then '2推送数据计算'
      else '1基础数据计算' end
order by '任务分类' desc;
"""
header1="任务运行状态汇总"

sql2="""
select a.`name` as '任务名称'
,b.start_time as '开始时间'
,b.end_time as '结束时间'
,b.state as '任务状态'
,b.tx_time as '数据日期'
from ( select `name` from db_datamgrcfg.sched_job
where `group`='amq' and `enable` =1
and `name` not in ('gen_daihou_mt_customer_account_his','p_mid_amq_rrd_app_da','p_thread_loan_amp_date_da') ) a
left join db_datamgrcfg.sched_job_record b
on a.`name` =b.`name` 
order by tx_time desc,start_time
"""

header2="任务运行明细"
sqls=dict((int(re.match(r'^sql(\d+)$',k).group(1)),v) for k,v in locals().items() if re.match(r'^sql\d+$',k))
headers=dict((int(re.match(r'^header(\d+)$',k).group(1)),v) for k,v in locals().items() if re.match(r'^header\d+$',k))
titles=dict((int(re.match(r'^title(\d+)$',k).group(1)),v) for k,v in locals().items() if re.match(r'^title\d+$',k))
targets=dict((int(re.match(r'^target(\d+)$',k).group(1)),v) for k,v in locals().items() if re.match(r'^target\d+$',k))

def selectSql(sql):
    dbcur = DBhandle(dictetl)
    res = dbcur.select(sql)
    dbcur.close()
    return res

def main():
    date=Time.date_format(data_dt,'-')
    subject="【贷后任务监控】贷后推送核心计算任务监控{date}".format(date=date)
    to="dp@youxin.com"
    cc="jiayanbin@youxin.com"
    dbc=dictetl
    sdate=date
    edate=Time.date_sub(date,-1)
    mini_sdate=Time.date_format(sdate,'')
    mini_edate=Time.date_format(edate,'')
    html=HTML()
    excel_file ='/opt/app/dmp/file/'+ subject+".xls"
    wb = xlwt.Workbook()
    title_style = xlwt.easyxf(strg_to_parse="font:bold on; align: wrap on, vert centre, horz centre; pattern: pattern solid, fore-colour gray25; borders: left thin, right thin, top thin, bottom thin")
    content_style = xlwt.easyxf(strg_to_parse="font:bold off; align: wrap on, vert centre, horz centre; pattern: pattern solid, fore-colour white; borders: left thin, right thin, top thin, bottom thin")
    for idx in sorted(sqls.keys()):
        sql=sqls.get(idx).strip().format(date=date,sdate=sdate,edate=edate)
        header=headers.get(idx,'').format(date=date,sdate=mini_sdate,edate=mini_edate)
        title=titles.get(idx,())
        if idx==1 or idx==2:
            html.add_dataset(sql,dbc=dbc,header=header,title=title)
        header=header.decode('utf-8')
        ws = wb.add_sheet(header)
        tit=0
        for dir_title in title:
            left_column = tit
            right_column = dir_title[1]-1+left_column
            title_con=dir_title[0].decode('utf-8')
            ws.write_merge(0,0,left_column,right_column,title_con,title_style)
            tit=tit+dir_title[1]
        target=targets.get(idx,'')
        seq = 0
        for dir_target in target:
            ws.write(1, seq, dir_target.decode('utf-8'), title_style)
            seq = seq + 1
        print sql
        if not sql:
            continue
        rows = selectSql(sql)

        line = 2
        for row in rows:
            for i in range(0,len(row)):
                if i==0:
                    res= row[i]
                else:
                    res=row[i]
                ws.write(line,i,res , content_style)
            line=line+1
    wb.save(excel_file)
    html=html.make()
    send_mail(to=to,cc=cc,subject=subject,html=html)

if __name__ == '__main__':
    main()
