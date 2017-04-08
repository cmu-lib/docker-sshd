FROM alpine:latest
MAINTAINER bsw2@andrew.cmu.edu

RUN apk update && apk add bash openssh rsync &&  rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 22
VOLUME ["/etc/ssh"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-De"]
