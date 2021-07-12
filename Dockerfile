#On choisit une debian
FROM debian:10.9

ENV DEBIAN_FRONTEND noninteractive

RUN  apt update \
&& apt install --yes --no-install-recommends \
apache2 \
php7.3 \
php7.3-cli \
php7.3-fpm \
php7.3-json \
php7.3-pdo \
php7.3-mysql \
php7.3-zip \
php7.3-gd \
php7.3-mbstring \
php7.3-curl \
php7.3-xml \
php7.3-bcmath \
php7.3-xmlrpc \
php7.3-imap \
php7.3-soap \
php7.3-intl \
php7.3-zip \
php7.3-bz2 \
php7.3-snmp \
libapache2-mod-php7.3 \
libapache2-mod-perl2 \
libapache-dbi-perl \
libapache-db-perl \
libapache2-mod-php \
php-zip \
php-pclzip \
php-gd \
php-soap \
php-curl \
php-json \
php-mbstring \
php-xml \
make \
cmake \
gcc \
git \
curl \
wget \
vim \
default-mysql-client \
perl \
libxml-simple-perl \
libcompress-zlib-perl \
libdbi-perl \
libdbd-mysql-perl \
libnet-ip-perl \
libsoap-lite-perl \
libio-compress-perl \
libapache-dbi-perl \
libapache2-mod-php \
libapache2-mod-perl2 \
libapache2-mod-perl2-dev \
ca-certificates \
&& rm -rf /var/lib/apt/lists/* 
#&& a2enmod ssl \
#&& a2ensite default-ssl

RUN cpan Mojolicious \
&& cpan XML::Entities \
&& cpan Apache2::SOAP \
&& cpan Net::IP \
&& cpan Apache::DBI \
&& cpan Switch \
&& cpan Plack::Handler \
&& cpan Archive::Zip 

COPY ocs-start.sh /home/
RUN chmod +x /home/ocs-start.sh
ENTRYPOINT ["/home/ocs-start.sh"]

EXPOSE 80 443
