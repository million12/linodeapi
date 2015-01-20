#
# million12/linode-coreos-api
#

FROM centos:centos7
MAINTAINER Przemyslaw Ozgo linux@ozgo.info, Marcin Ryzycki marcin@m12.io

RUN \
  yum update -y && \
  yum install -y epel-release && \
  yum install -y git pwgen sshpass openssh sudo jq && \
  yum clean all

ADD . /usr/local/share/

RUN \
  chmod +x /usr/local/share/linode && \
  ln -s /usr/local/share/linode /usr/local/bin/linode && \
  ln -s /usr/local/share/linodeapi /usr/local/bin/linodeapi

ENV TERM xterm-256color

ENTRYPOINT ["/usr/local/bin/linode"]
CMD ["--help"]
