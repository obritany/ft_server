# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obritany <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/22 13:44:12 by obritany          #+#    #+#              #
#    Updated: 2021/03/22 13:44:23 by obritany         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring
RUN apt-get -y install vim

# Setup nginx
COPY ./srcs/nginx_available /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/nginx_available /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default

COPY ./srcs/myindex.nginx-debian.html /var/www/html
RUN rm /var/www/html/index.nginx-debian.html

WORKDIR /var/www/html/

# Setup phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

# Setup WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY ./srcs/wp-config.php wordpress

RUN openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Korea/L=Seoul/O=innoaca/OU=42seoul/CN=forhjy" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*

WORKDIR /
COPY ./srcs/init.sh ./
COPY ./srcs/autoindex.sh ./
CMD bash init.sh
