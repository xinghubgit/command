#!/usr/bin/env bash

# 统计算法的数量
docker ps | awk '{print  $2}' | grep -E  -v 'proxy|csf-ana|ID|tensor|scraping|portainer'  | awk '{s[$1] += 1} END {for(i in s) {print i "\t " s[i]}}' | sort -t ' ' -k 2 | awk '{printf "%-70s%-10s\n", $1, $2}'

# docker 内存统计
docker stats --no-stream |grep -E  -v 'inews|ID|proxy|report|nobagging'  | awk '{print $2 "\t" $4}'  | sed 's/MiB/ MiB/g' |sed 's/GiB/ GiB/g'  | awk '{print $1 ":" $2 ":" $3}' | sort -t ':' -k 3 -r | awk -F':' '{print $1 "\t" $2 "\t" $3}'

*********************************************
Docker
*********************************************
#attach into a stopped container
#1.Find the stopped container
#2.commit the stopped container:This command saves modified container state into a new image user/test_image
#3.Start/run with a different entry point:
#https://github.com/docker/docker/issues/18078
# https://docs.docker.com/engine/reference/run/#/entrypoint-default-command-to-execute-at-runtime
docker ps -a
docker commit gs-data-svc user/test_image
docker run -ti --entrypoint=sh user/test_image


#docker log timezone
#Dockerfile
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#create container
-v /etc/timezone:/etc/timezone -v /etc/localtime:/etc/localtime
#cp
docker cp /etc/localtime [容器ID或者NAME]:/etc/localtime

export TZ=$(grep -rl '/usr/share/zoneinfo/' -e $(cat /etc/localtime | tail -1) | tail -1 | cut -d/ -f6-)

#192.168.250.212长度
docker run --name match_industry-citic -d -p 28521:28191 -v /app/services/executor-service/algo_svc_config/application-qa.ini:/app/chinascope/services/executor-node/conf/application-local.ini -v /app/services/executor-service/algo_svc_config/match_industry_citic.config.ini:/app/chinascope/services/match_industry/config/match_industry.config.ini -v /app/services/executor-service/algo_svc_config/db-entity-schema-sywg-citic.xml:/app/chinascope/services/executor-node/conf/db-entity-schema.xml -v /app/shuku/logs/nlp-node/match_industry-citic:/app/chinascope/services/executor-node/logs 192.168.250.121:6000/csf/algorithm/match_industry:v0.5.6.24 -a match_industry-citic -P 28521 -h 192.168.250.212

# 122.144.133.59
docker run --name match_industry-citic -d -p 28521:28191 -v /app/services/executor-service/algo_svc_config/application-prod-sw.ini:/app/chinascope/services/executor-node/conf/application-local.ini -v /app/services/executor-service/algo_svc_config/match_industry_citic.config.ini:/app/chinascope/services/match_industry/config/match_industry.config.ini -v /app/services/executor-service/algo_svc_config/db-entity-schema-sw.xml:/app/chinascope/services/executor-node/conf/db-entity-schema.xml -v /app/shuku/logs/nlp-node/match_industry-citic:/app/chinascope/services/executor-node/logs 116.228.220.198:17088/csf/algorithm/match_industry:v0.5.6.24 -a match_industry-citic -P 28521 -h 192.168.251.59

docker run --name csf-analysis-svc-pingan -d -p 28081:8081 \
-v /root/s3_packages/deploy_all/services/csf-analysis-svc/application-prod.properties:/app/service/nlpsvc-service/env_conf/application-local.properties \
-v /app/services/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs \
   192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.19.1-mysql \
-p 8081 -e local -s false -m true

*********************************************
apk
*********************************************
https://www.programmersought.com/article/18483605783/

cd /etc/apk && vi repositories
http://mirrors.aliyun.com/alpine/v3.8/main/
http://mirrors.aliyun.com/alpine/v3.8/community/

apk update
apk add openjdk8
cd /usr/lib/jvm/java-1.8-openjdk/bin


docker cp sa-jdi.jar  449f:/usr/lib/jvm/java-1.8-openjdk/jre


