# !/bin/sh
# 23:59 every day compress photo
# crontab: 59 23 * * * sh /home/ben/app/DjangoApps/media/backup.sh 
tar -zcvf "/home/ben/app/DjangoApps/media/photo-$(date +"%Y-%m-%d").tar.gz" /home/ben/app/DjangoApps/media/photo
