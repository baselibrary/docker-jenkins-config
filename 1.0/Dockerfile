FROM baselibrary/confd:0.11
MAINTAINER ShawnMa <qsma@thoughtworks.com>

ENV TINI_VERSION v0.14.0

## Packages
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN \
  chmod a+x /usr/bin/tini &&\
  mkdir -p /usr/share/jenkins/rancher

## Configurations
ADD confd /etc/confd

## Scripts
ADD jenkins.sh /usr/share/jenkins/rancher/jenkins.sh
RUN chmod a+x  /usr/share/jenkins/rancher/jenkins.sh

VOLUME /usr/share/jenkins/rancher

ENTRYPOINT ["confd"]

CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
