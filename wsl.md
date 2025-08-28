# wsl

shrink place
```
 # https://stephenreescarter.net/how-to-shrink-a-wsl2-virtual-disk/
> wsl --shutdown
> diskpart
      - select vdisk file="C:\Users\rhc7\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79\LocalState\ext4.vhdx"
      - compact vdisk
```
