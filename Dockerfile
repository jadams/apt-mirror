FROM alpine:3
RUN apk --no-cache add perl wget \
 && addgroup -g 101 -S apt-mirror \
 && adduser -h /var/spool/apt-mirror -s /bin/sh -G apt-mirror -S -D -u 101 apt-mirror
ADD apt-mirror /usr/local/bin/apt-mirror
ADD mirror.list /etc/apt/mirror.list
USER apt-mirror
VOLUME [ "/var/spool/apt-mirror" ]
ENTRYPOINT [ "apt-mirror" ]
