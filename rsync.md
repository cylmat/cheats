Rsync
=====
apt-get install -y cron rsync

## usage
rsync -auv <my_dir>/ <target_dir> >> /var/log/cron.log 2>&1";

## copy hidden files
rsync -avzP <dir>/.[^.]* <target_dir>

Samples
-------

### sample with cron
crontab -l | { cat; echo "*/1 * * * * rsync -auv dir/ dir >> /var/log/cron.log 2>&1"; } | crontab -
service cron start
