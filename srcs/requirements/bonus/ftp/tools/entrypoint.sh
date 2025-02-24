#!/bin/sh

mkdir -p /etc/vsftpd

mkdir -p /var/run/vsftpd/empty

adduser --disabled-password --gecos "" $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd


echo "$FTP_USER" >> /etc/vsftpd/user_list



mkdir -p /var/www/html

chown -R $FTP_USER:$FTP_USER /var/www/html



exec /usr/sbin/vsftpd /etc/vsftpd.conf


