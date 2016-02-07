yum install rpm
which scp curl wget unzip chkconfig tar
yum repolist
yum install yum-utils createrepo reposync

yum install  ant asciidoc cyrus-sasl-devel cyrus-sasl-gssapi gcc gcc-c++ krb5-devel 
yum install  libtidy libxml2-devel libxslt-devel make 
yum install  mysql mysql-devel 
yum install  openldap-devel python-devel sqlite-devel openssl-devel  gmp-devel


yum install java-1.7.0-openjdk-devel.x86_64

echo '#!/bin/bash
JAVA_HOME=/etc/alternatives/java_sdk_openjdk
PATH=$JAVA_HOME/bin:$PATH
export PATH JAVA_HOME
export CLASSPATH=.
' > /etc/profile.d/java.sh 

source /etc/profile.d/java.sh 

-- Install MVN 3.0.5
wget http://archive.apache.org/dist/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
tar zxvf apache-maven-3.0.5-bin.tar.gz
mv apache-maven-3.0.5 /usr/lib/
rm /usr/lib/maven
ln -s /usr/lib/apache-maven-3.0.5 /usr/lib/maven
mvn --version

OR
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
yum install apache-maven
ls /usr/share/apache-maven
ln -s /usr/share/apache-maven /usr/lib/maven

echo '#!/bin/bash
MAVEN_HOME=/usr/lib/maven
PATH=$MAVEN_HOME/bin:$PATH
export PATH MAVEN_HOME
export CLASSPATH=.' > /etc/profile.d/maven.sh

source /etc/profile.d/maven.sh





