#!/usr/bin/env bash

#如果不存在之前运行的进程,直接追加写pid文件, 否则杀掉之前的进程修改pid文件
if [ x${BRANCH} == x ]; then
  export BRANCH=develop
fi
git clone -b ${BRANCH} https://rdc.hand-china.com/gitlab/hand-ln/oms-front.git
cd oms-front
pwd
ls -la
env
sleep 20
