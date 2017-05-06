FROM baselibrary/confd:0.11
MAINTAINER ShawnMa <qsma@thoughtworks.com>

RUN \
  mkdir -p /usr/share/jenkins/rancher

ADD confd /etc/confd

VOLUME /usr/share/jenkins/rancher

ENTRYPOINT ["confd"]

CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
