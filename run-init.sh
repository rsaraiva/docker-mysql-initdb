/usr/sbin/mysqld & sleep 10

cat /tmp/init.sql | mysql
echo "done!" >> /tmp/run-init.log
