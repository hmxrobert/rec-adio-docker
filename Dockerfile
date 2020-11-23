FROM alpine:latest
MAINTAINER hmxrobert

RUN apk --update --no-cache add git rtmpdump ffmpeg tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    
RUN git clone https://github.com/sun-yryr/Rec-adio.git && \
    rm -rf /Rec-adio/savedata && \
    rm -rf /Rec-adio/config

WORKDIR /Rec-adio
RUN pipenv install

VOLUME /mnt/rec-adio

RUN ln -s /mnt/rec-adio/savedata /Rec-adio/savedata && \
    ln -s /mnt/rec-adio/config /Rec-adio/config

ENTRYPOINT ["/usr/local/bin/pipenv","run","start"]
