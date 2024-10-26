docker build . -t ubuntu-ssh

docker compose up

sshpass -p priv ssh-copy-id -p 2221 -i ~/.ssh/id_ed25519.pub ubuntu@localhost

ssh ubuntu@localhost -p 2221

ssh root@localhost -p 2221
ssh root@localhost -p 2222
ssh root@localhost -p 2223
ssh root@localhost -p 2224


ssh-keygen -t ed25519 -C "ker10epere@gmail.com" -f .ssh/id_ed25519 -N ''

docker container ls -a --format "table {{ .ID }}" | tail -n 1 | xargs -I {} docker container rm -f {}
docker compose up
