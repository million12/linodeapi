# million12/linode-coreos-api
FROM centos:centos7
MAINTAINER Przemyslaw Ozgo linux@ozgo.info, Marcin Ryzycki marcin@m12.io

ENV GITHUB_KEY key
ENV LINODE_KEY key

RUN \
  yum install -y epel-release && \
  yum update -y && \
  yum install -y git pwgen sshpass openssh sudo jq && \
  yum clean all

ADD . /tmp/linodeapi/

RUN \
  mv /tmp/linodeapi/linode /usr/local/bin/linode && \
  mv /tmp/linodeapi/linodeapi /usr/local/bin/linodeapi && \
  mv /tmp/linodeapi/linode_api_macro /etc/linode_api_macro && \
  rm -rf /tmp/linodeapi

ENTRYPOINT ["/usr/local/bin/linode"]
CMD ["--help"]
