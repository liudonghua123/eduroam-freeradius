ARG from=centos:centos7
FROM ${from}

#
#  Install build tools
#
RUN yum groupinstall -y "Development Tools"
RUN yum install -y rpmdevtools
RUN yum install -y openssl freeradius freeradius-mysql freeradius-utils php-common php-gd php-curl php-mysql mysql-server php-db mysql-client
RUN yum install -y apache2 libapache2-mod-php php-mail php-mime php-pear


# EPEL repository for freetds and hiredis
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

COPY docker-entrypoint.sh /

EXPOSE 1812/udp 1813/udp
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["radiusd"]
