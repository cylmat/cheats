# TEST

```
systemctl status
systemctl list-jobs
systemd-analyze blame
systemd-analyze critical-chain 

(sudo systemctl disable docker) 
systemctl cat docker.service
sudo systemctl edit docker
     - Restart=on-failure
     - After=docker.socket firewalld.service containerd.service time-set.target
(remove network-online.target)


systemctl daemon-reload
systemctl restart docker.service
```
