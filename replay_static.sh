# /usr/bin/bash
for file in `ls |grep mcu1`
do
echo =============================
echo "the file name is : $file"
tail $file |grep "Replay Stat"
SP=`tail $file |grep "Replay Stat"|awk '{print $3}'|awk -F- '{print $2}'`
PS=`tail $file |grep "Replay Stat"|awk '{print $4}'|awk -F- '{print $2}'`
pass_rate=`echo "scale=4; $PS/$SP*100"|bc`
duration=`tail $file |grep "Replay Stat"|awk -F: '{print $2}'|awk -F. '{print $1}'`
echo "pass rate is $pass_rate"
echo "duration is $duration"
done
