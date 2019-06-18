alias docker-rm-stopped='docker rm $(docker ps -a -q)'
alias docker-rmi-untagged='docker rmi $(docker images -q --filter "dangling=true")'