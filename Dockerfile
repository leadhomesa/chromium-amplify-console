FROM node:alpine

RUN apk update && apk upgrade && \
  echo @edge https://uk.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge https://uk.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN apk add --no-cache \
        nss@edge \
        chromium@edge \
        alsa-lib-devel \
        autoconf \
        automake \
        bash \
        bzip2 \
        bison \
        bzr \
        curl \
        cmake \
        expect \
        fontconfig \
        git \
        gcc-c++ \
        GConf2-devel \
        gtk2-devel \
        gtk3-devel \
        libnotify-devel \
        libpng \
        libpng-devel \
        libffi-devel \
        libtool \
        libX11 \
        libXext \
        libxml2 \
        libxml2-devel \
        libXScrnSaver \
        libxslt \
        libxslt-devel \
        libyaml \
        libyaml-devel \
        nss-devel \
        openssl-devel \
        openssh-clients \
        patch \
        procps \
        python3 \
        python3-devel \
        readline-devel \
        sqlite-devel \
        tar \
        tree \
        unzip \
        wget \
        which \
        xorg-x11-server-Xvfb \
        zip \
        zlib \
        zlib-devel

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

ENTRYPOINT [ "bash", "-c" ]
