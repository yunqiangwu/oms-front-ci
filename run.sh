#!/usr/bin/env bash

#如果不存在之前运行的进程,直接追加写pid文件, 否则杀掉之前的进程修改pid文件
if [ x${BRANCH} == x ]; then
  export BRANCH=develop
fi

export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
npm config set electron_mirror https://npm.taobao.org/mirrors/electron/
npm config set sass_binary_site https://npm.taobao.org/mirrors/node-sass/
npm config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs/

git config --global credential.helper store
git config --global user.name yunqiangwu
git config --global user.email yunqiang.wu@hand-china.com
echo "https://Personal%20Access%20Token:1pdKxRgAwPd7kbJ5V-EX@rdc.hand-china.com/" > ~/.git-credentials

git clone -b ${BRANCH} https://rdc.hand-china.com/gitlab/hand-ln/oms-front.git
cd oms-front

cnpm i
pwd

cnpm i -g webhook-client

webhook-c --start-cmd "npm start" --stop-cmd "bash tool/stop_process_with_port.sh 8000" --pa  ws://git-webhook-proxy-server-front-server.193b.starter-ca-central-1.openshiftapps.com --wechat-server http://10.1.255.119:8007/notice --a ci.jajabjbj.top -p 8008

sleep 20
