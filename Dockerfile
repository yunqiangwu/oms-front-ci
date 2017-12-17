FROM node
MAINTAINER qiangyun.wu 842269153@qq.com

RUN apt-get update && apt-get install -y --no-install-recommends \
  net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN npm install cnpm -g --registry=https://registry.npm.taobao.org
# RUN cnpm i -g npm
# RUN yarn config set registry https://registry.npm.taobao.org

COPY ./run.sh /run.sh

RUN chmod +x /run.sh
# COPY ./.babelrc /workspace/
# COPY ./package.json /workspace/
WORKDIR /workspace/

# RUN cnpm i

# RUN ls -la
EXPOSE 8000
EXPOSE 4000

CMD /run.sh
