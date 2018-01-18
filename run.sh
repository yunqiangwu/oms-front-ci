#!/usr/bin/env bash

#如果不存在之前运行的进程,直接追加写pid文件, 否则杀掉之前的进程修改pid文件
if [ x${BRANCH} == x ]; then
  export BRANCH=develop
fi

if [ x${OMS_HOST} == x ]; then
  export OMS_HOST=ci.jajabjbj.top
fi

if [ x${NOTICE_URL} == x ]; then
  export NOTICE_URL=http://10.1.255.119:8007/notice
fi

if [ x${PROXY_HOOK_URL} == x ]; then
  export PROXY_HOOK_URL=ws://git-webhook-proxy-server-front-server.193b.starter-ca-central-1.openshiftapps.com
fi

git clone -b ${BRANCH} https://rdc.hand-china.com/gitlab/hand-ln/oms-front.git
cd oms-front

cnpm i
pwd

cnpm i -g webhook-client
npm run build:dll
webhook-c --start-cmd "npm start" --stop-cmd "bash tool/stop_process_with_port.sh 8000" --pa ${PROXY_HOOK_URL} --wechat-server ${NOTICE_URL} --a ${OMS_HOST} -p 8008

sleep 20
