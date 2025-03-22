## SHA

```
export SHA512=$(curl https://archive.sha512 | cut -d' ' -f 1)  
echo "${SHA512} archive.bin" | sha512sum --check
```

### SSH

```
eval `ssh-agent -s`  
ssh-add ~/.ssh/id_rsa 

apt-get update && apt-get install -y openssh-server && systemctl enable ssh && echo 'root' > /pass
ssh-keygen -t rsa -f /root/.ssh/id_rsa -P ''
sshpass -f /pass ssh-copy-id -i ~/.ssh/id_rsa user@host
```
