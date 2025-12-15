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

### Keygen

github
```
ssh-keygen -t ed25519 -C "your_email@example.com"
#   (to $HOME/.ssh/id_ed25519.github)
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519.github
ssh-copy-id -i ~/.ssh/id_ed25519.github.pub <user>@<host>
```

testing remote host
```
ssh -vT git@github.com
```

### public key

Display public key
```
ssh-keygen -y -f id_ed25519 > id_ed25519.github.pub
```

```
eval `ssh-agent -s`  
ssh-add $HOME/.ssh/id_rsa 

ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -P ''
sshpass -f /pass ssh-copy-id -i $HOME/.ssh/id_rsa user@host
```

### FULL

```
/**
 * CREATE DEPLOIEMENT KEYS
 * 
 * I. (to run "Deployer" on remote host, from Github actions)
 *    (Github.private -> Remote.public)
 * 
 *   A. On remote host
 * ssh-keygen -t ed25519 -C "remote-server-deploy" -f ~/.ssh/id_ed25519.remote
 * cat ~/.ssh/id_ed25519.remote.pub >> ~/.ssh/authorized_keys
 * chmod 600 ~/.ssh/id_ed25519.remote
 * chmod 600 ~/.ssh/authorized_keys
 * 
 *   B. In Github workflow
 * (copy private content "~/.ssh/id_ed25519.remote" in github secrets SSH_REMOTE_KEY)
 * echo "${{ secrets.SSH_REMOTE_KEY }}" > ~/.ssh/id_ed25519.remote
 * chmod 600 ~/.ssh/id_ed25519.remote
 * ssh-keyscan -t ed25519 -H "$REMOTE_HOST" >> ~/.ssh/known_hosts
 * ssh -i ~/.ssh/id_ed25519.remote -v "$REMOTE_USER@$REMOTE_HOST" "echo connected"
 *
 *
 *
 * II. (to clone Github private repository during remote "Deployer" process)
 *     (Remote.private -> Github.deploy)
 * 
 *   On remote host (must be called "~/.ssh/id_ed25519" so Deployer can find it)
 * ssh-keygen -t ed25519 -C "github-action-deploy" -f ~/.ssh/id_ed25519
 * ssh-keyscan -t ed25519 -H github.com >> ~/.ssh/known_hosts
 *
 *   (copy public content from "~/.ssh/id_ed25519.pub" into Github repository's deploy key)
 * GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519" git clone git@github.com:USERNAME/REPOSITORY.git
 */
```
