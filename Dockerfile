FROM debian AS build

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
    make && \
    make install

FROM haugene/transmission-openvpn:5.2

COPY --from=build /usr/local/share/transmission /usr/local/share/transmission
COPY --from=build /usr/local/share/doc/transmission /usr/local/share/doc/transmission
COPY --from=build /usr/local/bin/transmission-* /usr/bin/
COPY --from=build /usr/local/share/man/man1/transmission-* /usr/local/share/man/man1/
