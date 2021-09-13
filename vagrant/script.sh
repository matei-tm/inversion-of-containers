export CLEANHOSTNAME=$(hostname -s)
echo "Clean hostname is" $CLEANHOSTNAME
sed -i '' 's/localhost.my.domain/'$HOST' '$CLEANHOSTNAME'/' /etc/hosts
sed -i '' 's/127\.0\.1/#127\.0\.1/' /etc/hosts

pkg install -y apache24
echo -n "ServerName 127.0.0.1" >> /usr/local/etc/apache24/httpd.conf
sysrc apache24_enable="YES"
service apache24 start
service apache24 status