#https://cwiki.apache.org/confluence/display/AMBARI/Install+Ambari+2.2.0+from+Public+Repositories

wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.0.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

yum install ambari-server

#https://dev.mysql.com/get/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.4-1.el6.x86_64.rpm
#wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.0.8.tar.gz

#yum update mysql-community-release
yum install mysql-connector-java
# /usr/share/java/mysql-connector-java.jar 


ambari-server setup

# choose mysql
ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java.jar
# File copied to /var/lib/ambari-server/resources

ambari-server start
echo browse via http://`hostname`:8080


# /etc/ambari-server/conf/ambari.properties
# /etc/ambari-server/conf
# /etc/ambari-agent/conf/ambari-agent.ini
# /etc/ambari-server/conf/password.dat
# /usr/lib/python2.6/site-packages/ambari_server/bootstrap.py


# /etc/ambari-agent/conf
# /etc/ambari-agent/conf/ambari-agent.ini

# /var/lib/ambari-server
# /var/lib/ambari-agent/tmp

#  /var/log/ambari-agent/ambari-agent.log
#  /var/log/ambari-server/ambari-server.out 
