docker build --progress=plain -t ansible-ssh:0.0.1 -f ./manage-node/Dockerfile ./manage-node/
docker buildx prune -af 
# "-it" is important to be able to terminate spawned ssh
docker run -it -p 9000:22 ansible-ssh:0.0.1


docker compose -f ./manage-node/docker-compose.yml  up