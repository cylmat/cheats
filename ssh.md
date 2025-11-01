### SSH

```
sudo apt install ssh
sudo vi /etc/ssh/sshd_config   #   port 22000
sudo service ssh restart
```

### keygen

```
eval `ssh-agent -s`  
ssh-add ~/.ssh/id_rsa 

apt-get update && apt-get install -y openssh-server && systemctl enable ssh && echo 'root' > /pass
ssh-keygen -t rsa -f /root/.ssh/id_rsa -P ''
sshpass -f /pass ssh-copy-id -i ~/.ssh/id_rsa user@host
```
