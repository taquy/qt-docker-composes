#!/bin/bash

rsync -avz -e "ssh -i \"$HOME/.ssh/maas\""  --exclude='.git' ./ qt@192.168.64.2:~/qt-docker-composes 

ssh -i $HOME/.ssh/maas qt@192.168.64.2 "docker-compose down --remove-orphans"

ssh -i $HOME/.ssh/maas qt@192.168.64.2 "docker-compose up"
