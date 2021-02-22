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
  python app_fundprinciple_monitor.py $stat_date
  start_date=$(date -d "$start_date+1days" +%Y%m%d)
done
