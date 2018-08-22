# !/bin/sh
# 23:59 every day compress photo
# crontab: 59 23 * * * sh /home/ben/app/DjangoApps/photo/shell/backup-photos.sh
tar -zcvf "/home/ben/app/DjangoApps/photo/media/photo-$(date +"%Y-%m-%d").tar.gz" /home/ben/app/DjangoApps/photo/media/photo
