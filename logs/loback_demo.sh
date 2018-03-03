#!/bin/bash
date=`date -d yesterday +%Y%m%d`
for a in `cat /script/logcapture/vault`
#/script/logcapture/vault下面都是设备名字，事先做了无密码登陆，直接ssh设备名字便能登陆设备   
do 
if ping -c 2 $a    
then 
scp root@$a:/arroyo/log/avsdb.log.$date* /log/$date/avsdb/$a/
scp root@$a:/arroyo/log/protocoltiming.log.$date* /log/$date/protocoltiming/$a/
scp root@$a:/arroyo/log/c2k.log.$date* /log/$date/c2k/$a/  
else     
	echo "remote server $a is unavailable"  >>  /script/logcapture/problemserver.log
fi
done
sleep 5
for b in `cat /script/logcapture/masterserver`
 do
 	if ping -c 2 $b 
 		then 
 		scp root@$b/arroyo/log/avsdb.log.$date* /log/$date/avsdb/$b/
 		scp root@$b:/arroyo/log/protocoltiming.log.$date* /log/$date/protocoltiming/$b/
 		scp root@$b:/arroyo/log/c2k.log.$date* /log/$date/c2k/$b/
 		   else
 		        echo "remote server $b is unavailable"  >>  /script/logcapture/problemserver.log
 		    fi
done
sleep 5
for a in `cat /script/logcapture/allservers`
 do
 	if ping -c 2 $b 
 		then      
 		scp root@$a:/arroyo/log/avsdb.log.$date* /log/$date/avsdb/$c/          
 		scp root@$a:/arroyo/log/protocoltiming.log.$date* /log/$date/protocoltiming/$c/          
 		scp root@$a:/arroyo/log/c2k.log.$date* /log/$date/c2k/$c/ 
 		 else     
 		 	echo "remote server $c is unavailable"  >>  /script/logcapture/problemserver.log
 		 fi
 done
