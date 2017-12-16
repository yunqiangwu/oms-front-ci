FROM node
MAINTAINER qiangyun.wu 842269153@qq.com

RUN npm install cnpm -g --registry=https://registry.npm.taobao.org
# RUN cnpm i -g npm
# RUN yarn config set registry https://registry.npm.taobao.org

COPY ./run.sh /run.sh
# COPY ./.babelrc /workspace/
# COPY ./package.json /workspace/
WORKDIR /workspace/

# RUN cnpm i

# RUN ls -la
EXPOSE 8000
EXPOSE 4000

CMD /run.sh
