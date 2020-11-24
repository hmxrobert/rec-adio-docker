FROM python:3.6-alpine
MAINTAINER hmxrobert

RUN apk --update --no-cache add git rtmpdump ffmpeg tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    git clone https://github.com/sun-yryr/Rec-adio.git && \
    rm -rf /Rec-adio/savefile && \
    rm -rf /Rec-adio/conf

WORKDIR /Rec-adio
RUN pip install pipenv && pipenv install

VOLUME /mnt/rec-adio

RUN ln -s /mnt/rec-adio/savefile /Rec-adio/savefile && \
    ln -s /mnt/rec-adio/conf /Rec-adio/conf

ENTRYPOINT ["/usr/local/bin/pipenv","run","start"]
