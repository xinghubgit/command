#!/usr/bin/env bash

bin/kafka-topics.sh --zookeeper 192.168.250.203:2181,192.168.250.204:2181,192.168.250.205:2181 --create --topic qa_nlpsvc_news_topic --partitions 1 --replication-factor 2
bin/kafka-console-producer.sh --broker-list 192.168.250.203:9092,192.168.250.204:9092,192.168.250.205:9092 --topic dev_nlpsvc_news_topic
kafka-console-consumer.sh --zookeeper 192.168.250.203:2181,192.168.250.204:2181,192.168.250.205:2181 --topic dev_nlpsvc_news_topic

*********************************************
Windows
*********************************************
.\bin\windows\kafka-server-start.bat .\config\server.properties
kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic hellocs
kafka-console-producer.bat --broker-list localhost:9092 --topic hellocs
kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic hellocs --from-beginning
