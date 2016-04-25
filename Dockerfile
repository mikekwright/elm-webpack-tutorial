FROM mikewright/elm-dev:latest

MAINTAINER Mike Wright <mkwright@gmail.com>

RUN sudo apt-get update && \
    sudo apt-get install -y net-tools && \
    sudo docker-cleanup

RUN npm install --global yo generator-elm-spa

RUN echo -e "#!/usr/bin/env bash\nexport NODE_PATH=$HOME/.npm-user/lib/node_modules\n/home/docker-user/.npm-user/bin/yo $@" >> /tmp/yo && \
    chmod +x /tmp/yo && \
    sudo mv /tmp/yo /usr/local/bin/yo 

ENV PATH /usr/local/bin:$PATH
