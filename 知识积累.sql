1、查看目录下的目录
ls -l | grep '^d'

12、查看目录下的文件
ls -l | grep '^-'

13、同步脚本
各大vp所收报表监控
scp overdue_brief_daily.txt 172.16.2.102:/opt/app/dmp/sched/jobs/ExportFRExcel/cptparam
或者
scp overdue_brief_daily.txt 172.16.2.102:$PWD
14、脚本分发
分发文件：
[lixinguang@dwdb3 jobs]$ sched file -dist p_daihou_qingdao_huarun_renbao_sendmail.py
scp -P 22222 -r /opt/app/dmp/sched/jobs/p_daihou_qingdao_huarun_renbao_sendmail.py lixinguang@172.16.2.102:/opt/app/dmp/sched/jobs
p_daihou_qingdao_huarun_renbao_sendmail.py                                                                                                                   100%   11KB  10.8KB/s   00:00    
scp -P 22222 -r /opt/app/dmp/sched/jobs/p_daihou_qingdao_huarun_renbao_sendmail.py lixinguang@172.16.2.104:/opt/app/dmp/sched/jobs
p_daihou_qingdao_huarun_renbao_sendmail.py                                                                                                                   100%   11KB  10.8KB/s   00:00    
scp -P 22222 -r /opt/app/dmp/sched/jobs/p_daihou_qingdao_huarun_renbao_sendmail.py lixinguang@172.16.2.107:/opt/app/dmp/sched/jobs
p_daihou_qingdao_huarun_renbao_sendmail.py      
脚本日志所在位置/opt/app/dmp/sched/logs  tail -f master.log
脚本所在位置/opt/app/dmp/sched/jobs
15 、索引
show create table p_ln_overdue_store_daily_d2_di
ALTER TABLE app.p_ln_overdue_store_daily_d2_di DROP  PRIMARY  KEY
ALTER TABLE app.p_ln_overdue_store_daily_d2_di ADD PRIMARY KEY ( `report_date`,`org_type`,`org_id`,`area_id`,`city_id`,`store_id`,`is_center` ); 
alter table app.p_ln_repay_remind_day_di add repayday varchar(10) NOT NULL DEFAULT '' after org_type;
ALTER TABLE app.p_ln_overdue_cus_remind_collection_di ADD INDEX record_date ( `reporter_date` ) 

16、求工作日天数：
select sum(case when business_day = 1 then 1 else 0 end) as work_days from dim.d_dim_work_day where date >= '2019-11-28' and date <= '2019-12-02'

17、备份库
mysqldump -hlocalhost -uroot -proot -P3306 database app > D:\dump.sql
19、git diff startindex endindex > tmp.diff

18、修改列名
alter table app.p_ln_repay_remind_day_di modify column `org_type` varchar(16) NOT NULL DEFAULT '';
#修改表名的语法:
alter table oldname rename to new_tablename;
删除某列
alter table app.p_ph_sale_index_cumulativeness_da drop column EXTEND_SIGNED_RATE_AMT ;
19、查找文件内容
//.点为查找当前目录 下 的 所有 *.php 文件里 有 hello 的文件
-- find . -type f -name "*.php" | xargs grep "hello"
-- find . -type f -name "*.php" | xargs grep "hello"
-- grep a_ln_account_da *.cpt
-- grep a_ln_account_da */*.cpt


20、excel字段拼接
=VLOOKUP(C2,Sheet2!A:B,2,FALSE)


21、时间
TIMESTAMPDIFF(MINUTE,start_time,end_time)/60


22、Linux tar的用法
1. 打包
tar -cvf hello.tar hello/

把hello文件夹打包，红字hello.tar是即将生成的打包文件的名字，仅打包不压缩

对应的解压方式是：

tar -xvf hello.tar

会把之前已经打好的tar包在当前路径下解开

 
2. 打包+压缩
tar -zcvf hello.tgz hello/
把hello文件夹打包并压缩，红字hello.tgz是即将生成的压缩文件的名字，打包且以gzip方式压缩

后缀.tgz也可以写成.tar.gz

对应的解压方式是

tar -xzvf hello.tgz 

 

3. 选项的含义

-c 是create的意思，创建新的备份文件，因此这个选项用于打包，而不是解压

-v 显示执行过程

-f 是file的意思

-x 是extract提取的意思，因此这个选项用于解开包

-z 是用gzip压缩或者ungizip解压的意思，涉及到gzip方式的压缩、解压缩都要带这个参数

其他还有几个压缩方式，平时用的少，bzip2等

23/shell脚本日期
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
24.统计linux行数
wc -l xxx.txt
25、当前日期：date "+%Y-%m-%d %H:%M:%S"

