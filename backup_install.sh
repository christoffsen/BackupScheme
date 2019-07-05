#!/bin/bash
echo "Please enter username: "
read -r username

sudo crontab -u root -l >> /tmp/user_crontab
echo "30 23 * * * /home/\"$username\"/backup_script/backup_exec.sh" >> /tmp/user_crontab
sudo crontab -u root /tmp/user_crontab

sudo mkdir /home/"$username"/backup_script
cp ./backup_exec.sh /home/"$username"/backup_script
cp ./backup-list /home/"$username"/backup_script
sudo mkdir /backup
sudo chmod 777 /backup