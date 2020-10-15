#!/usr/bin/env bash

*********************************************
mvn
*********************************************
mvn clean package assembly:single -Dprofile=dev
mvn versions:set -DnewVersion=0.22.0-SNAPSHOT
mvn versions:commit

mvn package assembly:single -Dprofile=dev -DskipTests -DdbType=mysql dockerfile:build dockerfile:push

#下载所有pom依赖包的source

mvn dependency:resolve -Dclassifier=sources
#下载指定依赖包的source：其中guava为ArtifactIdcd
mvn dependency:sources -DincludeArtifactIds=guava

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

Heap dump can be taken in two ways:
-XX:+HeapDumpOnOutOfMemoryError   -XX:HeapDumpPath=path
jmap -dump:format=b,file=heap.bin $pid

MAT
https://medium.com/@chrishantha/basic-concepts-of-java-heap-dump-analysis-with-mat-e3615fd79eb

*********************************************
Excel
*********************************************
="UPDATE hq_index SET open="&H155&",high="&I155&",low="&J155&" WHERE dt='2020-04-20' AND tick='"&F155&"' ;"
('"&A2&"','"&B2&"','"&C2&"','"&TEXT(D2,"yyyy/mm/dd")&"',"&E2&");
