# Generate key


### rsa

```
openssl genrsa -aes256 -passout pass:`cat passphrase.txt` -out private.pem 8912
openssl rsa -in private.pem -passin pass:`cat passphrase.txt` -pubout -out public.pem
```

### salt

```
tr -c -d '0123456789abcdefghijklmnopqrstuvwxyz' </dev/urandom | dd bs=32 count=1 2>/dev/null; echo
```

### SHA

```
export SHA512=$(curl https://archive.sha512 | cut -d' ' -f 1)  
echo "${SHA512} archive.bin" | sha512sum --check
```


# Info

"Authorization" header in not send over HTTP, only in HTTP(S)  
