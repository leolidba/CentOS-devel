#
# With CentOS-6.5-Minimal-x86_64
# CentOS release 6.5 (Final)

cat /etc/centos-release 
yum install ntp -y
chkconfig ntpd on

#
# Disable SELinux
#

getenforce # if returning "disabled" or "permissive" then no need to setenforce 0
# cat /etc/sysconfig/selinux |grep SELINUX=

# Temporarily disable
# setenforce 0
# getenforce

# Or disable permanently
# vi /etc/sysconfig/selinux 
sed -e 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config > tmp___ && mv tmp___ /etc/selinux/config

#
# Disalbe iptables if needed
#
#chkconfig iptables off
#service iptables stop
 

#
# Install pbis
#
rpm --import http://repo.pbis.beyondtrust.com/yum/RPM-GPG-KEY-pbis
wget -O /etc/yum.repos.d/pbiso.repo http://repo.pbis.beyondtrust.com/yum/pbiso.repo

yum clean all
yum install pbis-open

#/opt/pbis/bin/domainjoin-cli 
#    join [--assumeDefaultDomain {yes|no}] [--userDomainPrefix <short domain name>] [--ou <organizationalUnit>] <domain name>
#    join [--ou <organizationalUnit>] --details <module> <domain name> [user name] [password]
# 
SERVER_NAME='< SERVER NAME >'
OU='< oranizationalUnit >'
DOMAIN_NAME='< DomainName >'
ADMIN_USER='< ADMIN USER >'
ADMIN_PASS='< ADMIN PASSWD >'
USER_DOMAIN_PREFIX='< userDomainPrefix >'
# JOIN the Domain 

/opt/pbis/bin/domainjoin-cli setname $SERVER_NAME
/opt/pbis/bin/domainjoin-cli join --ou $OU $DOMAIN_NAME $ADMIN_USER $ADMIN_PASS  
# Sample output
#Warning: System restart required
#Your system has been configured to authenticate to Active Directory for the
#first time.  It is recommended that you restart your system to ensure that all
#applications recognize the new settings.

#SUCCESS

cp /opt/pbis/bin/update-dns /etc/cron.d/.

#reboot
#Set this value again if rebooted
#USER_DOMAIN_PREFIX='< userDomainPrefix >'

### TBD
#/opt/pbis/bin/config AssumeDefaultDomain true
#/opt/pbis/bin/config UserDomainPrefix $USER_DOMAIN_PREFIX
#/opt/pbis/bin/config LoginShellTemplate /bin/bash

