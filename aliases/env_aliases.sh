# env aliases

## conda environments
alias cie='conda info --envs'
function ca() { conda activate "$@"  }

## docker
# list all images
alias dri='docker images'
# list all containers
alias drc='docker ps -a'
# delete container
drm() { docker rm $1}
# delete image
drmi() { docker rmi $1}
# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
# Dockerfile build, e.g., $dbu alizaidi/test
dbu() { docker build -t=$1 .; }

## bonsai
alias bbl="bonsai brain list"
alias bbsl="bonsai simulator unmanaged list"
bbc() { bonsai brain create -b $1}