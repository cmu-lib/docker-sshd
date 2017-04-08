FROM centos:7
MAINTAINER bsw2@andrew.cmu.edu

RUN yum -y install openssh-server rsync && yum clean all

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-De"]

