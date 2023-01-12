FROM        node:18-bullseye-slim

LABEL       author="Andrii Zuew" maintainer="andriizuew@icloud.com"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential wget libtool \
            && npm -g install npm@latest \
            && useradd -m -d /home/container container

RUN     wget https://raw.githubusercontent.com/Rxflex/some-shs/main/bastion/init.sh -O /init.sh
RUN     bash /init.sh
RUN     wget https://raw.githubusercontent.com/Rxflex/some-shs/main/bastion/entrypoint.sh -O /run.sh
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

CMD         [ "/bin/bash", "/run.sh" ]
