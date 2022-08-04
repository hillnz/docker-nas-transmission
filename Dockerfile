# renovate: datasource=docker depName=linuxserver/transmission versioning=regex:^(?<major>\d+)\.0?(?<minor>\d+).+-ls(?<patch>\d+)$
ARG LS_VERSION=3.00-r5-ls130
FROM linuxserver/transmission:${LS_VERSION}

RUN apk add --no-cache python3 && \
    ln -s /usr/bin/python3 /usr/bin/python

# renovate: datasource=github-releases depName=ytdl-org/youtube-dl versioning=regex:^(?<major>\d+)\.0?(?<minor>\d+)\.0?(?<patch>\d+)$
ARG YOUTUBEDL_VERSION=2021.12.17
RUN curl -L -o /usr/local/bin/youtube-dl https://github.com/ytdl-org/youtube-dl/releases/download/${YOUTUBEDL_VERSION}/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

ENV DELETE_DAYS=30
ENV DELETE_TIME=02:30

COPY root/ /
