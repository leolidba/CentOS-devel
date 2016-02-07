
# Reference: https://github.com/cloudera/hue
git clone https://github.com/cloudera/hue.git
cd hue
make apps
# Make changes if needed on file  ./maven/pom.xml
## 196,197c196
#<       <!-- url>https://repository.cloudera.com/content/groups/cdh-releases-rcs</url-->
#<       <url>http://repository.cloudera.com/cloudera/cdh-releases-rcs</url>
#---
#>       <url>https://repository.cloudera.com/content/groups/cdh-releases-rcs</url>
#205,206c204
#<       <!--url>https://repository.cloudera.com/content/repositories/snapshots</url -->
#<       <url>http://repository.cloudera.com/cloudera/libs-snapshot-local/</url>
##
##

# To run  http://localhost:8000
#           build/env/bin/hue runserver
#The configuration file in development mode is desktop/conf/pseudo-distributed.ini.

groupadd hue
useradd hue -g hue

chown hue:hue . -R

build/env/bin/hue config_help

# Config hue.ini

# For prodcution server
build/env/bin/supervisor


