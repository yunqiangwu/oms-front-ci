FROM node
MAINTAINER qiangyun.wu 842269153@qq.com

RUN apt-get update && apt-get install -y --no-install-recommends \
  net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN npm install cnpm -g --registry=https://registry.npm.taobao.org
# RUN cnpm i -g npm
# RUN yarn config set registry https://registry.npm.taobao.org

# COPY ./.babelrc /workspace/
# COPY ./package.json /workspace/
WORKDIR /workspace/


RUN export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node \
  && export NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs \
  && npm config set electron_mirror https://npm.taobao.org/mirrors/electron/ \
  && npm config set sass_binary_site https://npm.taobao.org/mirrors/node-sass/ \
  && npm config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs/ \
  && git config --global credential.helper store \
  && git config --global user.name yunqiangwu \
  && git config --global user.email yunqiang.wu@hand-china.com \
  && echo "https://Personal%20Access%20Token:1pdKxRgAwPd7kbJ5V-EX@rdc.hand-china.com/" > ~/.git-credentials \
  && git clone -b develop https://rdc.hand-china.com/gitlab/hand-ln/oms-front.git \
  && cd oms-front && cnpm i

RUN rm -rf /workspace/oms-front

# RUN cnpm i

# RUN ls -la


COPY ./run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8000
EXPOSE 4000

CMD /run.sh
