#https://downloads.mariadb.org/mariadb/repositories/#mirror=digitalocean-nyc&distro=CentOS&distro_release=centos6-amd64--centos6&version=10.1
echo '# MariaDB 10.1 CentOS repository list - created 2016-02-08 08:22 UTC
# http://mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos6-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' > /etc/yum.repos.d/mariadb.repo

yum install MariaDB-server MariaDB-client
service mysql start
chkconfig mysql on


mysql_secure_installation
