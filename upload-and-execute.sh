#!/bin/bash

export HOSTNAME='192.168.66.5'

rsync -avz -e "ssh -i \"$HOME/.ssh/maas\""  --exclude='.git' ./ qt@$HOSTNAME:~/qt-docker-composes 

ssh -i $HOME/.ssh/maas qt@$HOSTNAME "docker-compose down --remove-orphans"

ssh -i $HOME/.ssh/maas qt@$HOSTNAME "docker-compose up"
