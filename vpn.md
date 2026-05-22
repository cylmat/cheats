```

wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb

sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update

echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -

sudo apt install -y proton-vpn-gnome-desktop

sudo apt install -y gnome-shell-extension-appindicator

# echo "PROTON.repo.protonvpn.com-Cf!M#CAS9apODkFn.deb" | base64 | sha256sum
# echo "tmp._hEt8JEH8i2n24Ks.backup" | base64 | sha256sum     
```
