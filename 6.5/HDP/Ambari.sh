# References: 
# https://cwiki.apache.org/confluence/display/AMBARI/Build+and+install+Ambari+2.2.0+from+Source


wget http://pypi.python.org/packages/2.6/s/setuptools/setuptools-0.6c11-py2.6.egg#md5=bfa92100bd772d5a213eedd356d64086
sh setuptools-0.6c11-py2.6.egg
wget https://nodejs.org/download/release/v0.10.40/node-v0.10.40-linux-x64.tar.gz
tar zxvf node-v0.10.40-linux-x64.tar.gz
mv node-v0.10.40-linux-x64 /usr/lib/
ln -s /usr/lib/node-v0.10.40-linux-x64 /usr/lib/node

echo '#!/bin/bash
NODE_HOME=/usr/lib/node
PATH=$NODE_HOME/bin:$PATH
export PATH NODE_HOME
export CLASSPATH=.
' > /etc/profile.d/node.sh

source /etc/profile.d/node.sh

npm install -g brunch@1.7.20


wget http://www.apache.org/dist/ambari/ambari-2.2.0/apache-ambari-2.2.0-src.tar.gz
tar xfvz apache-ambari-2.2.0-src.tar.gz
cd apache-ambari-2.2.0-src
mvn versions:set -DnewVersion=2.2.0.1

pushd ambari-metrics
mvn versions:set -DnewVersion=2.2.0.1
popd

# /etc/environment

wget https://nodejs.org/download/release/v0.10.40/node-v0.10.40-linux-x64.tar.gz

mvn -B clean install package rpm:rpm -DnewVersion=2.2.0 -DskipTests -Dpython.ver="python >= 2.6"

