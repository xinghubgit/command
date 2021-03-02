
mysqlimport -uroot -p news tmp_news_feed_id_3.txt --columns=news_id --local --verbose

--grant privilege
grant select,delete,update,insert on csf_order to java_team;
flush privileges;
create database xxx default charset utf8mb4;
create user `xxx`@`%` identified by "xxx";
grant select,insert,update,delete on `xxx`.* to `xxx`@`%`;
grant create,alter,drop,index on *.* to `xxx`@`%`;
flush privileges;
grant all privileges on *.* to xxxx;
mysqldump -uroot -p das a1 a2 a3 --no-data >xxx.sql


SHOW VARIABLES LIKE "secure_file_priv";

TABLE tableName
INTO OUTFILE 'path/outputFile.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY 'n';

SELECT * FROM myTable
INTO OUTFILE '\tmp\myExportFile.csv'
FIELDS ENCLOSED BY '"'
TERMINATED BY ';'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n';


INSERT INTO risk_sub_org_info (org,bu_code,recipient,reply_to,logo_url,cru,crt,upu,upt) VALUES
(NULL,'NCB_SZ','wenxin@ncbchina.cn','wenxin@ncbchina.cn',NULL,'241','2020-10-14 09:56:18','241','2020-10-14 10:38:25')
,(NULL,'NCB_SH','caiyiqing@ncbchina.cn','zhangshun@ncbchina.cn',NULL,'240','2020-10-15 14:51:31','240','2020-10-19 13:47:30')
;


elasticdump \
  --input=http://192.168.250.213:9200/analysis_news_v1 \
  --output=/root/allen/news_mapping.json \
  --type=mapping


elasticdump \
  --input=http://192.168.250.213:9200/analysis_news_v1 \
  --output=/root/allen/news_data.json \
  --type=data \
  --size=10000 \
  --headers='{"Content-Type": "application/json"}'



elasticdump \
--bulk=true \
--input="/root/allen/news_data.json" \
--output=http://192.168.250.213:9200/news_allen_test


