#!/bin/bash

echo `git show --format="%h" HEAD | head -1` > build_info.txt
echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt
export USER_NAME=vsb2007
docker build -t $USER_NAME/search_engine_crawler .
