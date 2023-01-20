#!/bin/bash
yum update -y
yum install -y git httpd
systemctl enable --now httpd
cd /root/
git clone https://github.com/jofernando/compass-pb-atv-2.git
cp compass-pb-atv-2/etc/crontab /etc/crontab