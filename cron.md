# Cron
apt-get install -y cron

## usage
* (add command to crontab)
    + crontab -l | { cat; echo "*/1 * * * * <my_shell_command> } | crontab -
* service cron start

## edit
crontab -e

## check
grep CRON /var/log/syslog
