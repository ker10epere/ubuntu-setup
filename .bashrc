
alias s="source ~/.bashrc"
alias cb="code ~/.bashrc"
alias dkr="sudo docker "

alias dkrls="docker container ls -a"
alias dkrl="docker logs "

function hst() {
    ip route show | grep -i default | awk '{ print $3}'
}

function dkrsp() {
    docker system prune --all --force
}

function dkrrebld(){
    docker container ls -a --format "table {{ .ID }}" | tail -n 1 | xargs -I {} docker container rm -f {}
    docker compose up
}

function dkrup() {
    docker image ls --format "table {{ .ID }} {{ .Tag }}" | grep 'dev-test' | cut -d ' ' -f 1 | xargs -I {} docker image rm -f {}
    docker builder prune -a -f
    docker compose up
}

function dkrcmpsu(){
    docker compose up
}

function dkrrmc() {
    docker container ls -a | cut -d ' ' -f 1 | tail -n +2 | xargs -I {} docker container rm -f {} 
}
