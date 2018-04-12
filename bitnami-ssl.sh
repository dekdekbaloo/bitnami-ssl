#!/bin/sh
domain_name=$1

echo $domain_name

echo "Stopping all services"
sudo /opt/bitnami/ctlscript.sh stop

echo "Retrieving a new certificate for $domain_name"
sudo certbot certonly --standalone -d $domain_name

echo "Linking certificate files"
rm /opt/bitnami/apache2/conf/server.crt
rm /opt/bitnami/apache2/conf/server.key
sudo ln -s /etc/letsencrypt/live/$domain_name/fullchain.pem server.key
sudo ln -s /etc/letsencrypt/live/$domain_name/privkey.pem server.key

echo "Setting up crontab for automated renewal"
crontab -l > current_cron.tmp
echo "24  0 * * * sudo certbot renew" >> current_cron.tmp
echo "16 12 * * * sudo certbot renew" >> current_cron.tmp
crontab current_cron.tmp
rm current_cron.tmp
