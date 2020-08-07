#!/usr/bin/env python
#-*- coding:utf-8 -*-
import sys
import os
sys.path.append(os.environ['HDMP_HOME']+'/ucredit')
import json
from data.io.Source import Source
from data.util.Shell import Shell
from data.util.Logger import logger
from data.util.Time import Time
from data.db.DBI import do_sql

def get_task_info(task_name):
    sql="SELECT t.task_id,e.exec_cfgs FROM task_info_cfg t LEFT JOIN exec_cfg e ON t.exec_cfg_id=e.exec_cfg_id "
    sql+="WHERE t.task_name='%s' " % (task_name)
    rows=do_sql(sql,dbc='db_dm_cfg')
    if not rows:
        return -1
    row=rows[0]
    task_id,exec_cfgs=row
    try:
        j=json.loads(exec_cfgs.replace("'",'"'))
    except Exception,e:
        print e
        j={}
    is_sep=int(j.get('separate_flag',0))
    return task_id,is_sep

def run_shell(cmd,retcode=0):
    shell=Shell(cmd)
    try:
        for line in shell.outs():
            print line
        return 0
    except Exception,e:
        logger.error(str(e))
        sys.exit(retcode)
    return retcode

def run_common_task(db,table,date,task_id):
    date=Time.date_format(date)
    shells=[
        """hive -e "use %s; alter table %s drop partition(dt='%s')" """ % (db,table,date),
        """hadoop jar /opt/app/hdmp/sched/jobs/DataSync.jar %s %s """ % (task_id,date),
        """hive -e "use %s; alter table %s add partition(dt='%s')" """ % (db,table,date),
    ]
    for idx,shell in enumerate(shells):
        retcode=run_shell(shell,idx+1)
        if retcode!=0:
            return retcode
    return 0

def run_sep_task(date,task_name,script='/home/pcsmaster/sched/jobs/DsyncX-sep.py'):
    cmd="python %s %s %s" % (script,date,task_name)
    return run_shell(cmd,4)

def run_task(cfg):
    parts=cfg.split('.')[0].split('_')
    db,task_name,date=parts[0],'_'.join(parts[1:-1]),parts[-1]
    task_id,is_sep=get_task_info(task_name)
    if task_id==-1:
        logger.error('No such task name %s!' % (task_name))
        return -1
    if is_sep:
        return run_sep_task(date,task_name)
    return run_common_task(db,task_name,date,task_id)
    
def main():
    if len(sys.argv)<2:
        raise Exception("One sys args at least.")
    cfg=sys.argv[1]
    return run_task(cfg)
    
if __name__ == '__main__':
    main()
    
