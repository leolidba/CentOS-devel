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


-- Install MVN
