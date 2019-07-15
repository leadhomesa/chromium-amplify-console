FROM node:12

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install \
        libcurl3-nss -y \
        chromium \
        bash \
        curl \
        git \
        openssl \
        openssh-client \
        python3 \
        wget
RUN npm install -g @aws-amplify/cli

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

ENTRYPOINT [ "bash", "-c" ]
