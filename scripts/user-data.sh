#!/bin/bash
yum update -y
yum install -y git httpd
systemctl enable --now httpd
cd /root/
git clone https://github.com/jofernando/compass-pb-atv-2.git
mkdir /nfs
cat compass-pb-atv-2/etc/fstab >> /etc/fstab
mount -a
mkdir /nfs/jose_fernando
/bin/cp -b compass-pb-atv-2/etc/crontab /etc/crontab
