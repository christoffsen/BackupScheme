#!/bin/bash
cd ~/backup_script || exit
sudo rsync --archive --no-perms --no-owner --no-group --verbose --compress --include-from='./backup-list' --exclude='*' --exclude='~/backup_script' --recursive / /backup
date_f=`date +%d_%m_%Y`".tar.gz"
cd /backup || exit
sudo tar --verbose --gzip --create --file=/backup/$date_f --exclude="*.tar.gz" ./***
cd /backup || exit
cp ./$date_f ~/backup_script
cd /backup || exit
sudo rm -r -f *