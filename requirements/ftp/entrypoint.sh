#!/bin/sh

mkdir -p /etc/vsftpd

mkdir -p /var/run/vsftpd/empty

adduser --disabled-password --gecos "" $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

## Add the user to the list of users allowed to use the ftp server
echo "$FTP_USER" >> /etc/vsftpd/user_list

# ## Set the home directory for the user in vsftpd.conf correctly
# sed -i "s|#local_root=/var/www/localhost/htdocs|local_root=/var/www/html|g" /etc/vsftpd/vsftpd.conf


mkdir -p /var/www/html

chown -R $FTP_USER:$FTP_USER /var/www/html



exec /usr/sbin/vsftpd /etc/vsftpd.conf


