#!/usr/bin/env bash

*********************************************
*分析服务
*********************************************
docker run --name csf-analysis-svc -d -p 8081:8081 -v /app/docker/config/csf-analysis-svc/application-prod.properties:/app/service/nlpsvc-service/env_conf/application-pro_aws.properties -v /app/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs 116.228.220.198:17088/csf/svc/csf-analysis-svc:v0.17.3-mysql pro_aws

curl -X POST -H "Content-Type=application/x-www-form-urlencoded" -F 'username=crawler_qa'        -F 'password=crawler_Q9!^$' http://192.168.250.212:9081/csf/nlp-news/public/users/login
curl -X POST -H "Content-Type=application/x-www-form-urlencoded" -F 'username=news_crawler_prod' -F 'password=crawler@nlp9345!7'      http://localhost:8081/csf/nlp-news/public/users/login

分析服务：
建表的数据库：jd-ai-mysql.csilcsoh66yg.rds.cn-north-1.amazonaws.com.cn:3306/news


curl -X POST  "http://192.168.250.213:9081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Authorization=Bearer eyJhbGciOiJIUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAKtWyiwuVrJSSi5O083LKSguS1bSUcpMLFGyMjS1NLQwMzQ0MNZRSq0ogAmYmIMESotTi_ISc1NBOosSy3NSi-ILE5VqAVqsT_ROAAAA.XwX2ErU2rJPYqp4rl59hNbqPQcU2mJJCT17NC-BAr2I" -d @news.json

curl -X POST  "http://192.168.250.213:9081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAKtWyiwuVrJSSi5O083LKSguS1bSUcpMLFGyMjS1NLQwMzQ0MNZRSq0ogAmYmIMESotTi_ISc1NBOosSy3NSi-ILE5VqAVqsT_ROAAAA.XwX2ErU2rJPYqp4rl59hNbqPQcU2mJJCT17NC-BAr2I" -d @news.json

curl -X POST  "http://192.168.250.213:9081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Content-Type: application/json" -H @token -d @news.json
curl -X POST  "http://localhost:8081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Content-Type: application/json" -H "$(cat token)" -d @news.json



docker run --name csf-analysis-svc-19 -d -p 8088:8081 -v /app/docker/config/csf-analysis-svc/application-prod.properties:/app/service/nlpsvc-service/env_conf/application-pro_aws.properties -v /app/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs 116.228.220.198:17088/csf/svc/csf-analysis-svc:v0.19.1-mysql -e pro_aws -p 8081 -s true







#docker run --name csf-analysis-svc-21 -d -p 9081:8081  -v /app/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs --restart=always 192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.21.0-oracle  -e local -p 8081  -s false -m true

docker run --name csf-analysis-svc-21 -d -p 9081:8081  -v /app/service/nlpsvc-service/local.properties:/app/service/nlpsvc-service/env_conf/application-local.properties -v /app/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs --restart=always 192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.21.1-oracle  -e dev -p 8081


docker run --name csf-analysis-svc-21.1 -d -p 9081:8081 -v /app/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs --restart=always 192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.21.1-SNAPSHOT-oracle  -e local -p 8081  -s false -m true

docker run --name csf-analysis-cluster -d -e ENV=dev --restart=always -p 9082:8080 \
-v /app/logs/nlpsvc/logs:/app/svc/logs \
192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.21.5-mysql -e dev -l /app/svc/logs -n mysql

# docker run --name csf-analysis-svc -d -p 8081:8081 -v /app/services/csf-analysis-svc/application-prod.properties:/app/service/nlpsvc-service/env_conf/application-local.properties -v /app/services/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs --restart=always svc/csf-analysis-svc: v0.19.1-mysql  -p 8081 -e local -s false -m true


curl -X POST -H "Content-Type=application/x-www-form-urlencoded" -F 'username=xy_invest_api_test' -F 'password=MW5gb8Si'      http://localhost:8081/csf/nlp-news/public/users/login
用户名：xy_invest_api_test
密码：MW5gb8Si


docker run --name csf-analysis-svc -d -p 8081:8081 -v /app/services/csf-analysis-svc/application-prod.properties:/app/service/nlpsvc-service/env_conf/application-local.properties -v /app/services/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs --restart=always svc/csf-analysis-svc:v0.21.0-oracle  -e local -p 8081  -s false -m true



docker run --name csf-analysis-svc-21.2 -d -p 9081:8081 \
-v /app/docker/config/csf-analysis-svc/application-prod.properties:/app/service/nlpsvc-service/env_conf/application-local.properties \
-v /app/services/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs \
--restart=always test-csf-analysis:oracle  -e local -p 8081  -s false -m true

redis-cli  -h 192.168.250.204 -p 7379 --scan --pattern qa:nlpsvc-gov-news-local:news* | xargs -L 1 redis-cli -h 192.168.250.204 -p 7379 del
redis-cli  -h 192.168.250.204 -p 7380 --scan --pattern qa:nlpsvc-gov-news-local:news* | xargs -L 1 redis-cli -h 192.168.250.204 -p 7380 del



###算法耗时分析



cat nlpsvc.log  | grep takes | grep 'analysis object' | awk '{print $10 ":" $14 ":" $15 ":" $16}' | sort | grep -v ':0:ms' > ~/algo_take
cd;cat algo_take  | sed 's/\[//g' | sed 's/\]//g' | awk -F:  '{print $1 " " $3}' > algo_cost
awk '{s[$1] += $2 ; count[$1] += 1}END{ for(i in s) {print i, count[i], s[i]/count[i]}}' algo_cost | sort -t ' ' -k 3 -h |  awk '{printf "%-30s %-10s %-10s\n", $1, $2, $3}'



//分组求和，以第一列为变量，将相同的第一列的数据进行累加打印出求和


文件合并
awk 'NR==FNR{a[$1]=$0;next}NR>FNR{if($1 in a)print a[$1],$2,$3}' file1.txt file2.txt > file3.txt



curl -o /path/to/local/file http://url.com
