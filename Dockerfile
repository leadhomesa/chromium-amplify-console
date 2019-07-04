FROM node:alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk upgrade && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN apk add --no-cache nss@edge
RUN apk add --no-cache chromium@edge
RUN apk add --no-cache curl
RUN apk add --no-cache git
RUN apk add --no-cache openssh

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
WORKDIR /app
RUN npm install puppeteer@1.14.0