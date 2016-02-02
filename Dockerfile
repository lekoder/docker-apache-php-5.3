FROM phusion/baseimage
MAINTAINER Mariusz 'koder' Chwalba <mariusz@chwalba.net>

RUN apt-add-repository -y ppa:hentenaar/php && \
    apt-get update && \
    apt-get install -y \
        wget \
        unzip \
        apache2-mpm-prefork nodejs npm git ssmtp \
        php5=5.3.29-0ubuntu4 \
        libapache2-mod-php5=5.3.29-0ubuntu4 \
        php5-common=5.3.29-0ubuntu4 \
        php5-cli=5.3.29-0ubuntu4 \
        php5-mysql=5.3.29-0ubuntu4 \
        php5-curl=5.3.29-0ubuntu4 \ 
         && \
    npm install -g npm && \
    npm install -g bower && \
    ln -s /usr/bin/nodejs /usr/bin/node

COPY apache2.conf /etc/apache2/
COPY syslog-errors.ini /etc/php5/apache2/conf.d/

RUN mkdir /etc/service/apache2
ADD apache2.sh /etc/service/apache2/run

COPY mods-available/* /etc/apache2/mods-available/ 

# Clean up default installation of apache
RUN a2dismod mpm_event && \
    a2enmod mpm_prefork && \
    rm -f /etc/apache2/sites-enabled/* && \
    rm -f /etc/apache2/sites-available2/* && \
    rm -f /etc/apache2/conf-available2/* && \
    rm -f /etc/apache2/conf-enabled/* && \
    rm -rf /var/www && \
    mkdir -p /var/www/web && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www/

ADD install-application.sh /usr/bin/
 
ONBUILD COPY . /var/www/
ONBUILD RUN /usr/bin/install-application.sh

EXPOSE 80
CMD ["/sbin/my_init"]
