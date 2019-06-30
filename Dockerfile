FROM linuxserver/transmission

RUN apk add --no-cache python

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

COPY root/ /
