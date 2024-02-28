@https://www.hostinger.com/tutorials/linux-commands   

### DIR

```sh
mkdir -pm o=,ug=rwx mydir
```

### DISK space

du -sh /var   

### ROOT / SUDO

@https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-fr  

```
visudo  
sudo cat /etc/sudoers  
```

### RSYNC

* -(a)rchive -(z)compress -(e)remote  
rsync -av -e 'ssh -p 22000' localhost:src_old_machine_file dst_new_machine_file

### ZIP

*  -(r)ecursive -(v)erbose 
zip -rv archive.zip mydir/
