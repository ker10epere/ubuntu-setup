# Setup SSH

```shell
# COPY CONTENTS OF PUBLIC KEY TO authorized_keys
cat .ssh/id-ed25519.pub  > .ssh/authorized_keys

# COPY CONTENTS OF PUBLIC KEY TO known_hosts
cat .ssh/id-ed25519.pub  > .ssh/known_hosts

# SET PERMISSIONS
sudo chmod 600 .ssh/authorized_keys .ssh/known_hosts

ll .ssh/

# DUPLICATE TO HAVE UBUNTU AND CLIENT SSH THE SAME
cp -r .ssh/ .ssh-client/

# CHANGE OWNER AND GROUP FOR UBUNTU SSH's
sudo chown -R 0:0 .ssh/

ll
ll .ssh/

```
