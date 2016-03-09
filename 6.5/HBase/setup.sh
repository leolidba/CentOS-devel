

#Start the HBase Thrift API:
#/usr/bin/hbase thrift start

#Starting the HBase REST API
#/usr/hdp/current/hbase-master/bin/hbase-daemon.sh start rest --infoport 8085

#Reference: 
#1. https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.3.0/bk_installing_manually_book/content/ref-2a6efe32-d0e1-4e84-9068-4361b8c36dc8.1.html

nohup /usr/bin/hbase thrift start > /var/log/hbase-thrift-start.log 2>& 1 &
