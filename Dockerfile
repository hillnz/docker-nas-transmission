FROM debian

RUN apt-get update && apt-get install -y \
        ca-certificates \
        cmake \
        git \
        g++ \
        gettext \
        libcurl4-openssl-dev \
        libdeflate-dev \
        libevent-dev \
        libfmt-dev \
        libminiupnpc-dev \
        libnatpmp-dev \
        libpsl-dev \
        libssl-dev \
        ninja-build \
        nodejs \
        pkg-config \
        xz-utils

RUN mkdir -p /build
WORKDIR /build

RUN git clone https://github.com/transmission/transmission && \
    cd transmission && \
    git submodule update --init --recursive && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .. && \
    make
    # make install

# FROM haugene/transmission-openvpn:4.0


