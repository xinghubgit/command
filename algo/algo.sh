#!/usr/bin/env bash
docker run --name event_entity -d -p 28385:28191 \
-v /app/services/executor-service/algo_svc_config/application-qa.ini:/app/chinascope/services/executor-node/conf/application-local.ini \
-v /app/shuku/logs/nlp-node/event_entity:/app/chinascope/services/executor-node/logs \
192.168.250.121:6000/csf/algorithm/event_entity:v0.5.6.40 -a event_entity -P 28385 -h 192.168.250.212


docker run --name event_entity -d -p 28575:28191 \
-v /app/docker/db/dict.db:/app/docker/db/dict.db \
-v /app/docker/algorithm_config/application-prod.ini:/app/chinascope/services/executor-node/conf/application-local.ini \
-v /app/docker/logs/nlp-node/event_entity:/app/chinascope/services/executor-node/logs \
--restart=always algorithm/event_entity:v0.5.6.40 -a event_entity -h 172.31.2.132 -P 28575


