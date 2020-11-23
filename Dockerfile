FROM alpine:latest
MAINTAINER hmxrobert

RUN apk --update --no-cache add git rtmpdump ffmpeg tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \

ENV LANG ja_JP.UTF-8
    
RUN git clone https://github.com/sun-yryr/Rec-adio.git \
    cd Rec-adio \
    pipenv install

VOLUME /mnt/agqr

ENTRYPOINT ["init.sh"]
