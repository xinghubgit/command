#!/usr/bin/env bash

*********************************************
*分析服务部署
*********************************************
--无需验证

docker run --name csf-analysis-svc-21 -d -p 9081:8081  \
-v /app/docker/config/csf-analysis-svc/application-mysql.properties:/app/service/nlpsvc-service/env_conf/application-local.properties \
-v /app/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs \
--restart=always 192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.22.4--mysql   -e local -p 8081  -s false -m true


docker run --name csf-analysis-svc-22-4 -d --cpus=2 -m 1G --memory-swap 2G  -e ENV=pro_idc --restart=always -p 9081:8081 \
 -v /app/docker/logs/csf-analysis-svc/logs:/app/svc/logs \
116.228.220.198:17088/csf/svc/csf-analysis-svc:v0.22.4-mysql  -e pro_idc -l /app/svc/logs -p 8081


部署--CSF
docker run --name csf-analysis-cluster -d -e ENV=dev --restart=always -p 9082:8080 \
-v /app/logs/nlpsvc/logs:/app/svc/logs \
192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.21.5-mysql -e dev -l /app/svc/logs -n mysql


*********************************************
*验证
*********************************************
curl -X POST -H "Content-Type=application/x-www-form-urlencoded" -F 'username=crawler_qa'        -F 'password=crawler_Q9!^$' http://192.168.250.212:9081/csf/nlp-news/public/users/login

curl -XPOST  -H "Content-Type: application/json"  -d '{"buCode":"NCB_SH","newsIds":[24827555]}'  http://internal-riskscope-trust-service-http-1638965482.cn-north-1.elb.amazonaws.com.cn:30070/es/news

curl -XPOST  -H "Content-Type: application/json"  -d '{"rsTypes":[]}'  http://internal-riskscope-trust-service-http-1638965482.cn-north-1.elb.amazonaws.com.cn:30040/kg/query/company/CSF0000003421/relevance


curl -X POST  "http://192.168.250.213:9081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Authorization=Bearer eyJhbGciOiJIUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAKtWyiwuVrJSSi5O083LKSguS1bSUcpMLFGyMjS1NLQwMzQ0MNZRSq0ogAmYmIMESotTi_ISc1NBOosSy3NSi-ILE5VqAVqsT_ROAAAA.XwX2ErU2rJPYqp4rl59hNbqPQcU2mJJCT17NC-BAr2I" -d @news.json

curl -X POST  "http://192.168.250.213:9081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAAAKtWyiwuVrJSSi5O083LKSguS1bSUcpMLFGyMjS1NLQwMzQ0MNZRSq0ogAmYmIMESotTi_ISc1NBOosSy3NSi-ILE5VqAVqsT_ROAAAA.XwX2ErU2rJPYqp4rl59hNbqPQcU2mJJCT17NC-BAr2I" -d @news.json

curl -X POST  "http://192.168.250.213:9081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Content-Type: application/json" -H @token -d @news.json
curl -X POST  "http://localhost:8081/csf/nlp-news/api/v1/nlp/adhoc-analysis" -H "Content-Type: application/json" -H "$(cat token)" -d @news.json




docker run --name csf-analysis-svc-21.1 -d -p 9081:8081 -v /app/logs/nlpsvc/logs:/app/service/nlpsvc-service/logs --restart=always 192.168.250.121:6000/csf/svc/csf-analysis-svc:v0.21.1-SNAPSHOT-oracle  -e local -p 8081  -s false -m true


curl -X POST -H "Content-Type=application/x-www-form-urlencoded" -F 'username=xy_invest_api_test' -F 'password=MW5gb8Si'      http://localhost:8081/csf/nlp-news/public/users/login
username:xy_invest_api_test
pasword:MW5gb8Si


redis-cli  -h 192.168.250.204 -p 7379 --scan --pattern qa:nlpsvc-gov-news-local:news* | xargs -L 1 redis-cli -h 192.168.250.204 -p 7379 del
redis-cli  -h 192.168.250.204 -p 7380 --scan --pattern qa:nlpsvc-gov-news-local:news* | xargs -L 1 redis-cli -h 192.168.250.204 -p 7380 del



###算法耗时分析

cat nlpsvc.log  | grep takes | grep 'analysis object' | awk '{print $10 ":" $14 ":" $15 ":" $16}' | sort | grep -v ':0:ms' > ~/algo_take
cd;cat algo_take  | sed 's/\[//g' | sed 's/\]//g' | awk -F:  '{print $1 " " $3}' > algo_cost
awk '{s[$1] += $2 ; count[$1] += 1}END{ for(i in s) {print i, count[i], s[i]/count[i]}}' algo_cost | sort -t ' ' -k 3 -h |  awk '{printf "%-30s %-10s %-10s\n", $1, $2, $3}'

文件合并
awk 'NR==FNR{a[$1]=$0;next}NR>FNR{if($1 in a)print a[$1],$2,$3}' file1.txt file2.txt > file3.txt

head  -500 nlpsvc.log  | grep 'finish analysis news'  | awk -F' ' '{print $1 " " $9}' | sed 's/\.[0-9][0-9][0-9]//g' |  sed 's/news\[\(.*\)\]/\1/g'

cat  nlpsvc.log  | grep 'finish analysis news'  | awk '{print $1 " " $9}' | sed 's/\.[0-9][0-9][0-9]//g' |  sed 's/news\[\(.*\)\]/\1/g' | awk '{s[$1] += 1}END {for (i in s) {print i, s[i]}}' | awk '{sum += $2}END{print "Average=", sum/NR}'








