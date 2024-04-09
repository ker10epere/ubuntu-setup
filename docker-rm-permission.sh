sudo adduser $USER docker
# And something needs to be done so $USER always runs in group `docker` on the `Ubuntu` WSL
newgrp docker
sudo chown root:docker /var/run/docker.sock
sudo chmod g+w /var/run/docker.sock

# AFTER EXECUTING THIS, CLOSE WSL THEN RUN AGAIN