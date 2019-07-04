FROM node:alpine

RUN apk update && apk upgrade && \
  echo @edge https://uk.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge https://uk.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN apk add --no-cache nss@edge
RUN apk add --no-cache chromium@edge
RUN apk add --no-cache curl
RUN apk add --no-cache git
RUN apk add --no-cache openssh

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

ENTRYPOINT [ "bash", "-c" ]
