FROM ubuntu:

WORKDIR /usr/src/appchmod 777 /usr/src/app && \
    apt-get update -y && apt-get upgrade -y && \
    apt-get install -y git python3 python3-pip locales ffmpeg && \
    apt-get upgrade -y
RUN 

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update --fix-missing

RUN apt-get -qq install -y git wget curl busybox python3 python3-pip locales ffmpeg

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt && \
    apt-get -qq purge git && apt-get -y autoremove && apt-get -y autoclean
    


COPY . .

CMD ["bash","start.sh"]
