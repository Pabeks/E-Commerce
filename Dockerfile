# Use an official PHP image with Apache
FROM php:8.0-apache

# Install dependencies and enable required modules
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd mysqli && \
    a2enmod rewrite

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the current directory contents into the container
COPY . /var/www/html/

# Expose port 80 for the Apache server
EXPOSE 80

# Restart Apache in the background when the container starts
CMD ["apache2-foreground"]