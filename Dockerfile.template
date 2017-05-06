FROM baselibrary/confd:0.11
MAINTAINER ShawnMa <qsma@thoughtworks.com>

ADD confd /etc/confd

ENTRYPOINT ["confd"]

CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
