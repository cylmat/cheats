@https://www.hostinger.com/tutorials/linux-commands   

### DISK space

du -sh /var   

### MKDIR

```sh
mkdir -p -m o=,ug=rwx alphadir   
(drwxrwx--- alphadir)
```

### ROOT / SUDO

@https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-fr  

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

gpasswd -a $USER docker

### ZIP

*  -(r)ecursive -(v)erbose   
zip -rv archive.zip mydir/
