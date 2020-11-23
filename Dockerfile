FROM alpine:latest
MAINTAINER hmxrobert

RUN apk --update --no-cache add git rtmpdump ffmpeg tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    git clone https://github.com/sun-yryr/Rec-adio.git && \
    rm -rf /Rec-adio/savedata && \
    rm -rf /Rec-adio/conf

WORKDIR /Rec-adio
RUN pipenv install

VOLUME /mnt/rec-adio

RUN ln -s /mnt/rec-adio/savedata /Rec-adio/savedata && \
    ln -s /mnt/rec-adio/conf /Rec-adio/conf

ENTRYPOINT ["/usr/local/bin/pipenv","run","start"]
