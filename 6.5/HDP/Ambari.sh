# References: 
# https://cwiki.apache.org/confluence/display/AMBARI/Build+and+install+Ambari+2.2.0+from+Source
# https://cwiki.apache.org/confluence/display/AMBARI/Ambari+Development

# setuptools
wget http://pypi.python.org/packages/2.6/s/setuptools/setuptools-0.6c11-py2.6.egg#md5=bfa92100bd772d5a213eedd356d64086
sh setuptools-0.6c11-py2.6.egg

# nodejs v0.10.40 
wget https://nodejs.org/download/release/v0.10.40/node-v0.10.40-linux-x64.tar.gz
tar zxvf node-v0.10.40-linux-x64.tar.gz
mv node-v0.10.40-linux-x64 /usr/lib/
ln -s /usr/lib/node-v0.10.40-linux-x64 /usr/lib/node

# set /etc/profile.d/node.sh
echo '#!/bin/bash
NODE_HOME=/usr/lib/node
PATH=$NODE_HOME/bin:$PATH
export PATH NODE_HOME
export CLASSPATH=.
' > /etc/profile.d/node.sh

source /etc/profile.d/node.sh

# brunch
npm install -g brunch@1.7.20

# To be added to ~/.bashrc or /etc/profile.d/java.sh
export _JAVA_OPTIONS="-Xmx2048m -XX:MaxPermSize=512m -Djava.awt.headless=true"

#
git clone https://git-wip-us.apache.org/repos/asf/ambari.git
pushd ambari
#mvn clean test
#mvn clean install
AMBARI_VERSION=2.2.1.0
mvn versions:set -DnewVersion=${AMBARI_VERSION}
pushd ambari-metrics
mvn versions:set -DnewVersion=${AMBARI_VERSION}
popd
 
#### TODO # https://cwiki.apache.org/confluence/display/AMBARI/Ambari+Development

mvn -B clean install package rpm:rpm -DskipTests -Dpython.ver="python >= 2.6" -Preplaceurl

popd


# /etc/environment
# http_proxy=....


