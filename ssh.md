### SSH

```
sudo apt install ssh
sudo vi /etc/ssh/sshd_config   #   port 22000
sudo service ssh restart

 or

apt-get update && apt-get install -y openssh-server
systemctl enable ssh
echo 'root' > /pass
```

### keygen

github
```
ssh-keygen -t ed25519 -C "your_email@example.com"
#   (to $HOME/.ssh/id_ed25519.github)
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519.github
ssh-copy-id -i ~/.ssh/id_ed25519.github.pub <user>@<host>
```

```
eval `ssh-agent -s`  
ssh-add $HOME/.ssh/id_rsa 

ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -P ''
sshpass -f /pass ssh-copy-id -i $HOME/.ssh/id_rsa user@host
```
