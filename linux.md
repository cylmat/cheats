@https://www.hostinger.com/tutorials/linux-commands   

```
"unix: do one thing, and do it well"
```

### BASE 64

echo '613f892e-953c-418a-9aed-73100d9f6d30' | base64  
echo 'YWZjNDRjZjctZGMzYy00MzNkLTg1YjItYzEwODU1ZTI4MDM1' | base64 -d  

### Checksum

```
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

### DISK space

du -sh /var   

### MKDIR

```sh
mkdir -p -m o=,ug=rwx alphadir   
(drwxrwx--- alphadir)
```

### ROOT / SUDO

@https://doc.ubuntu-fr.org/sudoers  
@https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-fr  

```
# run as user "nginx"
su nginx -run /bin/sh -c "cache:invalidate"
```

```
visudo  
sudo cat /etc/sudoers  
```

### RSYNC

* -(a)rchive -(z)compress -(e)remote  
rsync -av -e 'ssh -p 22000' localhost:src_old_machine_file dst_new_machine_file

### USER

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R   
sudo chmod g+rwx "$HOME/.docker" -R
sudo usermod -aG docker $USER

gpasswd -a $USER docker

### ZIP

*  -(r)ecursive -(v)erbose   
zip -rv archive.zip mydir/
