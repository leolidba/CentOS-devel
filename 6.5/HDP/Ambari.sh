# References: 
# https://cwiki.apache.org/confluence/display/AMBARI/Build+and+install+Ambari+2.2.0+from+Source

wget http://www.apache.org/dist/ambari/ambari-2.2.0/apache-ambari-2.2.0-src.tar.gz
tar xfvz apache-ambari-2.2.0-src.tar.gz
cd apache-ambari-2.2.0-src
mvn versions:set -DnewVersion=2.2.0.1

pushd ambari-metrics
mvn versions:set -DnewVersion=2.2.0.1
popd

wget http://pypi.python.org/packages/2.6/s/setuptools/setuptools-0.6c11-py2.6.egg#md5=bfa92100bd772d5a213eedd356d64086
# /etc/environment

mvn -B clean install package rpm:rpm -DnewVersion=2.2.0 -DskipTests -Dpython.ver="python >= 2.6"

