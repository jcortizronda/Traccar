FROM arm32v7/openjdk:8u201-jdk-alpine

ENV TRACCAR_VERSION 4.10

WORKDIR /opt/traccar

RUN set -ex && \
    apk update &&\
    TERM=xterm DEBIAN_FRONTEND=noninteractive apk add unzip wget && \
    wget -qO /tmp/traccar.zip https://github.com/traccar/traccar/releases/download/v$TRACCAR_VERSION/traccar-other-$TRACCAR_VERSION.zip && \
    unzip -qo /tmp/traccar.zip -d /opt/traccar && \
    wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aHUKHcW_XGXGllERbl_svRHii3No9t-w' -O tracker-server.jar && \
    mv tracker-server.jar /opt/traccar && \
    apk del unzip wget && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["java", "-Xms512m", "-Xmx512m", "-Djava.net.preferIPv4Stack=true"]

CMD ["-jar", "tracker-server.jar", "conf/traccar.xml"]
