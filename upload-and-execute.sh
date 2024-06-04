#!/bin/bash
export TARGET_DIR=/home/qt/qt-docker-composes

rsync -avz -e "ssh -i \"$HOME/.ssh/maas\""  --exclude='.git' ./ qt@qt:~/qt-docker-composes 

ssh -i $HOME/.ssh/maas qt@qt "cd $TARGET_DIR && docker-compose down --remove-orphans"

ssh -i $HOME/.ssh/maas qt@qt "cd $TARGET_DIR && docker-compose up"
