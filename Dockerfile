# this is debian image with MXE, Qt 5.6 LTS

FROM debian:jessie

# Patching wrong qtsystems tarball configuration
COPY qtsystems.mk.patch /tmp

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    autopoint \
    binutils \
    bison \
    build-essential \
    ca-certificates \
    cmake \
    debhelper \
    devscripts \
    fakeroot \
    flex \
    gcc \
    git \
    gperf \
    intltool \
    libgdk-pixbuf2.0-dev \
    libffi-dev \
    libgmp-dev \
    libmpc-dev \
    libmpfr-dev \
    libtool \
    libtool-bin \
    libz-dev \
    openssl \
    patch \
    pkg-config \
    p7zip-full \
    ruby \
    scons \
    subversion \
    texinfo \
    unzip \
    wget

# Prepare cross development environment and build qt 5.6 based on specific mxe-repo commit
RUN cd /opt && \
    git clone https://github.com/mxe/mxe.git && \
    cd mxe && \
    git checkout f6b4404 && \
    patch -p0 < /tmp/qtsystems.mk.patch && \
    make -j$(nproc) qt5 && \
    rm -rf pkg/ .git/ log/ && \
    ln -s /opt/mxe/usr/bin/i686-w64-mingw32.static-qmake-qt5 /opt/mxe/usr/bin/qmake && \
    mkdir /src

ENV PATH /opt/mxe/usr/bin:$PATH
WORKDIR /src
