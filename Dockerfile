# Dockerfile

FROM php:7-apache
LABEL foxBlaze52 j.c.alvarez658@gmail.com

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

# Copy application source

COPY src /var/www/
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]

# Install nodejs to manage front end assets

RUN apt-get update && apt-get install -y nodejs

# Set Env to have mysql user if there is an error setting this change password to ""
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_ROOT_USER=root
