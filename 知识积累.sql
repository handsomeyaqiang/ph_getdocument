1���鿴Ŀ¼�µ�Ŀ¼
ls -l | grep '^d'

12���鿴Ŀ¼�µ��ļ�
ls -l | grep '^-'

13��ͬ���ű�
����vp���ձ�����
scp overdue_brief_daily.txt 172.16.2.102:/opt/app/dmp/sched/jobs/ExportFRExcel/cptparam
����
scp overdue_brief_daily.txt 172.16.2.102:$PWD
14���ű��ַ�
�ַ��ļ���
[lixinguang@dwdb3 jobs]$ sched file -dist p_daihou_qingdao_huarun_renbao_sendmail.py
scp -P 22222 -r /opt/app/dmp/sched/jobs/p_daihou_qingdao_huarun_renbao_sendmail.py lixinguang@172.16.2.102:/opt/app/dmp/sched/jobs
p_daihou_qingdao_huarun_renbao_sendmail.py                                                                                                                   100%   11KB  10.8KB/s   00:00    
scp -P 22222 -r /opt/app/dmp/sched/jobs/p_daihou_qingdao_huarun_renbao_sendmail.py lixinguang@172.16.2.104:/opt/app/dmp/sched/jobs
p_daihou_qingdao_huarun_renbao_sendmail.py                                                                                                                   100%   11KB  10.8KB/s   00:00    
scp -P 22222 -r /opt/app/dmp/sched/jobs/p_daihou_qingdao_huarun_renbao_sendmail.py lixinguang@172.16.2.107:/opt/app/dmp/sched/jobs
p_daihou_qingdao_huarun_renbao_sendmail.py      
�ű���־����λ��/opt/app/dmp/sched/logs  tail -f master.log
�ű�����λ��/opt/app/dmp/sched/jobs
15 ������
show create table p_ln_overdue_store_daily_d2_di
ALTER TABLE app.p_ln_overdue_store_daily_d2_di DROP  PRIMARY  KEY
ALTER TABLE app.p_ln_overdue_store_daily_d2_di ADD PRIMARY KEY ( `report_date`,`org_type`,`org_id`,`area_id`,`city_id`,`store_id`,`is_center` ); 
alter table app.p_ln_repay_remind_day_di add repayday varchar(10) NOT NULL DEFAULT '' after org_type;
ALTER TABLE app.p_ln_overdue_cus_remind_collection_di ADD INDEX record_date ( `reporter_date` ) 

16��������������
select sum(case when business_day = 1 then 1 else 0 end) as work_days from dim.d_dim_work_day where date >= '2019-11-28' and date <= '2019-12-02'

17�����ݿ�
mysqldump -hlocalhost -uroot -proot -P3306 database app > D:\dump.sql
19��git diff startindex endindex > tmp.diff

18���޸�����
alter table app.p_ln_repay_remind_day_di modify column `org_type` varchar(16) NOT NULL DEFAULT '';
#�޸ı������﷨:
alter table oldname rename to new_tablename;
ɾ��ĳ��
alter table app.p_ph_sale_index_cumulativeness_da drop column EXTEND_SIGNED_RATE_AMT ;
19�������ļ�����
//.��Ϊ���ҵ�ǰĿ¼ �� �� ���� *.php �ļ��� �� hello ���ļ�
-- find . -type f -name "*.php" | xargs grep "hello"
-- find . -type f -name "*.php" | xargs grep "hello"
-- grep a_ln_account_da *.cpt
-- grep a_ln_account_da */*.cpt


20��excel�ֶ�ƴ��
=VLOOKUP(C2,Sheet2!A:B,2,FALSE)


21��ʱ��
TIMESTAMPDIFF(MINUTE,start_time,end_time)/60


22��Linux tar���÷�
1. ���
tar -cvf hello.tar hello/

��hello�ļ��д��������hello.tar�Ǽ������ɵĴ���ļ������֣��������ѹ��

��Ӧ�Ľ�ѹ��ʽ�ǣ�

tar -xvf hello.tar

���֮ǰ�Ѿ���õ�tar���ڵ�ǰ·���½⿪

 
2. ���+ѹ��
tar -zcvf hello.tgz hello/
��hello�ļ��д����ѹ��������hello.tgz�Ǽ������ɵ�ѹ���ļ������֣��������gzip��ʽѹ��

��׺.tgzҲ����д��.tar.gz

��Ӧ�Ľ�ѹ��ʽ��

tar -xzvf hello.tgz 

 

3. ѡ��ĺ���

-c ��create����˼�������µı����ļ���������ѡ�����ڴ���������ǽ�ѹ

-v ��ʾִ�й���

-f ��file����˼

-x ��extract��ȡ����˼��������ѡ�����ڽ⿪��

-z ����gzipѹ������ungizip��ѹ����˼���漰��gzip��ʽ��ѹ������ѹ����Ҫ���������

�������м���ѹ����ʽ��ƽʱ�õ��٣�bzip2��

23/shell�ű�����
#!/usr/bin/env bash
start_date=$1
end_date=$2
if [ ! $end_date ]; then
 end_date=$start_date
 echo "start_date is $start_date,end_date is $end_date"
else
   echo "start_date is $start_date,end_date is $end_date"
fi

while [ "$start_date" -le "$end_date" ];
do
  stat_date=`date -d "$start_date" +%Y%m%d`
  echo "now is beginning $stat_date"
  #python tmp_batch_file.py $stat_date
  start_date=$(date -d "$start_date+1days" +%Y%m%d)
done
24.ͳ��linux����
wc -l xxx.txt
25����ǰ���ڣ�date "+%Y-%m-%d %H:%M:%S"

