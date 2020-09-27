#!/usr/bin/env bash

alias dp='docker ps'
alias di='docker inspect'
alias cdnlp='cd /app/logs/nlpsvc/logs'

*********************************************
mvn
*********************************************
mvn clean package assembly:single -Dprofile=dev
mvn versions:set -DnewVersion=1.6.1-SNAPSHOT
mvn versions:commit

mvn package assembly:single -Dprofile=qa -DskipTests -DdbType=mysql dockerfile:build dockerfile:push

#下载所有pom依赖包的source

mvn dependency:resolve -Dclassifier=sources
#下载指定依赖包的source：其中guava为ArtifactIdcd
mvn dependency:sources -DincludeArtifactIds=guava

CSF0000000001
*********************************************
Linux
*********************************************
# 查看物理CPU个数
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即核数)
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数
cat /proc/cpuinfo| grep "processor"| wc -l

# 选取aaa的进行求和
awk '/aaa/ {sum += $2};END {print sum}' test

curl -H "Content-Type:application/json" -X POST --data '{"message": "sunshine"}'
curl -H "Content-Type:application/json" -H "userName:allen.jin"   http://localhost:10090/sam_mgt/client/product/updated-info
curl -i "http://192.168.251.11:28089/webui/heat?labelType=3"
curl -X POST -H "Content-Type: application/json" -d @news.json http://192.168.250.111:8081/csf/nlp-news/api/v1/nlp/adhoc-analysis

for i  in $(ls nlpsvc.log*); do unzip $i; done

#a.txt
#1,a
#2,a
#3,b

#b.txt
#a,100
#b,100
#c,500

#output
#1,100
#2,100
#3,500
awk  'BEGIN{FS=OFS=","}NR==FNR{a[$1]=$2}NR>FNR{print $1,a[$2]}' b.txt a.txt

# empty line
sed '/^[[:space:]]*$/d'

#!/bin/bash

while IFS= read -r line; do
  echo "tester: $line"
done < "$1"

*********************************************
Redis
*********************************************
redis-cli  -h 192.168.250.205 -p 7379 --scan --pattern qa:nlpsvc-gov-news-local:news* | xargs -L 1 redis-cli -h 192.168.250.205 -p 7379 del
redis-cli --scan | while read LINE ; do TTL=`redis-cli ttl "$LINE"`; if [ $TTL -eq  -1 ]; then echo "$LINE"; fi; done;
redis-cli  -h 192.168.250.204 -p 7379 --scan --pattern qa:nlpsvc-fund:news* | xargs -L 1 redis-cli -h 192.168.250.204 -p 7379 del
redis-cli --scan --pattern users:* | \
awk -v cmd_template="expire __key__ 1000" '/^/ {cmd=cmd_template; gsub(/__key__/, $1, cmd); split(cmd, cmdargs," "); printf "*" length(cmdargs) "\r\n"; for(i=1; i<=length(cmdargs); i++) {printf "$" length(cmdargs[i]) "\r\n" cmdargs[i] "\r\n" }};' | \
redis-cli --pipe

EVAL "return redis.call('del', unpack(redis.call('keys', ARGV[1])))" 0 prefix:[YOUR_PREFIX e.g delete_me_*]

EVAL "local keys = redis.call('keys', ARGV[1]) \n for i=1,#keys,5000 do \n redis.call('del', unpack(keys, i, math.min(i+4999, #keys))) \n end \n return keys" 0 prefix:

*********************************************
JVM  Analyse
*********************************************
#Analyse Thread Dump File
awk '{ print $1 }' 64153-stack-gc.log | grep '"' | sort | awk '{print substr($0,0,13)}' | uniq -c | sort -nr > sort-threadnames.log

pstack 64153
jstack -l 64153
#gc log:每5000ms打印一次，打印10次；每隔3行打印标题
jstat -gc -h3 64153 5000 10
-XX:+PrintGCDetails  -XX:+PrintGCTimeStamps

java -XX:+PrintFlagsFinal -version

*********************************************
Excel
*********************************************
="UPDATE hq_index SET open="&H155&",high="&I155&",low="&J155&" WHERE dt='2020-04-20' AND tick='"&F155&"' ;"
('"&A2&"','"&B2&"','"&C2&"','"&TEXT(D2,"yyyy/mm/dd")&"',"&E2&");


<script src="https://gist.github.com/simonista/8703722.js"></script>
