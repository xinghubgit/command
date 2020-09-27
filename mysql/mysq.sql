
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

