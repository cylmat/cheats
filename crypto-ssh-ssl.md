## SHA 
export SHA512=$(curl https://archive.sha512 | cut -d' ' -f 1)  
echo "${SHA512} archive.bin" | sha512sum --check

### SSH
eval `ssh-agent -s`  
ssh-add ~/.ssh/id_rsa 
