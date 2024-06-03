#!/bin/bash

export HOSTNAME='192.168.66.5'

export TARGET_DIR=/home/qt/qt-docker-composes

rsync -avz -e "ssh -i \"$HOME/.ssh/maas\""  --exclude='.git' ./ qt@$HOSTNAME:~/qt-docker-composes 

ssh -i $HOME/.ssh/maas qt@$HOSTNAME "cd $TARGET_DIR && docker-compose down --remove-orphans"

ssh -i $HOME/.ssh/maas qt@$HOSTNAME "cd $TARGET_DIR && docker-compose up"
