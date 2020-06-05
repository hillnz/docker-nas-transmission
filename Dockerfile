FROM linuxserver/transmission

RUN apk add --no-cache python3

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

ENV DELETE_DAYS=30
ENV DELETE_TIME=02:30

COPY root/ /
