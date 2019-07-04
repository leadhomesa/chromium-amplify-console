FROM node:alpine

RUN apk update && apk upgrade && \
  echo @edge https://uk.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge https://uk.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN apk add --no-cache \
        nss@edge \
        chromium@edge \
        bash \
        curl \
        git \
        openssl \
        openssh \
        python3 \
        wget \
        which

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

ENTRYPOINT [ "bash", "-c" ]
